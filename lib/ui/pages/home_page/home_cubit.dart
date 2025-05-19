import 'dart:io';

import 'package:auction_app/domain/models/signalr_events/signalr_events.dart';
import 'package:auction_app/domain/models/user/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:auction_app/data/services/service_interfaces.dart';
import 'package:auction_app/domain/models/auction/auction.dart';
import 'package:auction_app/domain/models/paged_auction_result/paged_auction_result.dart';


part 'home_cubit.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded({
    required PagedAuctionResult activeAuctions,
    required PagedAuctionResult myAuctions,
    required PagedAuctionResult participatedAuctions,
    @Default(0) int currentTab,
  }) = _Loaded;
  const factory HomeState.error(String message) = _Error;
}

class HomeCubit extends Cubit<HomeState> {
  final IAuctionService auctionService;
  final ISignalRService signalRService;
  final Function(OutbidNotification notification) onOutbidNotification;
  late User user;
  static const int _pageSize = 10;

  HomeCubit({
    required this.auctionService,
    required this.signalRService,
    required this.user,
    required this.onOutbidNotification
  }) : super(const HomeState.initial()) {
    _initSignalR();
    loadAuctions();
  }

  void _initSignalR() {
    signalRService.onNewAuctionNotification().listen((notification) async {
      try {
        final auction = await auctionService.getAuctionById(notification.auctionId);
        _addNewAuction(auction);
      } on DioException catch (e) {
        emit(HomeState.error(e.response?.data['message'] ?? 'Failed to fetch new auction'));
      }
    });
    signalRService.onOutbidNotification().listen(onOutbidNotification);
    signalRService.onAuctionStatusUpdate().listen((update) {
      _updateAuctionStatus(update.auctionId, update.status);
    });
  }

  Future<void> loadAuctions({bool loadMore = false}) async {
    state.maybeWhen(
      loaded: (active, my, participated, tab) {
        if (loadMore) {
          _loadMoreAuctions(active, my, participated, tab);
        } else {
          _loadInitialAuctions();
        }
      },
      orElse: () => _loadInitialAuctions(),
    );
  }

  Future<void> _loadInitialAuctions() async {
    emit(const HomeState.loading());
    try {
      final activeAuctions = await auctionService.getActiveAuctions(1, _pageSize);
      final myAuctions = await auctionService.getUserCreatedAuctions(1, _pageSize);
      final participatedAuctions =
      await auctionService.getUserParticipatedAuctions(1, _pageSize);
      emit(HomeState.loaded(
        activeAuctions: activeAuctions,
        myAuctions: myAuctions,
        participatedAuctions: participatedAuctions,
      ));
    } on DioException catch (e) {
      emit(HomeState.error(e.response?.data['message'] ?? 'Failed to load auctions'));
    }
  }

  Future<void> _loadMoreAuctions(
      PagedAuctionResult active,
      PagedAuctionResult my,
      PagedAuctionResult participated,
      int currentTab
  ) async {
    try {
      late PagedAuctionResult newResult;
      if (currentTab == 0) {
        if (active.totalCount == active.auctions.length){
          return;
        }
        newResult = await auctionService.getActiveAuctions(active.pageNumber + 1, _pageSize);
      } else if (currentTab == 1) {
        if (my.totalCount == my.auctions.length){
          return;
        }
        newResult = await auctionService.getUserCreatedAuctions(my.pageNumber + 1, _pageSize);
      } else {
        if (participated.totalCount == participated.auctions.length){
          return;
        }
        newResult = await auctionService.getUserParticipatedAuctions(participated.pageNumber + 1, _pageSize);
      }
      state.maybeWhen(
        loaded: (active, my, participated, tab) {
          final updatedActive = currentTab == 0
          ? PagedAuctionResult(
            auctions: [...active.auctions, ...newResult.auctions],
            totalCount: newResult.totalCount,
            pageNumber: newResult.pageNumber,
            pageSize: _pageSize,
          ) : active;
          final updatedMy = currentTab == 1
          ? PagedAuctionResult(
            auctions: [...my.auctions, ...newResult.auctions],
            totalCount: newResult.totalCount,
            pageNumber: newResult.pageNumber,
            pageSize: _pageSize,
          ) : my;
          final updatedParticipated = currentTab == 2
          ? PagedAuctionResult(
            auctions: [...participated.auctions, ...newResult.auctions],
            totalCount: newResult.totalCount,
            pageNumber: newResult.pageNumber,
            pageSize: _pageSize,
          ) : participated;
          emit(
            HomeState.loaded(
              activeAuctions: updatedActive,
              myAuctions: updatedMy,
              participatedAuctions: updatedParticipated,
              currentTab: tab,
            )
          );
        },
        orElse: () {},
      );
    } on DioException catch (e) {
      emit(HomeState.error(e.response?.data['message'] ?? 'Failed to load more auctions'));
    }
  }

  void _addNewAuction(Auction auction) {
    state.maybeWhen(
      loaded: (active, my, participated, tab) {
        if (active.auctions.any((a) => a.id == auction.id)){
          return;
        }
        final isOwner = user.id == auction.ownerId;
        emit(HomeState.loaded(
          activeAuctions: PagedAuctionResult(
            auctions: [auction, ...active.auctions],
            totalCount: active.totalCount + 1,
            pageNumber: active.pageNumber,
            pageSize: _pageSize,
          ),
          myAuctions: isOwner
          ? PagedAuctionResult(
            auctions: [auction, ...my.auctions],
            totalCount: my.totalCount + 1,
            pageNumber: my.pageNumber,
            pageSize: _pageSize,
          ) : my,
          participatedAuctions: participated,
          currentTab: tab,
        ));
      },
      orElse: () {},
    );
  }

  void _updateAuctionStatus(int auctionId, String status) {
    state.maybeWhen(
      loaded: (active, my, participated, tab) async {
        final newAuction = await auctionService.getAuctionById(auctionId);
        Auction updateAuction(Auction a) {
          return a.id == auctionId ? a.copyWith(
            status: status,
            updatedAt:newAuction.updatedAt,
            price: newAuction.price,
            winnerId: newAuction.winnerId,
            winnerUsername: newAuction.winnerUsername
          ) : a;
        }
        final updatedActiveAuctions = status == 'Closing' || status == 'Sold'
          ? PagedAuctionResult(
            auctions: active.auctions.where((a) => a.id != auctionId).map(updateAuction).toList(),
            totalCount: active.totalCount - 1,
            pageNumber: active.pageNumber,
            pageSize: _pageSize,
          ) : PagedAuctionResult(
            auctions: active.auctions.map(updateAuction).toList(),
            totalCount: active.totalCount,
            pageNumber: active.pageNumber,
            pageSize: _pageSize,
          );
        emit(HomeState.loaded(
          activeAuctions: updatedActiveAuctions,
          myAuctions: PagedAuctionResult(
            auctions: my.auctions.map(updateAuction).toList(),
            totalCount: my.totalCount,
            pageNumber: my.pageNumber,
            pageSize: _pageSize,
          ),
          participatedAuctions: PagedAuctionResult(
            auctions: participated.auctions.map(updateAuction).toList(),
            totalCount: participated.totalCount,
            pageNumber: participated.pageNumber,
            pageSize: _pageSize,
          ),
          currentTab: tab,
        ));
      },
      orElse: () {},
    );
  }

  void changeTab(int index) {
    state.maybeWhen(
      loaded: (active, my, participated, _) {
        emit(HomeState.loaded(
          activeAuctions: active,
          myAuctions: my,
          participatedAuctions: participated,
          currentTab: index,
        ));
      },
      orElse: () {},
    );
  }

  Future<void> createAuction({
    required String title,
    required String description,
    File? image,
  }) async {
    try {
      final List<MultipartFile>? imageFile = image != null
          ? [await MultipartFile.fromFile(image.path, filename: 'auction_image.jpg')]
          : null;
      final created = await auctionService.createAuction(title, description, imageFile);
      _addNewAuction(created);
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        error: e.error,
      );
    }
  }

  void participate(Auction auction) {
    state.maybeWhen(
      loaded: (activeAuctions, myAuctions, participatedAuctions, currentTab) {
        if (participatedAuctions.auctions.any((a) => a.id == auction.id)){
          return;
        }
        emit(HomeState.loaded(
          activeAuctions: activeAuctions,
          myAuctions: myAuctions,
          participatedAuctions: PagedAuctionResult(
            auctions: [auction, ...participatedAuctions.auctions],
            totalCount: participatedAuctions.totalCount + 1,
            pageNumber: participatedAuctions.pageNumber,
            pageSize: _pageSize,
          ),
          currentTab: currentTab,
        ));
      },
      orElse: () {},
    );
  }
}
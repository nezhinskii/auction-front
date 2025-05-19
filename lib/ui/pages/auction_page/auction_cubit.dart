import 'dart:async';

import 'package:auction_app/domain/models/signalr_events/signalr_events.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:auction_app/core/auth/auth_provider.dart';
import 'package:auction_app/data/services/service_interfaces.dart';
import 'package:auction_app/domain/models/auction/auction.dart';
import 'package:auction_app/domain/models/bid/bid.dart';
import 'package:auction_app/domain/models/place_bid_dto/place_bid_dto.dart';
import 'package:auction_app/domain/models/sell_auction_dto/sell_auction_dto.dart';

part 'auction_cubit.freezed.dart';

@freezed
class AuctionState with _$AuctionState {
  const factory AuctionState.initial() = _Initial;
  const factory AuctionState.loading() = _Loading;
  const factory AuctionState.loaded({
    required Auction auction,
    required List<Bid> bids,
  }) = _Loaded;
  const factory AuctionState.error(String message) = _Error;
}

class AuctionCubit extends Cubit<AuctionState> {
  final IAuctionService auctionService;
  final ISignalRService signalRService;
  StreamSubscription<Bid>? bidsSubscription;
  StreamSubscription<AuctionStatusUpdate>? statusesSubscription;
  final int auctionId;

  AuctionCubit({
    required this.auctionService,
    required this.signalRService,
    required this.auctionId,
  }) : super(const AuctionState.initial()) {
    _init();
  }

  void _init() async {
    emit(const AuctionState.loading());
    try {
      await signalRService.joinAuction(auctionId);
      final auction = await auctionService.getAuctionById(auctionId);
      final bids = await auctionService.getAuctionBids(auctionId);
      emit(AuctionState.loaded(auction: auction, bids: bids));

      bidsSubscription = signalRService.onBidUpdate().listen((bid) async {
        if (bid.auctionId == auctionId){
          state.maybeWhen(
            loaded: (auction, bids) {
              emit(AuctionState.loaded(
                auction: auction,
                bids: [bid, ...bids],
              ));
            },
            orElse: () {},
          );
          final newAuction = await auctionService.getAuctionById(auctionId);
          state.maybeWhen(
            loaded: (auction, bids) {
              emit(AuctionState.loaded(
                auction: newAuction,
                bids: bids,
              ));
            },
            orElse: () {},
          );
        }
      });

    statusesSubscription = signalRService.onAuctionStatusUpdate().listen((update) async {
        if (update.auctionId == auctionId) {
          state.maybeWhen(
            loaded: (auction, bids) {
              emit(AuctionState.loaded(
                auction: auction.copyWith(status: update.status),
                bids: bids,
              ));
            },
            orElse: () {},
          );
          final newAuction = await auctionService.getAuctionById(auctionId);
          state.maybeWhen(
            loaded: (auction, bids) {
              emit(AuctionState.loaded(
                auction: newAuction,
                bids: bids,
              ));
            },
            orElse: () {},
          );
        }
      });
    } on DioException catch (e) {
      emit(AuctionState.error(e.response?.data['message'] ?? 'Failed to load auction'));
    }
  }

  Future<void> placeBid(double amount) async {
    try {
      await auctionService.placeBid(
        auctionId,
        PlaceBidDto(amount: amount),
      );
    } on DioException catch (e) {
      emit(AuctionState.error(e.response?.data['message'] ?? 'Failed to place bid'));
    }
  }

  Future<void> closeAuction() async {
    try {
      await auctionService.closeAuction(auctionId);
    } on DioException catch (e) {
      emit(AuctionState.error(e.response?.data['message'] ?? 'Failed to close auction'));
    }
  }

  Future<void> sellAuction(int winningBidId) async {
    try {
      await auctionService.sellAuction(
        auctionId,
        SellAuctionDto(winningBidId: winningBidId),
      );
    } on DioException catch (e) {
      emit(AuctionState.error(e.response?.data['message'] ?? 'Failed to sell auction'));
    }
  }

  @override
  Future<void> close() async {
    bidsSubscription?.cancel();
    statusesSubscription?.cancel();
    await signalRService.leaveAuction(auctionId);
    super.close();
  }
}
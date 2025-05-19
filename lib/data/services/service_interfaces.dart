import 'package:auction_app/domain/models/auction/auction.dart';
import 'package:auction_app/domain/models/bid/bid.dart';
import 'package:auction_app/domain/models/login_response/login_response.dart';
import 'package:auction_app/domain/models/paged_auction_result/paged_auction_result.dart';
import 'package:auction_app/domain/models/register_dto/register_dto.dart';
import 'package:auction_app/domain/models/login_dto/login_dto.dart';
import 'package:auction_app/domain/models/place_bid_dto/place_bid_dto.dart';
import 'package:auction_app/domain/models/sell_auction_dto/sell_auction_dto.dart';
import 'package:auction_app/domain/models/signalr_events/signalr_events.dart';
import 'package:auction_app/domain/models/user/user.dart';
import 'package:dio/dio.dart';

abstract class IAuthService {
  Future<void> register(RegisterDto body);
  Future<LoginResponse> login(LoginDto body);
  Future<User> getMe();
}

abstract class IAuctionService {
  Future<PagedAuctionResult> getActiveAuctions(int pageNumber, int pageSize);
  Future<PagedAuctionResult> getUserCreatedAuctions(int pageNumber, int pageSize);
  Future<PagedAuctionResult> getUserParticipatedAuctions(int pageNumber, int pageSize);
  Future<Auction> getAuctionById(int id);
  Future<Auction> createAuction(String title, String description, List<MultipartFile>? image);
  Future<void> deleteAuction(int id);
  Future<void> closeAuction(int id);
  Future<void> sellAuction(int id, SellAuctionDto body);
  Future<void> placeBid(int id, PlaceBidDto body);
  Future<List<Bid>> getAuctionBids(int id);
}

abstract class ISignalRService {
  Future<void> startConnection();
  Future<void> stopConnection();
  Future<void> joinAuction(int auctionId);
  Future<void> leaveAuction(int auctionId);
  Stream<Bid> onBidUpdate();
  Stream<AuctionStatusUpdate> onAuctionStatusUpdate();
  Stream<NewAuctionNotification> onNewAuctionNotification();
}
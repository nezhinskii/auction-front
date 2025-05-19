import 'package:auction_app/data/services/service_interfaces.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:auction_app/domain/models/auction/auction.dart';
import 'package:auction_app/domain/models/bid/bid.dart';
import 'package:auction_app/domain/models/paged_auction_result/paged_auction_result.dart';
import 'package:auction_app/domain/models/place_bid_dto/place_bid_dto.dart';
import 'package:auction_app/domain/models/sell_auction_dto/sell_auction_dto.dart';

part 'auction_service.g.dart';

@RestApi()
abstract class AuctionService implements IAuctionService {
  factory AuctionService(Dio dio, {String baseUrl}) = _AuctionService;

  @override
  @GET('/auctions')
  @Headers({'Authorization': 'Bearer'})
  Future<PagedAuctionResult> getActiveAuctions(
    @Query('pageNumber') int pageNumber,
    @Query('pageSize') int pageSize,
  );

  @override
  @GET('/auctions/created')
  @Headers({'Authorization': 'Bearer'})
  Future<PagedAuctionResult> getUserCreatedAuctions(
    @Query('pageNumber') int pageNumber,
    @Query('pageSize') int pageSize,
  );

  @override
  @GET('/auctions/participated')
  @Headers({'Authorization': 'Bearer'})
  Future<PagedAuctionResult> getUserParticipatedAuctions(
    @Query('pageNumber') int pageNumber,
    @Query('pageSize') int pageSize,
  );

  @override
  @GET('/auctions/{id}')
  @Headers({'Authorization': 'Bearer'})
  Future<Auction> getAuctionById(@Path('id') int id);

  @override
  @POST('/auctions')
  @MultiPart()
  @Headers({'Authorization': 'Bearer'})
  Future<Auction> createAuction(
    @Part(name: 'title') String title,
    @Part(name: 'description') String description,
    @Part(name: 'image') List<MultipartFile>? image,
  );

  @override
  @DELETE('/auctions/{id}')
  @Headers({'Authorization': 'Bearer'})
  Future<void> deleteAuction(@Path('id') int id);

  @override
  @PUT('/auctions/{id}/close')
  @Headers({'Authorization': 'Bearer'})
  Future<void> closeAuction(@Path('id') int id);

  @override
  @PUT('/auctions/{id}/sell')
  @Headers({'Authorization': 'Bearer'})
  Future<void> sellAuction(
    @Path('id') int id,
    @Body() SellAuctionDto body,
  );

  @override
  @POST('/auctions/{id}/bid')
  @Headers({'Authorization': 'Bearer'})
  Future<void> placeBid(
    @Path('id') int id,
    @Body() PlaceBidDto body,
  );

  @override
  @GET('/auctions/{id}/bids')
  @Headers({'Authorization': 'Bearer'})
  Future<List<Bid>> getAuctionBids(@Path('id') int id);
}
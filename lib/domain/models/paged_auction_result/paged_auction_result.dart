import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:auction_app/domain/models/auction/auction.dart';

part 'paged_auction_result.freezed.dart';
part 'paged_auction_result.g.dart';

@freezed
class PagedAuctionResult with _$PagedAuctionResult {
  const factory PagedAuctionResult({
    required List<Auction> auctions,
    required int totalCount,
    required int pageNumber,
    required int pageSize,
  }) = _PagedAuctionResult;

  factory PagedAuctionResult.fromJson(Map<String, dynamic> json) => _$PagedAuctionResultFromJson(json);
}
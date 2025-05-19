import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_auction_dto.freezed.dart';
part 'sell_auction_dto.g.dart';

@freezed
class SellAuctionDto with _$SellAuctionDto {
  const factory SellAuctionDto({
    required int winningBidId,
  }) = _SellAuctionDto;

  factory SellAuctionDto.fromJson(Map<String, dynamic> json) => _$SellAuctionDtoFromJson(json);
}
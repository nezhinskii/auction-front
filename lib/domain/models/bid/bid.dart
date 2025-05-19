import 'package:freezed_annotation/freezed_annotation.dart';

part 'bid.freezed.dart';
part 'bid.g.dart';

@freezed
class Bid with _$Bid {
  const factory Bid({
    required int id,
    required double amount,
    required int userId,
    required int auctionId,
    required String userName,
    required DateTime bidTime,
  }) = _Bid;

  factory Bid.fromJson(Map<String, dynamic> json) => _$BidFromJson(json);
}
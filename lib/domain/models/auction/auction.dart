import 'package:freezed_annotation/freezed_annotation.dart';

part 'auction.freezed.dart';
part 'auction.g.dart';

@freezed
class Auction with _$Auction {
  const factory Auction({
    required int id,
    required String title,
    required String description,
    required String status,
    String? imageUrl,
    required int ownerId,
    required String ownerUsername,
    int? winnerId,
    String? winnerUsername,
    required DateTime createdAt,
    required DateTime updatedAt,
    double? price
  }) = _Auction;

  factory Auction.fromJson(Map<String, dynamic> json) => _$AuctionFromJson(json);
}
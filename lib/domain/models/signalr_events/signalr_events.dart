import 'package:freezed_annotation/freezed_annotation.dart';

part 'signalr_events.freezed.dart';

@freezed
class AuctionStatusUpdate with _$AuctionStatusUpdate {
  const factory AuctionStatusUpdate({
    required int auctionId,
    required String status,
  }) = _AuctionStatusUpdate;
}

@freezed
class NewAuctionNotification with _$NewAuctionNotification {
  const factory NewAuctionNotification({
    required int auctionId,
    required String title,
  }) = _NewAuctionNotification;
}
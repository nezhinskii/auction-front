import 'dart:async';
import 'package:auction_app/core/network/dio_client.dart';
import 'package:auction_app/data/services/service_interfaces.dart';
import 'package:auction_app/domain/models/bid/bid.dart';
import 'package:auction_app/domain/models/signalr_events/signalr_events.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class SignalRService implements ISignalRService {
  HubConnection? _hubConnection;

  @override
  Future<void> startConnection() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'auth_token');
    _hubConnection = HubConnectionBuilder()
    .withUrl(
      DioClient.getSignalRHubUrl(),
      options: HttpConnectionOptions(
        accessTokenFactory: () async => token ?? '',
      ),
    ).build();
    await _hubConnection!.start();
  }

  @override
  Future<void> stopConnection() async {
    if (_hubConnection != null) {
      await _hubConnection!.stop();
    }
  }

  @override
  Future<void> joinAuction(int auctionId) async {
    if (_hubConnection != null) {
      await _hubConnection!.invoke('JoinAuction', args: [auctionId]);
    }
  }

  @override
  Future<void> leaveAuction(int auctionId) async {
    if (_hubConnection != null) {
      await _hubConnection!.invoke('LeaveAuction', args: [auctionId]);
    }
  }

  @override
  Stream<Bid> onBidUpdate() {
    final controller = StreamController<Bid>();
    _hubConnection?.on('ReceiveBidUpdate', (args) {
      if (args != null && args.isNotEmpty) {
        final bidJson = args[0] as Map<String, dynamic>;
        final bid = Bid.fromJson(bidJson);
        controller.add(bid);
      }
    });
    return controller.stream;
  }

  @override
  Stream<AuctionStatusUpdate> onAuctionStatusUpdate() {
    final controller = StreamController<AuctionStatusUpdate>();
    _hubConnection?.on('ReceiveAuctionStatusUpdate', (args) {
      if (args != null && args.length >= 2) {
        controller.add(AuctionStatusUpdate(
          auctionId: args[0] as int,
          status: args[1] as String,
        ));
      }
    });
    return controller.stream;
  }

  @override
  Stream<NewAuctionNotification> onNewAuctionNotification() {
    final controller = StreamController<NewAuctionNotification>();
    _hubConnection?.on('ReceiveNewAuctionNotification', (args) {
      if (args != null && args.length >= 2) {
        controller.add(NewAuctionNotification(
          auctionId: args[0] as int,
          title: args[1] as String,
        ));
      }
    });
    return controller.stream;
  }
}
import 'package:auction_app/core/network/dio_client.dart';
import 'package:auction_app/data/services/auth_service.dart';
import 'package:auction_app/data/services/auction_service.dart';
import 'package:auction_app/data/services/signalr_service.dart';
import 'package:auction_app/data/services/service_interfaces.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();

  factory ServiceLocator() => _instance;

  ServiceLocator._internal();

  late IAuthService _authService;
  late IAuctionService _auctionService;
  late ISignalRService _signalRService;

  IAuthService get authService => _authService;
  IAuctionService get auctionService => _auctionService;
  ISignalRService get signalRService => _signalRService;

  void init() {
    final dio = DioClient.create();
    _authService = AuthService(dio);
    _auctionService = AuctionService(dio);
    _signalRService = SignalRService();
  }
}
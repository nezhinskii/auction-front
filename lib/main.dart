import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:auction_app/core/auth/auth_provider.dart';
import 'package:auction_app/core/di/service_locator.dart';
import 'package:auction_app/core/navigation/app_router.dart';
import 'package:auction_app/ui/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();

  final authProvider = AuthProvider();
  const storage = FlutterSecureStorage();
  final authService = ServiceLocator().authService;
  final token = await storage.read(key: 'auth_token');
  if (token != null) {
    try {
      final user = await authService.getMe();
      await ServiceLocator().signalRService.startConnection();
      authProvider.signIn(user);
    } catch (_) {
      await storage.delete(key: 'auth_token');
    }
  }

  runApp(AuctionApp(authProvider: authProvider));
}

class AuctionApp extends StatelessWidget {
  final AuthProvider authProvider;

  const AuctionApp({super.key, required this.authProvider});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: authProvider,
      child: MaterialApp(
        title: 'Auction App',
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
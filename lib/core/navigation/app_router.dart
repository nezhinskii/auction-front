import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auction_app/core/auth/auth_provider.dart';
import 'package:auction_app/ui/pages/login_page/login_page.dart';
import 'package:auction_app/ui/pages/home_page/home_page.dart';
import 'package:auction_app/ui/pages/register_page/register_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(
          builder: (context) {
            final authProvider = context.read<AuthProvider>();
            return authProvider.user != null
              ? const HomePage()
              : const LoginPage();
          },
        );
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:auction_app/domain/models/user/user.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  User? get user => _user;
  User get currentUser => _user!;

  void signIn(User user) {
    _user = user;
    notifyListeners();
  }

  Future<void> signOut() async {
    _user = null;
    await _storage.delete(key: 'auth_token');
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:xyz_cart/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService authService;

  AuthProvider(this.authService);

  Map<String, dynamic>? _userData;

  Map<String, dynamic>? get userData => _userData;

  Future<void> login(String email, String password) async {
    try {
      final userData = await authService.login(email, password);
      _userData = userData;
      notifyListeners();
    } catch (e) {
      print('Authentication error: $e');
    }
  }
}

import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _username;
  bool _isLoggedIn = false;

  String? get username => _username;
  bool get isLoggedIn => _isLoggedIn;

  Future<bool> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Simple validation (in real app, validate with backend)
    if (email.isNotEmpty && password.isNotEmpty) {
      _username = email.split('@')[0];
      _isLoggedIn = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _username = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}

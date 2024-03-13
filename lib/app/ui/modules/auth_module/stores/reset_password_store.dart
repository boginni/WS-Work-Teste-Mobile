import 'package:flutter/material.dart';

class ResetPasswordStore extends ChangeNotifier {
  final emailController = TextEditingController();

  bool _isLoading = false;

  bool _emailSent = false;

  ResetPasswordStore();

  bool get emailSent => _emailSent;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  set emailSent(bool emailSent) {
    _emailSent = emailSent;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class ResetPasswordStore extends ChangeNotifier {
  final emailController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}

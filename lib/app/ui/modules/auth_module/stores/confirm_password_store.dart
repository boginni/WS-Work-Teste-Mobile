import 'package:flutter/cupertino.dart';
import 'package:ws_work_test_mobile/app/domain/dto/entities/user/user_entity.dart';

class ConfirmPasswordStore extends ChangeNotifier {
  UserEntity? user;

  bool _isLoading = true;

  ConfirmPasswordStore();

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

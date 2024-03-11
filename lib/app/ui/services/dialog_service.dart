import 'package:flutter/cupertino.dart';

abstract class DialogService {
  Future<T?> showDialog<T>(Widget child);

  void alertSnackBar(String text);
}
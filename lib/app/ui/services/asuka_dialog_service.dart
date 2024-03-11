import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/services/dialog_service.dart';

class AsukaDialogService extends DialogService {
  @override
  void alertSnackBar(String text) {
    AsukaSnackbar.alert(text).show();
  }

  @override
  Future<T?> showDialog<T>(Widget child) async {
    return await Asuka.showDialog(builder: (context) => child);
  }
}

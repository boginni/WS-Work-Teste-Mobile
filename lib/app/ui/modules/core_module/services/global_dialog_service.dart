import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/services/dialog_service.dart';
import 'package:ws_work_test_mobile/app/ui/widgets/providers/global_scaffold_provider.dart';

class GlobalDialogService extends DialogService {
  BuildContext? get _context => GlobalScaffoldProvider.scaffoldKey.currentContext;

  @override
  void alertSnackBar(TextBuilder builder) {
    if (_context != null) {
      ScaffoldMessenger.of(_context!).showSnackBar(
        SnackBar(
          content: Text(builder(_context!)),
        ),
      );
    }
  }

  @override
  Future<T?> showDialog<T>(WidgetBuilder builder) async {
    if (_context != null) {
      return await showDialog<T>(
        (context) => builder(context),
      );
    }

    return null;
  }
}

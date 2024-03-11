import 'package:flutter/cupertino.dart';

typedef TextBuilder = String Function(BuildContext context);

abstract class DialogService {
  Future<T?> showDialog<T>(WidgetBuilder builder);

  void alertSnackBar(TextBuilder builder);
}
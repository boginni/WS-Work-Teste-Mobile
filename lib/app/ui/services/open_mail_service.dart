import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

abstract class OpenMailService {
  Future<void> openMailApp(BuildContext context);
}

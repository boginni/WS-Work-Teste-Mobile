import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

Future<void> openMailApp(BuildContext context) async {
  var result = await OpenMailApp.openMailApp();

  if (!context.mounted) {
    return;
  }

  final bool cannotOpen = result.didOpen == false && result.canOpen == false;
  final bool couldOpen = result.didOpen == true || result.canOpen == true;

  if (cannotOpen) {
    await _showNoMailAppsDialog(context);
    return;
  }

  if (couldOpen && result.options.length > 1) {
    await _showEmailAppPickerDialog(context, result);
  }
}

Future<void> _showEmailAppPickerDialog(BuildContext context, OpenMailAppResult result) async {
  await showDialog(
    context: context,
    builder: (_) {
      return MailAppPickerDialog(
        mailApps: result.options,
      );
    },
  );
}

Future<void> _showNoMailAppsDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(context.appLocalizations.open_mail_app),
        content: Text(context.appLocalizations.no_mail_app_installed),
        actions: <Widget>[
          FilledButton(
            child: Text(context.appLocalizations.ok),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}

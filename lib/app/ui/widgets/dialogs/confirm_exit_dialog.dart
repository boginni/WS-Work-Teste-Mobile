import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

class ConfirmExitDialog extends StatelessWidget {
  const ConfirmExitDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  static Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return ConfirmExitDialog(
              onConfirm: () {
                Navigator.of(context).pop(true);
              },
              onCancel: () {
                Navigator.of(context).pop(false);
              },
            );
          },
        ) ??
        false;
  }

  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.appLocalizations.leaving_ask),
      content: Text(context.appLocalizations.are_you_sure_you_want_to_leave),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text(context.appLocalizations.cancel),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(context.appLocalizations.leave),
        ),
      ],
    );
  }
}

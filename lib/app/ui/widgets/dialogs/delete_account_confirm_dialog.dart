import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

class DeleteAccountConfirmDialog extends StatelessWidget {
  const DeleteAccountConfirmDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  static Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return DeleteAccountConfirmDialog(
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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.appLocalizations.delete_account_ask),
      content: Text(context.appLocalizations.are_you_sure_you_want_to_delete_your_account),
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

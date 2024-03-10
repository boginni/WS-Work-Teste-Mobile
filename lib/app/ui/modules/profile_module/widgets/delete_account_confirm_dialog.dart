import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeleteAccountConfirmDialog extends StatelessWidget {
  const DeleteAccountConfirmDialog({
    super.key, required this.onConfirm,
  });

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Account'),
      content: Text('Are you sure you want to delete your account?'),
      actions: [
        TextButton(
          onPressed: () {
            Modular.to.pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text('Delete'),
        ),
      ],
    );
  }
}

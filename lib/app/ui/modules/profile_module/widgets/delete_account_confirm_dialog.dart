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
      title: const Text('Delete Account'),
      content: const Text('Are you sure you want to delete your account?'),
      actions: [
        TextButton(
          onPressed: () {
            Modular.to.pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: onConfirm,
          child: const Text('Delete'),
        ),
      ],
    );
  }
}

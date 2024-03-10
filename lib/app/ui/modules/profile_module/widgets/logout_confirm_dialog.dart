import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LogoutConfirmDialog extends StatelessWidget {
  const LogoutConfirmDialog({
    super.key,
    required this.onConfirm,
  });

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Logout'),
      content: Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          onPressed: () {
            Modular.to.pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text('Logout'),
        ),
      ],
    );
  }
}

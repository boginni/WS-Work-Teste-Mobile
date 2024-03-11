import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/app_module.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';
import 'package:ws_work_test_mobile/app/ui/widgets/dialogs/delete_account_confirm_dialog.dart';
import 'package:ws_work_test_mobile/app/ui/widgets/dialogs/logout_confirm_dialog.dart';

class ProfileWire extends StatefulWidget {
  const ProfileWire({super.key});

  @override
  State<ProfileWire> createState() => _ProfileWireState();
}

class _ProfileWireState extends State<ProfileWire> {
  void _onDeleteAccount() {
    DeleteAccountConfirmDialog.show(context).then((value) {
      if (value) {
        AppModule.restartApp();
      }
    });
  }

  void _onLogout() {
    LogoutConfirmDialog.show(context).then((value) {
      if (value) {
        AppModule.restartApp();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //delete account list tile
          ListTile(
            leading: const Icon(Icons.delete),
            title: Text(context.appLocalizations.delete_account),
            onTap: _onDeleteAccount,
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(context.appLocalizations.logout),
            onTap: _onLogout,
          ),
        ],
      ),
    );
  }
}

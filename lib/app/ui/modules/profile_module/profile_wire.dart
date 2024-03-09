import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/app_module.dart';
import 'package:ws_work_test_mobile/app/ui/modules/profile_module/widgets/delete_account_confirm_dialog.dart';
import 'package:ws_work_test_mobile/app/ui/modules/profile_module/widgets/logout_confirm_dialog.dart';

class ProfileWire extends StatefulWidget {
  const ProfileWire({super.key});

  @override
  State<ProfileWire> createState() => _ProfileWireState();
}

class _ProfileWireState extends State<ProfileWire> {
  void _onDeleteAccount() {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteAccountConfirmDialog(
          onConfirm: () {
            Modular.to.pop();
            Modular.to.pushNamedAndRemoveUntil(AppModule.splash, (p0) => true);
          },
        );
      },
    );
  }

  void _onLogout() {
    showDialog(
      context: context,
      builder: (context) {
        return LogoutConfirmDialog(
          onConfirm: () {
            Modular.to.pop();
            Modular.to.pushNamedAndRemoveUntil(AppModule.splash, (p0) => true);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //delete account list tile
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete Account'),
            onTap: _onDeleteAccount,
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: _onLogout,
          ),
        ],
      ),
    );
  }
}

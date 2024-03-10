import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

import '../auth_module.dart';

class EmailSignInForm extends StatelessWidget {
  const EmailSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email),
            labelText: context.appLocalizations.email,
            hintText: '',
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: const Icon(Icons.visibility_off),
            labelText: context.appLocalizations.password,
            hintText: '',
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  Modular.to.pushNamed('.${AuthModule.resetPassword}');
                },
                child: Text(context.appLocalizations.forgot_password_ask),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Modular.to.pushNamed('.${AuthModule.signUp}');
                },
                child: Text(context.appLocalizations.sign_up),
              ),
            )
          ],
        ),
      ],
    );
  }
}

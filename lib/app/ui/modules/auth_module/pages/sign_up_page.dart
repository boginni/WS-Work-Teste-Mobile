import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

import '../../../app_module.dart';
import '../auth_module.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.appLocalizations.sign_up),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Text(
            context.appLocalizations.create_an_account,
            style: context.textTheme.titleLarge,
          ),
          Text(
            context.appLocalizations.enter_your_email_and_password_to_create_an_account,
          ),
          const SizedBox(
            height: 16,
          ),
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
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: context.appLocalizations.password,
              hintText: '',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: context.appLocalizations.confirm_password,
              hintText: '',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FilledButton(
            onPressed: () {
              Modular.to.pushReplacementNamed(AppModule.auth + AuthModule.confirmEmail);
            },
            child: Text(context.appLocalizations.sign_up),
          )
        ],
      ),
    );
  }
}

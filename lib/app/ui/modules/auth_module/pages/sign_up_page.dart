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
        title: const Text('Sign Up'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Text(
            'Create an account',
            style: context.textTheme.titleLarge,
          ),
          const Text(
            'Enter your email and password to create an account',
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Email',
              hintText: '',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: 'Password',
              hintText: '',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: 'Password',
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
            child: const Text('Sign up'),
          )
        ],
      ),
    );
  }
}

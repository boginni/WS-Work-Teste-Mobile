import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../auth_module.dart';

class EmailSignInForm extends StatelessWidget {
  const EmailSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          obscureText: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.visibility_off),
            labelText: 'Password',
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
                child: const Text('Forgot password?'),
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
                child: const Text('Sign Up'),
              ),
            )
          ],
        ),
      ],
    );
  }
}

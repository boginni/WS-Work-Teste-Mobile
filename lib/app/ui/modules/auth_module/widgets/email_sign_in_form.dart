import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

import '../auth_module.dart';
import '../controllers/sign_in_controller.dart';

class EmailSignInForm extends StatelessWidget {
  const EmailSignInForm({
    super.key,
    required this.controller,
  });

  final SignInController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller.signInStore.emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => controller.signInStore.emailValidator(
            value,
            context: context,
          ),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email),
            labelText: context.appLocalizations.email,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          controller: controller.signInStore.passwordController,
          obscureText: true,
          validator: (value) => controller.signInStore.passwordValidator(
            value,
            context: context,
          ),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: const Icon(Icons.visibility_off),
            labelText: context.appLocalizations.password,
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

import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/controllers/sign_up_controller.dart';
import 'package:ws_work_test_mobile/app/ui/widgets/listenable_widget.dart';

class SignUpPage extends ListenableWidget {
  const SignUpPage({
    super.key,
    required this.controller,
  });

  final SignUpController controller;

  @override
  Listenable get listenable => controller.store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.appLocalizations.sign_up),
      ),
      body: AutofillGroup(
        child: Form(
          key: controller.store.formKey,
          child: ListView(
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
                controller: controller.store.emailController,
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofillHints: const [AutofillHints.email],
                validator: Validatorless.multiple([
                  Validatorless.required(context.appLocalizations.required_field),
                  Validatorless.email(context.appLocalizations.invalid_email),
                ]),
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
                controller: controller.store.passwordController,
                obscureText: controller.store.obscurePassword.value,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofillHints: const [AutofillHints.password],
                validator: Validatorless.multiple([
                  Validatorless.required(context.appLocalizations.required_field),
                  Validatorless.min(6, context.appLocalizations.password_must_have_at_least_6_characters),
                  Validatorless.compare(
                    controller.store.passwordController,
                    context.appLocalizations.passwords_do_not_match,
                  ),
                ]),
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
                controller: controller.store.confirmPasswordController,
                obscureText: controller.store.obscurePassword.value,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofillHints: const [AutofillHints.password],
                validator: Validatorless.multiple([
                  Validatorless.required(context.appLocalizations.required_field),
                  Validatorless.min(6, context.appLocalizations.password_must_have_at_least_6_characters),
                  Validatorless.compare(
                    controller.store.passwordController,
                    context.appLocalizations.passwords_do_not_match,
                  ),
                ]),
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
                  FocusManager.instance.primaryFocus?.unfocus();
                  controller.signUp();
                },
                child: Text(context.appLocalizations.sign_up),
              )
            ],
          ),
        ),
      ),
    );
  }
}

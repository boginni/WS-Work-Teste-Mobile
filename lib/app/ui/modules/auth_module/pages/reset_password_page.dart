import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:validatorless/validatorless.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/controllers/reset_password_controller.dart';
import 'package:ws_work_test_mobile/app/ui/services/open_mail_service.dart';
import 'package:ws_work_test_mobile/app/ui/widgets/listenable_widget.dart';

class ResetPasswordPage extends ListenableWidget {
  const ResetPasswordPage({
    super.key,
    required this.openMailService,
    required this.controller,
  });

  final OpenMailService openMailService;
  final ResetPasswordController controller;

  @override
  Listenable get listenable => controller.store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.appLocalizations.forgot_password,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Text(
            context.appLocalizations.reset_password,
            style: context.textTheme.titleLarge,
          ),
          Text(
            context.appLocalizations.enter_your_email_to_reset_your_password,
          ),
          const SizedBox(
            height: 16,
          ),
          AutofillGroup(
            child: TextFormField(
              controller: controller.store.emailController,
              validator: Validatorless.multiple([
                Validatorless.required(context.appLocalizations.required_field),
                Validatorless.email(context.appLocalizations.invalid_email),
              ]),
              autofillHints: const [AutofillHints.email, AutofillHints.username],
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                labelText: context.appLocalizations.email,
                hintText: '',
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    openMailService.openMailApp(context);
                  },
                  child: Text(context.appLocalizations.open_mail_app),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Visibility(
                  visible: controller.store.isLoading,
                  replacement: FilledButton(
                    onPressed: () {
                      controller.sendResetPasswordEmail();
                    },
                    child: Text(context.appLocalizations.reset_password),
                  ),
                  child: const FilledButton(
                    onPressed: null,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: controller.store.emailSent,
            child: RichText(
              text: TextSpan(
                text: context.appLocalizations.we_have_sent_an_email_to,
                style: context.textTheme.labelSmall,
                children: [
                  TextSpan(
                    text: ' ${controller.store.emailController} ',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  TextSpan(
                    text: context.appLocalizations.check_your_email_and_open_the_link_to_reset_your_password,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';
import 'package:ws_work_test_mobile/app/ui/services/open_mail_service.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({
    super.key,
    required this.openMailService,
  });

  final OpenMailService openMailService;

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
                child: FilledButton(
                  onPressed: () {
                    /// TODO: Implement reset password
                  },
                  child: Text(context.appLocalizations.reset_password),
                ),
              ),
            ],
          ),
          Visibility(
            child: RichText(
              text: TextSpan(
                text: context.appLocalizations.we_have_sent_an_email_to,
                style: context.textTheme.labelSmall,
                children: [
                  TextSpan(
                    text: ' email ',
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

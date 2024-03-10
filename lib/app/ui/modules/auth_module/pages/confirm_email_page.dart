import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/app_module.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';
import 'package:ws_work_test_mobile/app/ui/services/open_mail_service.dart';

class ConfirmEmailPage extends StatelessWidget {
  const ConfirmEmailPage({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.appLocalizations.confirm_email),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Text(
            context.appLocalizations.confirm_email,
            style: context.textTheme.titleLarge,
          ),
          RichText(
            text: TextSpan(
              text: context.appLocalizations.we_have_sent_an_email_to,
              style: context.textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: ' $email ',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                TextSpan(
                  text: context.appLocalizations.check_your_email_and_open_the_link_to_confirm_your_email,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Modular.to.pushNamed(AppModule.shell);
                  },
                  child: Text(context.appLocalizations.go_to_home),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    openMailApp(context);
                  },
                  child: Text(context.appLocalizations.open_mail_app),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

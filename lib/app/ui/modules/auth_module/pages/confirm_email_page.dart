import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/app_module.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

class ConfirmEmailPage extends StatelessWidget {
  const ConfirmEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Email'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Text(
            'Confirm Email',
            style: context.textTheme.titleLarge,
          ),
          RichText(
            text: TextSpan(
              text: 'We have sent an email to ',
              style: context.textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: 'email',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                const TextSpan(
                  text: ' Check your email and click on the link to confirm your email',
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
                  child: const Text('Go to Home Page'),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    // open email
                  },
                  child: const Text('Open Email'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

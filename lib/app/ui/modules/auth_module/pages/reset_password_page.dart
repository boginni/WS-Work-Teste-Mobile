import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Text(
            'Reset Password',
            style: context.textTheme.titleLarge,
          ),
          const Text(
            'Enter your email to reset your password',
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
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // open email
                  },
                  child: const Text('Open Email'),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Reset Password'),
                ),
              ),
            ],
          ),
          Visibility(
            child: RichText(
              text: TextSpan(
                text: 'We have sent an email to ',
                style: context.textTheme.labelSmall,
                children: [
                  TextSpan(
                    text: 'email',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  TextSpan(
                    text: ' Check your email and click on the link to reset your password',
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

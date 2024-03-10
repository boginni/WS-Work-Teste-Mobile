import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/widgets/email_sign_in_form.dart';
import 'package:ws_work_test_mobile/app/ui/modules/auth_module/widgets/phone_sign_in_form.dart';

import '../../../app_module.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  Set<int> _selected = Set<int>.from([0]);

  bool get _isEmailSelected => _selected.contains(0);

  @override
  Widget build(BuildContext context) {
    /// Auth Page with login and password fields
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppModule.shell);
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.account_circle),
                  label: const Text('Google'),
                ),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.account_circle),
                  label: const Text('Anonymous'),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'You Don\'t need to sign up when you use Google, Phone or Anonymous login.',
              style: context.textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 16 * 8,
              color: context.theme.primaryColor,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Welcome to Ws Work Test Mobile!',
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Text(
              'Please, login to continue.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            // segmented button to select email or phone
            SegmentedButton(
              segments: const [
                ButtonSegment(
                  value: 0,
                  label: Text('Email'),
                ),
                ButtonSegment(
                  value: 1,
                  label: Text('Phone'),
                ),
              ],
              multiSelectionEnabled: false,
              emptySelectionAllowed: false,
              onSelectionChanged: (Set<int> selection) {
                setState(() {
                  _selected = selection;
                });
              },
              selected: _selected,
            ),
            const SizedBox(
              height: 16,
            ),
            Visibility(
              visible: _isEmailSelected,
              replacement: const PhoneSignInForm(),
              child: const EmailSignInForm(),
            ),
          ],
        ),
      ),
    );
  }
}

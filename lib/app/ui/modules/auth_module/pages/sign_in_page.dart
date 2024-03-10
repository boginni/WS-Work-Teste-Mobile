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
              child: Text(context.appLocalizations.sign_in),
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
                  label: Text(context.appLocalizations.google),
                ),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.account_circle),
                  label: Text(context.appLocalizations.anonymous),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              context.appLocalizations.you_dont_need_to_sign_up_when_using_google_phone_or_anonymous,
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
              context.appLocalizations.welcome_to_ws_work_test_mobile,
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              context.appLocalizations.please_sign_in_to_continue,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            // segmented button to select email or phone
            SegmentedButton(
              segments: [
                ButtonSegment(
                  value: 0,
                  label: Text(context.appLocalizations.email),
                ),
                ButtonSegment(
                  value: 1,
                  label: Text(context.appLocalizations.phone),
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

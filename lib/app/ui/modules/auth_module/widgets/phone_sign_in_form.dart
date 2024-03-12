import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

import '../controllers/sign_in_controller.dart';

class PhoneSignInForm extends StatelessWidget {
  const PhoneSignInForm({
    super.key,
    required this.controller,
  });

  final SignInController controller;

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Column(
        children: [
          TextFormField(
            controller: controller.signInStore.phoneController,
            keyboardType: TextInputType.phone,
            autofillHints: const [AutofillHints.telephoneNumber],
            validator: (value) => controller.signInStore.phoneValidator(
              value,
              context: context,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.phone),
              labelText: context.appLocalizations.phone,
              hintText: '',
            ),
          ),
          // const SizedBox(
          //   height: 16,
          // ),
          // TextFormField(
          //   decoration: const InputDecoration(
          //     prefixIcon: Icon(Icons.lock),
          //     suffixIcon: Icon(Icons.visibility_off),
          //     labelText: 'Password',
          //     hintText: '',
          //   ),
          // ),
        ],
      ),
    );
  }
}

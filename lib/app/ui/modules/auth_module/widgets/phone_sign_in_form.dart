import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

class PhoneSignInForm extends StatelessWidget {
  const PhoneSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
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
    );
  }
}

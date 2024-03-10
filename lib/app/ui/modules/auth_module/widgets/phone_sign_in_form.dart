import 'package:flutter/material.dart';

class PhoneSignInForm extends StatelessWidget {
  const PhoneSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.phone),
            labelText: 'Phone',
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

import 'package:flutter/material.dart';

class LanguageModal extends StatelessWidget {
  const LanguageModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.language),
          title: Text('Português'),
          onTap: () {
            // context.setLocale(const Locale('pt', 'BR'));
            // Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: Text('English'),
          onTap: () {
            // context.setLocale(const Locale('en', 'US'));
            // Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: Text('Français'),
          onTap: () {
            // context.setLocale(const Locale('fr', 'FR'));
            // Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

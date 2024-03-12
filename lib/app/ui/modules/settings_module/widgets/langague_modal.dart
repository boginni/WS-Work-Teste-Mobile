import 'package:flutter/material.dart';

class LanguageModal extends StatelessWidget {
  const LanguageModal({super.key, required this.onLocaleChanged, s});

  final ValueChanged<Locale> onLocaleChanged;

  static Future<Locale?> show(BuildContext context) async {
    return showModalBottomSheet<Locale>(
      context: context,
      builder: (context) {
        return LanguageModal(
          onLocaleChanged: (Locale value) {
            Navigator.pop(context, value);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('Português'),
          onTap: () {
            onLocaleChanged(const Locale('pt', 'BR'));
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('English'),
          onTap: () {
            onLocaleChanged(const Locale('en', 'US'));
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('Français'),
          onTap: () {
            onLocaleChanged(const Locale('fr', 'FR'));
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('Deutsch'),
          onTap: () {
            onLocaleChanged(const Locale('de', 'DE'));
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('Español'),
          onTap: () {
            onLocaleChanged(const Locale('es', 'ES'));
          },
        ),
        // Japanese
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('日本語'),
          onTap: () {
            onLocaleChanged(const Locale('ja', 'JP'));
          },
        ),

      ],
    );
  }
}

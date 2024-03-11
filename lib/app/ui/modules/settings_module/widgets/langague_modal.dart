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
          title: Text('Português'),
          onTap: () {
            onLocaleChanged(const Locale('pt', 'BR'));
            // LocaleProvider.of(context).onLocaleChanged(const Locale('pt', 'BR'));
            // context.setLocale(const Locale('pt', 'BR'));
            // Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: Text('English'),
          onTap: () {
            onLocaleChanged(const Locale('en', 'US'));
            // LocaleProvider.of(context).onLocaleChanged(const Locale('en', 'US'));
            // context.setLocale(const Locale('en', 'US'));
            // Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: Text('Français'),
          onTap: () {
            onLocaleChanged(const Locale('fr', 'FR'));
            // LocaleProvider.of(context).onLocaleChanged(const Locale('fr', 'FR'));
            // context.setLocale(const Locale('fr', 'FR'));
            // Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

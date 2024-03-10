import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

import 'widgets/langague_modal.dart';

class SettingsWire extends StatelessWidget {
  const SettingsWire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.appLocalizations.settings),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(context.appLocalizations.language),
            subtitle: Text('${context.appLocalizations.locale} - ${context.appLocalizations.locale_name}'),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const LanguageModal();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

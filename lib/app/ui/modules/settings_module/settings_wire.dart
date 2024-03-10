import 'package:flutter/material.dart';

class SettingsWire extends StatelessWidget {
  const SettingsWire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: const Center(
        child: Text('settings module'),
      ),
    );
  }
}

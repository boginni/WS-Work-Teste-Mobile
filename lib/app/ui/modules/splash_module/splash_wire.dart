import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';

import '../../app_module.dart';

class SplashWire extends StatefulWidget {
  const SplashWire({super.key});

  @override
  State<SplashWire> createState() => _SplashWireState();
}

class _SplashWireState extends State<SplashWire> {
  @override
  initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, AppModule.auth),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Ws Work',
                  style: context.textTheme.displayLarge,
                ),
                Text(
                  'Test Mobile',
                  style: context.textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Column(
              children: [
                Text(
                  'Loading...',
                  style: context.textTheme.labelSmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                const LinearProgressIndicator(),
                Text(
                  'by: Brunno Marques',
                  style: context.textTheme.labelSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

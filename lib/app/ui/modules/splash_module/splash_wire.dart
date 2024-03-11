import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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


  double easterEgg = 1.0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          easterEgg *= 0.75;
        });
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Transform.scale(
              scale: easterEgg,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Ws Work',
                      style: context.textTheme.displayLarge,
                    ),
                    Text(
                      context.appLocalizations.test_mobile,
                      style: context.textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Column(
                children: [
                  Text(
                    context.appLocalizations.loading,
                    style: context.textTheme.labelSmall,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const LinearProgressIndicator(),
                  Text(
                    context.appLocalizations.by_x('Brunno Marques'),
                    style: context.textTheme.labelSmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

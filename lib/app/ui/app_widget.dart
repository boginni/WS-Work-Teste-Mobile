import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/app_module.dart';
import 'package:ws_work_test_mobile/app/ui/theme/ws_work_test_mobile_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    var local = WidgetsBinding.instance.platformDispatcher.locale;

    const supportedLocales = [
      ...AppLocalizations.supportedLocales,
      Locale('pt', 'BR'),
      Locale('en', 'US'),
      Locale('fr', 'FR'),
      Locale('en', ''),
    ];


    final theme = WsWorkTestMobileTheme();

    Modular.setInitialRoute(AppModule.splash);

    return MaterialApp.router(
      title: 'Ws Work Test Mobile',
      locale: local,
      supportedLocales: supportedLocales,
      theme: theme.getLightThemeData(context),
      darkTheme: theme.getDarkThemeData(context),
      routerConfig: Modular.routerConfig,
    );
  }
}

import 'package:flutter/material.dart';

import 'theme_factory.dart';

class WsWorkTestMobileTheme {
  final light = ThemeFactory(
    primary: const Color(0xFF46CAFE),
    secondary: const Color(0xFF54CEFE),
    tertiary: const Color(0xFF030081),
    surface: const Color(0xFFF1F5F9),
    onSurface: const Color(0xFF000000),
    surfaceVariant: const Color(0xFFFFFFFF),
    onSurfaceVariant: const Color(0xFF000000),
    brightness: Brightness.light,
  );

  final dark = ThemeFactory(
    primary: const Color(0xFF46CAFE),
    secondary: const Color(0xFF54CEFE),
    tertiary: const Color(0xFF030081),
    surface: const Color(0xFF121212),
    onSurface: const Color(0xFFFFFFFF),
    surfaceVariant: const Color(0xFF1E1E1E),
    onSurfaceVariant: const Color(0xFFFFFFFF),
    brightness: Brightness.dark,
  );

  ThemeData getLightThemeData(BuildContext context) {
    return light.getThemeData(context);
  }

  ThemeData getDarkThemeData(BuildContext context) {
    return dark.getThemeData(context);
  }
}

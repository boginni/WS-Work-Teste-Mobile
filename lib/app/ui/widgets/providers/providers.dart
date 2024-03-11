import 'package:flutter/material.dart';

class LocaleProvider extends InheritedWidget {
  const LocaleProvider({
    super.key,
    required this.onLocaleChanged,
    required super.child,
  });

  final ValueChanged<Locale> onLocaleChanged;

  static LocaleProvider of(BuildContext context) {
    final LocaleProvider? result = context.dependOnInheritedWidgetOfExactType<LocaleProvider>();
    assert(result != null, 'No LocaleProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(LocaleProvider old) {
    return true;
  }
}

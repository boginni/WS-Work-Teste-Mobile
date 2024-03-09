import 'package:flutter_modular/flutter_modular.dart';

import 'settings_wire.dart';

class SettingsModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const SettingsWire(),
    );
  }
}

import 'package:flutter_modular/flutter_modular.dart';

import 'home_wire.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const HomeWire(),
    );
  }
}

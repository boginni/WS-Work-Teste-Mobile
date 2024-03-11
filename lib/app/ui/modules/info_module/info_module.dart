import 'package:flutter_modular/flutter_modular.dart';

import 'info_page.dart';

class InfoModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const InfoWire(),
    );
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/modules/core_module/core_module.dart';
import 'package:ws_work_test_mobile/app/ui/modules/profile_module/profile_module.dart';
import 'package:ws_work_test_mobile/app/ui/modules/shell_module/shell_wire.dart';

import '../home_module/home_module.dart';

class ShellModule extends Module {
  static const String home = '/home';
  static const String profile = '/profile';

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const ShellWire(),
    );
    r.module(home, module: HomeModule());
    r.module(profile, module: ProfileModule());
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/modules/info_module/info_module.dart';
import 'package:ws_work_test_mobile/app/ui/modules/profile_module/profile_module.dart';
import 'package:ws_work_test_mobile/app/ui/modules/shell_module/shell_wire.dart';

import '../home_module/home_module.dart';

class ShellModule extends Module {
  static const String home = '/home';
  static const String profile = '/profile';
  static const String info = '/info';

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const ShellWire(),
      children: [
        ModuleRoute(home, module: HomeModule()),
        ModuleRoute(profile, module: ProfileModule()),
        ModuleRoute(info, module: InfoModule()),
      ],
    );
  }
}

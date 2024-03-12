import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/modules/core_module/core_module.dart';
import 'package:ws_work_test_mobile/app/ui/modules/splash_module/splash_controller.dart';
import 'package:ws_work_test_mobile/app/ui/modules/splash_module/splash_page.dart';

import '../auth_module/auth_module.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
        AuthModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(
      () => SplashController.new,
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => SplashPage(
        controller: Modular.get(),
      ),
    );
  }
}

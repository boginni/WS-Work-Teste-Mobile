import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/ui/modules/profile_module/profile_controller.dart';
import 'package:ws_work_test_mobile/app/ui/modules/profile_module/profile_page.dart';

import '../core_module/core_module.dart';

class ProfileModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(
      () => ProfileController(
        profileRepository: i(),
        authRepository: i(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => ProfileWire(
        controller: Modular.get(),
      ),
    );
  }
}

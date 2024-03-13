import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/domain/repositories/vehicle_repository.dart';
import 'package:ws_work_test_mobile/app/external/repositories/vehicle/vehicle_repository_impl.dart';
import 'package:ws_work_test_mobile/app/ui/modules/core_module/core_module.dart';
import 'package:ws_work_test_mobile/app/ui/modules/home_module/stores/home_store.dart';
import 'package:ws_work_test_mobile/app/ui/modules/home_module/stores/leads_store.dart';

import 'controllers/home_controller.dart';
import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<VehicleRepository>(
      VehicleRepositoryImpl.new,
    );

    i.add(LeadsStore.new);

    i.add(HomeStore.new);

    i.add(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomePage(
        homeController: Modular.get(),
      ),
    );
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/domain/repositories/vehicle_repository.dart';
import 'package:ws_work_test_mobile/app/external/repositories/vehicle/mock_vehicle_repository.dart';
import 'package:ws_work_test_mobile/app/ui/modules/home_module/pages/home/home_store.dart';

import 'home_controller.dart';
import 'pages/home/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add<VehicleRepository>(
      MockVehicleRepository.new,
    );

    i.add(HomeStore.new);

    i.add(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomeWire(
        homeController: Modular.get(),
      ),
    );
  }
}

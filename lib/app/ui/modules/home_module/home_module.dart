import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work_test_mobile/app/domain/repositories/vehicle_repository.dart';
import 'package:ws_work_test_mobile/app/external/repositories/vehicle/mock_vehicle_repository.dart';

import 'home_wire.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add<VehicleRepository>(() => MockVehicleRepository());
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomeWire(
        vehicleRepository: Modular.get(),
      ),
    );
  }
}

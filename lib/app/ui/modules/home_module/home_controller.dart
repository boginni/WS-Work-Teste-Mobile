import 'package:ws_work_test_mobile/app/domain/dto/entities/vehicle/vehicle_entity.dart';
import 'package:ws_work_test_mobile/app/domain/errors/failure.dart';
import 'package:ws_work_test_mobile/app/ui/modules/home_module/pages/home/home_store.dart';

import '../../../domain/repositories/vehicle_repository.dart';

class HomeController {
  final HomeStore store;
  final VehicleRepository vehicleRepository;

  HomeController({
    required this.store,
    required this.vehicleRepository,
  });

  Future<void> init() async  {
    try {
      final vehicles = await vehicleRepository.index();
      store.vehicles = vehicles;
      store.loading = false;
    } finally {
      store.loading = false;
    }
  }

  Future<void> getVehicles() async {
    try {
      final vehicles = await vehicleRepository.index();
      store.vehicles = vehicles;
    } on Failure {

    }
  }

  Future<void> leadVehicle(VehicleEntity vehicle) async {

  }
}



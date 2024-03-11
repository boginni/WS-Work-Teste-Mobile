import 'package:flutter/material.dart';
import 'package:ws_work_test_mobile/app/domain/dto/entities/vehicle/vehicle_entity.dart';
import 'package:ws_work_test_mobile/app/ui/modules/home_module/pages/home/home_store.dart';
import 'package:ws_work_test_mobile/app/ui/services/dialog_service.dart';

import '../../../domain/repositories/user_leads_repository.dart';
import '../../../domain/repositories/vehicle_repository.dart';

class HomeController {
  final HomeStore store;
  final VehicleRepository vehicleRepository;
  final UserLeadsRepository leadsRepository;
  final DialogService dialogService;

  const HomeController({
    required this.store,
    required this.vehicleRepository,
    required this.dialogService,
    required this.leadsRepository,
  });

  Future<void> init() async {
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
    } on Exception {
      dialogService.showDialog(
        (context) {
          return const Text('Error');
        },
      );
    }
  }

  Future<void> leadVehicle(VehicleEntity vehicle) async {

  }
}

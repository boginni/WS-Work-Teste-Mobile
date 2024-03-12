import 'package:ws_work_test_mobile/app/domain/dto/entities/user/user_entity.dart';
import 'package:ws_work_test_mobile/app/domain/dto/entities/vehicle/vehicle_entity.dart';
import 'package:ws_work_test_mobile/app/domain/dto/params/user_lead_param.dart';
import 'package:ws_work_test_mobile/app/domain/errors/failure.dart';
import 'package:ws_work_test_mobile/app/domain/repositories/profile_repository.dart';
import 'package:ws_work_test_mobile/app/ui/modules/home_module/stores/home_store.dart';
import 'package:ws_work_test_mobile/app/ui/modules/home_module/stores/leads_store.dart';
import 'package:ws_work_test_mobile/app/ui/services/dialog_service.dart';
import 'package:ws_work_test_mobile/app/ui/services/failure_message_extraction_service.dart';

import '../../../../domain/errors/auth/auth_error.dart';
import '../../../../domain/repositories/user_leads_repository.dart';
import '../../../../domain/repositories/vehicle_repository.dart';

UserEntity? _currentUser;

class HomeController {
  final HomeStore store;
  final LeadsStore leadsStore;
  final VehicleRepository vehicleRepository;
  final UserLeadsRepository leadsRepository;
  final ProfileRepository profileRepository;
  final DialogService dialogService;
  final FailureMessageExtractionService failureMessageExtractionService;

  const HomeController({
    required this.store,
    required this.leadsStore,
    required this.vehicleRepository,
    required this.profileRepository,
    required this.dialogService,
    required this.leadsRepository,
    required this.failureMessageExtractionService,
  });

  Future<void> init() async {
    try {
      _currentUser = await profileRepository.me();
    } catch (e) {
      _currentUser = null;
    }

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
      store.vehicles = await vehicleRepository.index();
    } on Failure catch (e) {
      dialogService.alertSnackBar(
        (context) => failureMessageExtractionService.getErrorMessage(e),
      );
    }
  }

  Future<void> leadVehicle(VehicleEntity vehicle) async {
    try {
      if (_currentUser == null) {
        throw const NotAuthenticatedError();
      }

      final param = UserLeadParam(
        userId: _currentUser!.id,
        vehicleId: vehicle.id,
        createdAt: DateTime.now(),
        vehicle: vehicle,
      );

      await leadsRepository.store(param);
    } on Failure catch (e) {
      dialogService.alertSnackBar(
        (context) => failureMessageExtractionService.getErrorMessage(e),
      );
    }
  }

  Future<void> getLeads() async {
    try {
      leadsStore.leads = await leadsRepository.index();
      leadsStore.loading = false;
    } on Failure catch (e) {
      dialogService.alertSnackBar(
        (context) => failureMessageExtractionService.getErrorMessage(e),
      );
    }
  }

  Future<void> syncLeads() async {
    try {
      leadsStore.syncing = true;
      await leadsRepository.sync();
      leadsStore.leads = [];
    } on Failure catch (e) {
      dialogService.alertSnackBar(
        (context) => failureMessageExtractionService.getErrorMessage(e),
      );
    } finally {
      leadsStore.syncing = false;
    }
  }
}

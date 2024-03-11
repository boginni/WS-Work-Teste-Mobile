import 'package:ws_work_test_mobile/app/domain/dto/entities/vehicle/vehicle_entity.dart';

import '../../../domain/repositories/user_leads_repository.dart';

final List<VehicleEntity> _leads = [];

class MockUserLeadsRepository extends UserLeadsRepository {
  @override
  Future<void> create(VehicleEntity vehicleEntity) async {
    _leads.add(vehicleEntity);
  }

  @override
  Future<void> delete(int id) async {
    _leads.removeWhere((element) => element.id == id);
  }

  @override
  Future<List<VehicleEntity>> index() async {
    return Future.value(_leads);
  }
}

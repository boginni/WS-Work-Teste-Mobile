import 'package:ws_work_test_mobile/app/domain/dto/entities/vehicle/vehicle_entity.dart';

import '../../../domain/repositories/user_leads_repository.dart';

class UserLeadsRepositoryImpl extends UserLeadsRepository {
  @override
  Future<void> store(VehicleEntity vehicleEntity) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<VehicleEntity>> index() async {
    throw UnimplementedError();
  }
}

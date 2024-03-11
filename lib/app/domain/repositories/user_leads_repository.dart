import '../dto/entities/vehicle/vehicle_entity.dart';

abstract class UserLeadsRepository {
  Future<List<VehicleEntity>> index();

  Future<void> store(VehicleEntity vehicleEntity);

  Future<void> delete(int id);
}

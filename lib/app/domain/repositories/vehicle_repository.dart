
import '../dto/entities/vehicle/vehicle_entity.dart';

abstract class VehicleRepository {
  Future<List<VehicleEntity>> index();

  Future<VehicleEntity> show(int id);

  Future<VehicleEntity> create(VehicleEntity vehicle);
}

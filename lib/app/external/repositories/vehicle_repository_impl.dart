import '../../domain/dto/entities/vehicle/vehicle_entity.dart';

abstract class VehicleRepositoryImpl {
  Future<List<VehicleEntity>> index();

  Future<VehicleEntity> show(int id);

  Future<VehicleEntity> create(VehicleEntity vehicle);
}

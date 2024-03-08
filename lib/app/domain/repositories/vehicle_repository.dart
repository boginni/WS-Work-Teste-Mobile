
import '../dto/entities/vehicle/vehicle_entity.dart';

abstract class VehicleRepository {
  Future<List<VehicleEntity>> index();

}

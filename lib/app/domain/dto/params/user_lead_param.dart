import 'package:ws_work_test_mobile/app/domain/dto/entities/entity.dart';
import 'package:ws_work_test_mobile/app/domain/dto/entities/vehicle/vehicle_entity.dart';

class UserLeadParam extends Entity {
  final int userId;
  final int vehicleId;
  final DateTime createdAt;
  final VehicleEntity vehicle;

  const UserLeadParam({
    required this.userId,
    required this.vehicleId,
    required this.createdAt,
    required this.vehicle,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'vehicle_id': vehicleId,
      'sync_status': 0,
      'created_at': createdAt.toIso8601String(),
      'vehicle_name': vehicle.nomeModelo,
      'vehicle_price': vehicle.valor,
    };
  }
}

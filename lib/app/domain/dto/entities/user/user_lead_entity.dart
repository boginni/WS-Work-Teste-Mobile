import 'package:ws_work_test_mobile/app/domain/dto/entities/entity.dart';

import '../vehicle/vehicle_entity.dart';

class UserLeadEntity extends Entity {

  final int id;
  final int userId;
  final int vehicleId;
  final bool syncStatus;
  final DateTime? syncDate;
  final DateTime createdAt;
  final DateTime? deletedAt;
  final String vehicleName;
  final num vehiclePrice;

  UserLeadEntity({
    required this.id,
    required this.userId,
    required this.vehicleId,
    required this.syncStatus,
    required this.vehicleName,
    required this.vehiclePrice,
    required this.syncDate,
    required this.createdAt,
    required this.deletedAt,

  });

  factory UserLeadEntity.fromJson(Map<String, dynamic> json) {
    return UserLeadEntity(
      id: json['id'],
      userId: json['user_id'],
      vehicleId: json['vehicle_id'],
      syncStatus: json['sync_status'],
      syncDate: DateTime.parse(json['sync_date']),
      createdAt: DateTime.parse(json['created_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
      vehicleName: json['vehicle_name'],
      vehiclePrice: json['vehicle_price'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'vehicle_id': vehicleId,
      'sync_status': syncStatus,
      'vehicle_name': vehicleName,
      'vehicle_price': vehiclePrice,
      'sync_date': syncDate?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
    };
  }

}

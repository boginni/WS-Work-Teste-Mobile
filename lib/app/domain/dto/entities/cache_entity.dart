import 'package:ws_work_test_mobile/app/domain/dto/entities/entity.dart';

class CacheEntity extends Entity {
  final String id;
  final dynamic value;
  final DateTime date;

  CacheEntity({
    required this.id,
    required this.value,
    required this.date,
  });

  factory CacheEntity.fromJson(dynamic json) {
    return CacheEntity(
      id: json['id'],
      value: json['value'],
      date: DateTime.parse(json['date']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value': value,
      'date': date.toIso8601String(),
    };
  }
}

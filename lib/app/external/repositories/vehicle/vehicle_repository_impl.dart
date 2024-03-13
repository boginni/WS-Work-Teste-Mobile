import 'package:dio/dio.dart';

import '../../../domain/dto/entities/vehicle/vehicle_entity.dart';
import '../../../domain/repositories/vehicle_repository.dart';

class VehicleRepositoryImpl extends VehicleRepository {
  final Dio dio;

  VehicleRepositoryImpl({required this.dio});

  @override
  Future<List<VehicleEntity>> index() async {
    final response = await dio.get('/cars.json');

    final data = response.data['cars'] as List;

    return data.map((e) => VehicleEntity.fromJson(e)).toList();
  }
}

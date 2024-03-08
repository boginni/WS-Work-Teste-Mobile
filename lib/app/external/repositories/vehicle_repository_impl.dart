import 'package:dio/dio.dart';

import '../../domain/dto/entities/vehicle/vehicle_entity.dart';
import '../../domain/repositories/vehicle_repository.dart';

class VehicleRepositoryImpl extends VehicleRepository {
  final Dio dio;

  // https://wswork.com.br/cars.json
  // https://wswork.com.br/cars/leads

  VehicleRepositoryImpl({required this.dio});

  Future<List<VehicleEntity>> index() async {
    final response = await dio.get('/cars.json');

    final data = response.data as List;

    return data.map((e) => VehicleEntity.fromJson(e)).toList();
  }
}

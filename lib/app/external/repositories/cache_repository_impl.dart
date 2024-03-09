import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ws_work_test_mobile/app/domain/dto/entities/cache_entity.dart';

import '../../domain/repositories/cache_repository.dart';

class CacheRepositoryImpl extends CacheRepository {
  final SharedPreferences sharedPreferences;

  CacheRepositoryImpl({required this.sharedPreferences});

  @override
  Future<CacheEntity?> get(String key) async {
    final value = sharedPreferences.getString(key);

    if (value == null) {
      return null;
    }

    final json = const JsonDecoder().convert(value);

    return CacheEntity.fromJson(json);
  }

  @override
  Future<void> put(CacheEntity data) async {
    await sharedPreferences.setString(data.id, const JsonEncoder().convert(data.toJson()));
  }
}

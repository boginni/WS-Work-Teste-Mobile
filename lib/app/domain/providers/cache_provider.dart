import 'package:ws_work_test_mobile/app/domain/dto/entities/cache_entity.dart';

abstract class CacheProvider {
  Future<CacheEntity?> get(String key);

  Future<void> put(CacheEntity data);
}

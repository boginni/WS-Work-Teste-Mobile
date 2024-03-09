import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ws_work_test_mobile/app/domain/repositories/cache_repository.dart';
import 'package:ws_work_test_mobile/app/domain/use_cases/check_internet_use_case.dart';

import '../../domain/dto/entities/cache_entity.dart';

class DioOfflineCacheInterceptor extends InterceptorsWrapper {
  DioOfflineCacheInterceptor({
    this.maxCacheAge = const Duration(minutes: 5),
    required this.checkInternetUseCase,
    required this.cacheService,
  });

  final Duration maxCacheAge;
  final CheckInternetUseCase checkInternetUseCase;
  final CacheRepository cacheService;

  String getRequestId(RequestOptions options) {
    return '${options.method}${options.path}';
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final online = await checkInternetUseCase();

    final bool wantsCacheResponse = options.extra['cacheResponse'] ?? false;

    if (!wantsCacheResponse || online) {
      handler.next(options);
      return;
    }

    final id = getRequestId(options);

    final dataCached = await cacheService.get(id);

    final cacheIsExpired = dataCached?.date == null || DateTime.now().difference(dataCached!.date) > maxCacheAge;

    if (online || cacheIsExpired) {
      handler.next(options);
      return;
    }

    handler.resolve(
      Response(
        data: json.encode(dataCached.value),
        extra: options.extra,
        statusCode: 200,
        requestOptions: options,
      ),
      true,
    );
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.requestOptions.method != 'GET') {
      handler.next(response);
      return;
    }

    final data = CacheEntity(
      value: response.data is String ? json.decode(response.data) : response.data,
      date: DateTime.now(),
      id: getRequestId(response.requestOptions),
    );

    await cacheService.put(data);

    handler.next(response);
  }
}

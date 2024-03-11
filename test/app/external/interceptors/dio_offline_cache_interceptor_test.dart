import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';
import 'package:ws_work_test_mobile/app/domain/providers/cache_provider.dart';
import 'package:ws_work_test_mobile/app/domain/use_cases/check_internet_use_case.dart';
import 'package:ws_work_test_mobile/app/external/interceptors/dio_offline_cache_interceptor.dart';
import 'package:ws_work_test_mobile/app/external/provider/shared_preferences_cache_provider.dart';
import 'package:ws_work_test_mobile/app/external/use_cases/check_internet_connection_impl.dart';

import 'dio_offline_cache_interceptor_test.mocks.dart';

class DioAdapter implements HttpClientAdapter {
  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    throw Exception();
  }
}

@GenerateMocks([SharedPreferences])
void main() {
  group('DioOfflineCacheInterceptor', () {
    late SharedPreferences preferences;
    late Dio dio;
    late DioOfflineCacheInterceptor interceptor;
    late CacheProvider cacheProvider;
    late CheckInternetUseCase checkInternetUseCase;

    setUp(() {
      preferences = MockSharedPreferences();
      dio = Dio();
      dio.httpClientAdapter = DioAdapter();
      cacheProvider = SharedPreferencesCacheProvider(sharedPreferences: preferences);

      checkInternetUseCase = CheckInternetUseCaseImpl(lookupFunction: () {
        return Future.value([]);
      });

      interceptor = DioOfflineCacheInterceptor(
        checkInternetUseCase: checkInternetUseCase,
        cacheService: cacheProvider,
      );
      dio.interceptors.add(interceptor);
    });

    test('Test', () {
      when(preferences.getString('')).thenReturn(mockResponse);
      dio.get('http://localhost:3000/cars');
    });
  });
}

String mockResponse = '''
{"cars": 

    [
        {

         "id": 1,
         "timestamp_cadastro" : 1696539488,
         "modelo_id" : 12,
         "ano": 2015, 
         "combustivel" : "FLEX", 
         "num_portas" : 4,
         "cor": "BEGE",
         "nome_modelo" : "ONIX PLUS",
         "valor" : 50.000 
        },
        {

         "id": 2,
         "timestamp_cadastro" : 1696531234,
         "modelo_id" : 14,
         "ano": 2014, 
         "combustivel" : "FLEX", 
         "num_portas" : 4,
         "cor": "AZUL",
         "nome_modelo" : "JETTA",
         "valor" : 49.000 
        },
        {

         "id": 3,
         "timestamp_cadastro" : 16965354321,
         "modelo_id" : 79,
         "ano": 1993, 
         "combustivel" : "DIESEL", 
         "num_portas" : 4,
         "cor": "AZUL",
         "nome_modelo" : "HILLUX SW4",
         "valor" : 47.500 
        }
    ]

 }
''';

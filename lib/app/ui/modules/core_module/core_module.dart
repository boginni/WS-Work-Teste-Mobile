import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ws_work_test_mobile/app/domain/services/migration_service.dart';
import 'package:ws_work_test_mobile/app/external/provider/shared_preferences_cache_provider.dart';
import 'package:ws_work_test_mobile/app/external/provider/sqlite_migration_connection.dart';
import 'package:ws_work_test_mobile/app/external/repositories/user_leads/user_leads_repository_impl.dart';
import 'package:ws_work_test_mobile/app/external/services/sqlite_database_migration_service.dart';
import 'package:ws_work_test_mobile/app/external/use_cases/check_internet_connection_impl.dart';
import 'package:ws_work_test_mobile/app/ui/modules/core_module/services/core_open_mail_service.dart';
import 'package:ws_work_test_mobile/app/ui/modules/core_module/services/global_dialog_service.dart';
import 'package:ws_work_test_mobile/app/ui/modules/core_module/services/global_failure_message_extraction_service.dart';
import 'package:ws_work_test_mobile/app/ui/services/dialog_service.dart';
import 'package:ws_work_test_mobile/app/ui/services/failure_message_extraction_service.dart';
import 'package:ws_work_test_mobile/app/ui/services/open_mail_service.dart';

import '../../../domain/providers/cache_provider.dart';
import '../../../domain/repositories/profile_repository.dart';
import '../../../domain/repositories/user_leads_repository.dart';
import '../../../domain/use_cases/check_internet_use_case.dart';
import '../../../external/interceptors/dio_offline_cache_interceptor.dart';
import '../../../external/repositories/profile/profile_repository_impl.dart';

class CoreModule extends Module {
  static init() {
    Firebase.initializeApp();
  }

  static Database? database;
  static SharedPreferences? sharedPreferences;

  @override
  void exportedBinds(Injector i) {
    final dio = Dio();

    i.addLazySingleton<CheckInternetUseCase>(
      () => CheckInternetUseCaseImpl(
        lookupFunction: () async {
          final result = await InternetAddress.lookup('google.com');
          return result.map((e) => e.rawAddress.length).toList();
        },
      ),
    );

    i.addLazySingleton<CacheProvider>(
      () => SharedPreferencesCacheProvider(
        sharedPreferences: sharedPreferences!,
      ),
    );

    dio.interceptors.add(
      DioOfflineCacheInterceptor(
        cacheService: i.get(),
        checkInternetUseCase: i.get(),
      ),
    );

    migrationFactory() => SqliteMigrationConnection(
          database: database!,
        );

    i.addLazySingleton<MigrationService>(
      () => SqliteDatabaseMigrationService(connection: migrationFactory()),
    );

    i.add<DialogService>(GlobalDialogService.new);

    i.add<FailureMessageExtractionService>(GlobalFailureMessageExtractionService.new);

    i.add<OpenMailService>(CoreOpenMailService.new);

    i.addLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(auth: FirebaseAuth.instance),
    );

    i.addLazySingleton<UserLeadsRepository>(
      () => UserLeadsRepositoryImpl(
        database: database!,
        dio: dio,
      ),
    );
  }
}

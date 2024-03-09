import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/test.dart';
import 'package:ws_work_test_mobile/app/domain/providers/migration_connection.dart';
import 'package:ws_work_test_mobile/app/domain/services/migration_service.dart';
import 'package:ws_work_test_mobile/app/external/provider/sqlite_migration_connection.dart';
import 'package:ws_work_test_mobile/app/external/services/sqlite_database_migration_service.dart';

import 'migration_service_test.mocks.dart';

@GenerateMocks([Database])
void main() {
  group('Migration Service Test', () {
    late MockDatabase database;
    late MigrationService service;
    late MigrationConnection connection;

    setUp(() {
      database = MockDatabase();
      connection = SqliteMigrationConnection(database: database);
      service = SqliteDatabaseMigrationService(connection: connection);
    });

    test('Should have at least one migration', () async {
      final migrations = service.getMigrations();

      expect(migrations.length, greaterThan(0));
    });

    test('Should run migrations without throwing exception', () async {
      when(database.execute(any, any)).thenAnswer(
        (realInvocation) => Future.value(),
      );

      when(database.rawQuery(any, any)).thenAnswer((_) async {
        return [];
      });


      when(database.rawInsert(any, any)).thenAnswer((_) async {
        return 1;
      });

      await service.up();
    });

    test('should throw exception if a migration fails', () async {
      when(database.execute(any)).thenThrow(Exception());
      when(database.rawQuery(any, any)).thenThrow(Exception());
      when(database.rawInsert(any, any)).thenThrow(Exception());

      expect(() async => await service.up(), throwsException);
    });

    test('Should rollback migrations without throwing exception', () async {
      when(database.execute(any, any)).thenAnswer(
            (realInvocation) => Future.value(),
      );

      when(database.rawQuery(any, any)).thenAnswer((_) async {
        return [];
      });


      when(database.rawInsert(any, any)).thenAnswer((_) async {
        return 1;
      });

      await service.down();
    });
  });
}

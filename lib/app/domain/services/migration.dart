import '../providers/migration_connection.dart';

abstract class Migration {
  Migration({required this.connection});

  final MigrationConnection connection;

  String get migrationName => runtimeType.toString();

  Future<void> up();

  Future<void> down();

  Future<bool> hasMigrationBeenRun() {
    return connection.hasMigrationBeenRun(migrationName);
  }

  Future<void> markMigrationAsRun() {
    return connection.markMigrationAsRun(migrationName);
  }
}

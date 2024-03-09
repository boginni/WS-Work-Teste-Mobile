import '../providers/migration_connection.dart';

abstract class Migration {
  Migration({required this.connection});

  final MigrationConnection connection;

  Future<void> up();

  Future<void> down();

  Future<bool> hasMigrationBeenRun() {
    return connection.hasMigrationBeenRun(runtimeType.toString());
  }

  Future<void> markMigrationAsRun() {
    return connection.markMigrationAsRun(runtimeType.toString());
  }


}

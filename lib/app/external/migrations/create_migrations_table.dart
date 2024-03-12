import '../../domain/services/migration.dart';

class CreateMigrationTable extends Migration {
  CreateMigrationTable({required super.connection});

  @override
  Future<void> down() {
    return connection.execute('''
      DROP TABLE migrations;
    ''');
  }

  @override
  Future<void> up() {
    return connection.execute('''
      CREATE TABLE IF NOT EXISTS migrations (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        migration TEXT NOT NULL,
        batch INTEGER NOT NULL DEFAULT 1
      );
    ''');
  }

  @override
  Future<bool> hasMigrationBeenRun() async {
    try {
      final result = await connection.hasMigrationBeenRun(migrationName);
      return result;
    } catch (e) {
      return false;
    }
  }
}

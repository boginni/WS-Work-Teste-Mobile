import '../../domain/services/migration.dart';

class CreateLeadsTable extends Migration {
  CreateLeadsTable({required super.connection});

  @override
  Future<void> down() {
    return connection.execute('''
      DROP TABLE user_leads;
    ''');
  }

  @override
  Future<void> up() {
    return connection.execute('''
      CREATE TABLE IF NOT EXISTS user_leads (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sync_status BOOLEAN NOT NULL DEFAULT 0,
        user_id INTEGER NOT NULL,
        vehicle_id INTEGER NOT NULL,
      );
    ''');
  }
}

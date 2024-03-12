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
        user_id INTEGER NOT NULL,
        vehicle_id INTEGER NOT NULL,
        sync_status BOOLEAN NOT NULL DEFAULT 0,
        vehicle_name TEXT NOT NULL,
        vehicle_price NUMERIC NOT NULL,
        sync_date TEXT,
        created_at TEXT NOT NULL,
        deleted_at TEXT
      );
    ''');
  }
}

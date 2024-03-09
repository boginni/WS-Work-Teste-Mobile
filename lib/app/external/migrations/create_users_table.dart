import '../../domain/services/migration.dart';

class CreateUsersTable extends Migration {
  CreateUsersTable({required super.connection});

  @override
  Future<void> down() {
    return connection.execute('''
      DROP TABLE users;
    ''');
  }

  @override
  Future<void> up() {
    return connection.execute('''
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
      );
    ''');
  }
}

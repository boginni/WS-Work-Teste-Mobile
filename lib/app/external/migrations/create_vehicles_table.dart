import '../../domain/services/migration.dart';

class CreateVehiclesTable extends Migration {
  CreateVehiclesTable({required super.connection});

  @override
  Future<void> down() {
    return connection.execute('''
      DROP TABLE vehicles;
    ''');
  }

  @override
  Future<void> up() {
    return connection.execute('''
      CREATE TABLE IF NOT EXISTS vehicles (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
      );
    ''');
  }
}

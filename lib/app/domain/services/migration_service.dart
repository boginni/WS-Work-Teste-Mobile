import 'migration.dart';

abstract class MigrationService {
  List<Migration> getMigrations();

  Future<void> down();

  Future<void> up();
}

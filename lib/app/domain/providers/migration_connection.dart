abstract class MigrationConnection {
  Future<void> execute(String sql);

  Future<bool> hasMigrationBeenRun(String migrationName);

  Future<void> markMigrationAsRun(String migrationName);
}

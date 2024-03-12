import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:ws_work_test_mobile/app/domain/providers/migration_connection.dart';

class SqliteMigrationConnection implements MigrationConnection {
  final Database database;

  final completer = Completer<void>();

  SqliteMigrationConnection({
    required this.database,
  });


  @override
  Future<void> execute(String sql) {
    return database.execute(sql);
  }

  @override
  Future<bool> hasMigrationBeenRun(String migrationName) async {
    final query = await database.rawQuery('SELECT * FROM migrations WHERE migration = ?', [migrationName]);
    return query.isNotEmpty;
  }

  @override
  Future<void> markMigrationAsRun(String migrationName) async {
    await database.rawInsert('INSERT INTO migrations (migration) VALUES (?)', [migrationName]);
  }
}

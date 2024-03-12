import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ws_work_test_mobile/app/domain/dto/entities/user/user_lead_entity.dart';

import '../../../domain/dto/params/user_lead_param.dart';
import '../../../domain/repositories/user_leads_repository.dart';

class UserLeadsRepositoryImpl extends UserLeadsRepository {
  final Database database;

  final Dio dio;

  const UserLeadsRepositoryImpl({
    required this.database,
    required this.dio,
  });

  static const String table = 'user_leads';

  @override
  Future<void> store(UserLeadParam param) async {
    await database.insert(table, param.toJson());
  }

  @override
  Future<void> delete(int id) async {
    await database.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<UserLeadEntity>> index() async {
    final result = await database.query(table, where: 'sync_date IS NULL');
    return result.map((e) => UserLeadEntity.fromJson(e)).toList();
  }

  @override
  Future<void> sync() async {
    final values = await index();
    for (final value in values) {
      await database.update(
        table,
        value.toJson(),
        where: 'id = ?',
        whereArgs: [value.id],
      );
    }
  }
}

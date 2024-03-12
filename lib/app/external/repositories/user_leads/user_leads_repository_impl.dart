import 'package:ws_work_test_mobile/app/domain/dto/entities/user/user_lead_entity.dart';

import '../../../domain/dto/params/user_lead_param.dart';
import '../../../domain/repositories/user_leads_repository.dart';

class UserLeadsRepositoryImpl extends UserLeadsRepository {
  @override
  Future<void> store(UserLeadParam param) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<UserLeadEntity>> index() async {
    throw UnimplementedError();
  }

  @override
  Future<void> sync() {
    // TODO: implement sync
    throw UnimplementedError();
  }
}

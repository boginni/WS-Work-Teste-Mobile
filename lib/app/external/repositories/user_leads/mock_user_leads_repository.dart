import 'package:ws_work_test_mobile/app/domain/dto/entities/user/user_lead_entity.dart';

import '../../../domain/dto/params/user_lead_param.dart';
import '../../../domain/repositories/user_leads_repository.dart';

final List<UserLeadEntity> _leads = [];

class MockUserLeadsRepository extends UserLeadsRepository {
  @override
  Future<void> store(UserLeadParam param) async {
    final userLeadEntity = UserLeadEntity(
      id: _leads.length + 1,
      userId: param.userId,
      vehicleId: param.vehicleId,
      syncStatus: false,
      vehicleName: param.vehicle.nomeModelo,
      vehiclePrice: param.vehicle.valor,
      syncDate: null,
      createdAt: DateTime.now(),
      deletedAt: null,
    );

    _leads.add(userLeadEntity);
  }

  @override
  Future<void> delete(int id) async {
    _leads.removeWhere((element) => element.id == id);
  }

  @override
  Future<List<UserLeadEntity>> index() async {
    return Future.value(_leads);
  }

  @override
  Future<void> sync() async {
    await Future.delayed(Duration(seconds: 2));
    _leads.clear();
  }
}

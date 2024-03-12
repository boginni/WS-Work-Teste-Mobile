import 'package:flutter/cupertino.dart';
import 'package:ws_work_test_mobile/app/domain/dto/entities/user/user_lead_entity.dart';

import '../../../../domain/dto/entities/vehicle/vehicle_entity.dart';

class LeadsStore extends ChangeNotifier {
  var _loading = true;

  List<UserLeadEntity> _leads = [];

  bool get loading => _loading;

  List<UserLeadEntity> get leads => _leads;

  int? get leadsCount => loading ? null : leads.length;

  bool get hasLeads => !loading && leads.isNotEmpty;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set leads(List<UserLeadEntity> value) {
    _leads = value;
    notifyListeners();
  }
}

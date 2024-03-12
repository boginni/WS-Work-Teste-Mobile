import 'package:flutter/cupertino.dart';
import 'package:ws_work_test_mobile/app/domain/dto/entities/user/user_lead_entity.dart';

class LeadsStore extends ChangeNotifier {
  bool _loading = true;

  bool _syncing = false;

  List<UserLeadEntity> _leads = [];

  LeadsStore();

  bool get syncing => _syncing;

  bool get loading => _loading;

  List<UserLeadEntity> get leads => _leads;

  int? get leadsCount => loading ? null : leads.length;

  bool get hasLeads => !loading && leads.isNotEmpty;

  set syncing(bool value) {
    _syncing = value;
    notifyListeners();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set leads(List<UserLeadEntity> value) {
    _leads = value;
    notifyListeners();
  }
}

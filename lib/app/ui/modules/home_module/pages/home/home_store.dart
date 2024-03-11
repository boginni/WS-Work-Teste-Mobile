import 'package:flutter/cupertino.dart';

import '../../../../../domain/dto/entities/vehicle/vehicle_entity.dart';

class HomeStore extends ChangeNotifier {
  var _loading = true;

  List<VehicleEntity> _vehicles = [];

  bool get loading => _loading;

  List<VehicleEntity> get vehicles => _vehicles;

  int get vehiclesCount => loading ? 3 : vehicles.length;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set vehicles(List<VehicleEntity> value) {
    _vehicles = value;
    notifyListeners();
  }
}

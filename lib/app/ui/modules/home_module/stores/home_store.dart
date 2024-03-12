import 'package:flutter/cupertino.dart';

import '../../../../domain/dto/entities/vehicle/vehicle_entity.dart';

class HomeStore extends ChangeNotifier {
  var _loading = true;

  List<VehicleEntity> _vehicles = [];

  final searchController = TextEditingController();

  HomeStore();

  bool get loading => _loading;

  bool get isSearching => searchController.text.isNotEmpty;

  List<VehicleEntity> get vehicles {
    if (searchController.text.isEmpty) {
      return _vehicles;
    }

    return _vehicles.where((element) {
      final search = searchController.text.toLowerCase();
      return element.nomeModelo.toLowerCase().contains(search);
    }).toList();
  }

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

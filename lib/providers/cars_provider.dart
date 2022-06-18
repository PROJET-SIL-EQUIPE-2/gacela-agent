import 'package:flutter/material.dart';
import 'package:gacela_am/models/services/cars_service.dart';
import 'package:gacela_am/models/vehicule.dart';

class CarsProvider with ChangeNotifier {
  // cars list
  List<Vehicule> carsList = [];

  Future<void> getAssignedCars(String? email) async {
    final CarsService carsService = CarsService();
    carsList = await carsService.getAssignedCars(email);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:gacela_am/models/services/support_service.dart';
import 'package:gacela_am/models/support.dart';

class SupportProvider with ChangeNotifier {
  List<Support> supports = [];

  Future<bool> getDemandesSupport(int? agentId) async {
    final SupportService supportService = SupportService();
    supports = await supportService.getDemandesSupport(agentId);
    notifyListeners();
    return true;
  }

  Future<bool> readDemandesSupport(Support support) async {
    final int index = supports
        .indexWhere((element) => element.demandeId == support.demandeId);
    if (supports[index].read == true) return true;

    supports[index].read = true;
    notifyListeners();

    final SupportService supportService = SupportService();
    final bool? success =
        await supportService.readDemandesSupport(support.demandeId);

    if (success == true) {
      return true;
    } else {
      supports[index].read = false;
      notifyListeners();
      return false;
    }
  }
}

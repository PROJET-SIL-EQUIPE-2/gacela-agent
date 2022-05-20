import 'dart:convert';

import 'package:gacela_am/models/vehicule.dart';

Panne panneFromJson(String str) => Panne.fromJson(json.decode(str));

String panneToJson(Panne data) => json.encode(data.toJson());

class Panne {
  Panne({
    this.panneId,
    this.vehiculeId,
    this.charge,
    this.datePanne,
    this.temperature,
    this.blocked,
    this.treated,
  });

  int? panneId;
  int? vehiculeId;
  int? charge;
  DateTime? datePanne;
  int? temperature;
  bool? blocked;
  bool? treated;

  Vehicule? vehicule;
  set setVehicule(Vehicule? vehicule) {
    this.vehicule = vehicule;
  }

  factory Panne.fromJson(Map<String, dynamic> json) => Panne(
        panneId: json["panne_id"],
        vehiculeId: json["vehicule_id"],
        charge: json["charge"],
        datePanne: DateTime.parse(json["date_panne"]),
        temperature: json["temperature"],
        blocked: json["blocked"],
        treated: json["treated"],
      );

  Map<String, dynamic> toJson() => {
        "panne_id": panneId,
        "vehicule_id": vehiculeId,
        "charge": charge,
        "date_panne": datePanne?.toIso8601String(),
        "temperature": temperature,
        "blocked": blocked,
        "treated": treated,
      };
}

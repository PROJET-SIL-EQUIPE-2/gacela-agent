import 'package:gacela_am/models/locataire.dart';
import 'package:gacela_am/models/vehicule.dart';

class Support {
  Support({
    this.demandeId,
    this.locataireId,
    this.agentId,
    this.vehiculeId,
    this.typeSupport,
    this.message,
    this.read,
    this.dateDemande,
    this.vehicule,
    this.locataire,
  });

  int? demandeId;
  int? locataireId;
  int? agentId;
  int? vehiculeId;
  String? typeSupport;
  String? message;
  bool? read;
  DateTime? dateDemande;

  Vehicule? vehicule;
  Locataire? locataire;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        demandeId: json["demande_id"],
        locataireId: json["locataire_id"],
        agentId: json["agent_id"],
        vehiculeId: json["vehicule_id"],
        typeSupport: json["type_support"],
        message: json["message"],
        read: json["read"],
        dateDemande: DateTime.tryParse(json["date_demande"] ?? ""),
        vehicule: Vehicule.fromJson(json["Vehicules"]),
        locataire: Locataire.fromJson(json["Locataires"]),
      );
}

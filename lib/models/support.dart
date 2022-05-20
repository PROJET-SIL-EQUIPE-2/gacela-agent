import 'dart:convert';

Support supportFromJson(String str) => Support.fromJson(json.decode(str));

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
  });

  int? demandeId;
  int? locataireId;
  int? agentId;
  int? vehiculeId;
  String? typeSupport;
  String? message;
  bool? read;
  DateTime? dateDemande;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        demandeId: json["demande_id"],
        locataireId: json["locataire_id"],
        agentId: json["agent_id"],
        vehiculeId: json["vehicule_id"],
        typeSupport: json["type_support"],
        message: json["message"],
        read: json["read"],
        dateDemande: DateTime.parse(json["date_demande"]),
      );

  Map<String, dynamic> toJson() => {
        "demande_id": demandeId,
        "locataire_id": locataireId,
        "agent_id": agentId,
        "vehicule_id": vehiculeId,
        "type_support": typeSupport,
        "message": message,
        "read": read,
        "date_demande": dateDemande?.toIso8601String(),
      };
}

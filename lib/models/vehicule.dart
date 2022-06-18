class Vehicule {
  Vehicule({
    this.vehiculeId,
    this.matricule,
    this.carPhoto,
    this.responsable,
    this.typeVehicule,
    this.kilometrage,
    this.etat,
    this.disponible,
    this.pricePerHour,
    this.locked,
  });

  int? vehiculeId;
  String? matricule;
  dynamic carPhoto;
  int? responsable;
  int? typeVehicule;
  int? kilometrage;
  String? etat;
  bool? disponible;
  int? pricePerHour;
  bool? locked;

  factory Vehicule.fromJson(Map<String, dynamic> json) => Vehicule(
        vehiculeId: json["vehicule_id"],
        matricule: json["matricule"],
        carPhoto: json["car_photo"],
        responsable: json["responsable"],
        typeVehicule: json["type_vehicule"],
        kilometrage: json["kilometrage"],
        etat: json["etat"],
        disponible: json["disponible"],
        pricePerHour: json["price_per_hour"],
        locked: json["locked"],
      );

  Map<String, dynamic> toJson() => {
        "vehicule_id": vehiculeId,
        "matricule": matricule,
        "car_photo": carPhoto,
        "responsable": responsable,
        "type_vehicule": typeVehicule,
        "kilometrage": kilometrage,
        "etat": etat,
        "disponible": disponible,
        "price_per_hour": pricePerHour,
        "locked": locked,
      };
}

class Locataire {
  Locataire({
    this.familyName,
    this.name,
    this.email,
    this.phoneNumber,
  });

  String? familyName;
  String? name;
  String? email;
  String? phoneNumber;

  factory Locataire.fromJson(Map<String, dynamic> json) => Locataire(
        familyName: json["family_name"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "family_name": familyName,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
      };
}

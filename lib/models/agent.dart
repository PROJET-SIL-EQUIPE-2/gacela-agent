import 'dart:convert';

Agent agentFromJson(String str) => Agent.fromJson(json.decode(str));

String agentToJson(Agent data) => json.encode(data.toJson());

class Agent {
  Agent({
    this.id,
    this.email,
    this.phoneNumber,
    this.name,
    this.familyName,
  });

  int? id;
  String? email;
  String? phoneNumber;
  String? name;
  String? familyName;

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        id: json["data"]["id"],
        email: json["data"]["email"],
        phoneNumber: json["data"]["phone_number"],
        name: json["data"]["name"],
        familyName: json["data"]["family_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone_number": phoneNumber,
        "name": name,
        "family_name": familyName,
      };
}

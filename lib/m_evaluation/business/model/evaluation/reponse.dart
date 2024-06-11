import 'dart:convert';

Reponse ReponseFromJson(String str) => Reponse.fromJson(json.decode(str));

String ReponseToJson(Reponse data) => json.encode(data.toJson());

class Reponse {
  int id;
  int intervenantId;
  int phaseId;
  List<dynamic> resultat;
  DateTime createdAt;
  DateTime updatedAt;

  Reponse({
    required this.id,
    this.intervenantId =0,
    this.phaseId =0,
    required this.resultat,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Reponse.fromJson(Map<String, dynamic> json) => Reponse(
    id: json["id"] ?? 0,
    intervenantId: json["intervenantId"] ?? 0,
    phaseId: json["phaseId"],
    resultat: List<dynamic>.from(json["resultat"].map((x) => x)) ?? [],
    createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
    updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "intervenantId": intervenantId,
    "phaseId": phaseId,
    "resultat": List<dynamic>.from(resultat.map((x) => x)),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

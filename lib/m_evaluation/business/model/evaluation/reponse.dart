import 'dart:convert';

Reponse reponsesFromJson(String str) => Reponse.fromJson(json.decode(str));

String reponsesToJson(Reponse data) => json.encode(data.toJson());

class Reponse {
  int id;
  int intervenantId;
  int questionsPhasesId;
  int assertionsId;
  double cote;
  DateTime createdAt;
  DateTime updatedAt;

  Reponse({
    required this.id,
    this.intervenantId =1,
    this.questionsPhasesId=1,
    this.assertionsId=1,
    this.cote=10.0,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Reponse.fromJson(Map json) => Reponse(
    id: json["id"] ?? 1,
    intervenantId: json["intervenant_id"] ?? 1,
    questionsPhasesId: json["questions_phases_id"] ?? 1,
    assertionsId: json["assertions_id"] ?? 1,
    cote: json["cote"] ?? 100.0,
    createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
    updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
  );

  Map toJson() => {
    "id": id,
    "intervenant_id": intervenantId,
    "questions_phases_id": questionsPhasesId,
    "assertions_id": assertionsId,
    "cote": cote,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

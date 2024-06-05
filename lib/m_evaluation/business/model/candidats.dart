import 'dart:convert';

Candidat candidatFromJson(String str) => Candidat.fromJson(json.decode(str));

String candidatToJson(Candidat data) => json.encode(data.toJson());

class Candidat {
  int id;
  int evaluationId;
  String nom;
  String email;
  DateTime createdAt;
  DateTime updatedAt;

  Candidat({
    required this.id,
    this.evaluationId = 1,
    this.nom = "",
    this.email = "",
    required this.createdAt,
    required this.updatedAt,
  });

  factory Candidat.fromJson(Map<String, dynamic> json) => Candidat(
    id: json["id"] ?? 1,
    evaluationId: json["evaluationId"] ?? 1,
    nom: json["nom"] ?? "",
    email: json["email"] ?? "",
    createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
    updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "evaluationId": evaluationId,
    "nom": nom,
    "email": email,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

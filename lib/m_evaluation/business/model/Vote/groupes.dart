// To parse this JSON data, do
//
//     final groupes = groupesFromJson(jsonString);

import 'dart:convert';

Groupes groupesFromJson(String str) => Groupes.fromJson(json.decode(str));

String groupesToJson(Groupes data) => json.encode(data.toJson());

class Groupes {
  int id;
  int intervenantId;
  String nom;
  String photo;
  DateTime createdAt;
  DateTime updatedAt;

  Groupes({
    this.id =0,
    this.intervenantId =0,
    this.nom = "",
    this.photo = "",
    required this.createdAt,
    required this.updatedAt,
  });

  factory Groupes.fromJson(Map<String, dynamic> json) => Groupes(
    id: json["id"] ?? 0,
    intervenantId: json["intervenantId"] ?? 0,
    nom: json["nom"] ?? "",
    photo: json["photo"] ?? "",
    createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
    updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "intervenantId": intervenantId,
    "nom": nom,
    "photo": photo,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

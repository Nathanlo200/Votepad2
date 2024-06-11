 // To parse this JSON data, do
//
//     final votes = votesFromJson(jsonString);

import 'dart:convert';

Votes votesFromJson(String str) => Votes.fromJson(json.decode(str));

String votesToJson(Votes data) => json.encode(data.toJson());

class Votes {
  int id;
  int phasesIntervenantId;
  int phasesCritereId;
  int phasesJurysId;
  double cote;
  int nombre;
  bool isVerified;
  DateTime createdAt;
  DateTime updatedAt;

  Votes({
    required this.id,
    this.phasesIntervenantId = 0,
    this.phasesCritereId =0,
    this.phasesJurysId =0,
    this.cote =0.0,
    this.nombre = 0,
    this.isVerified =false,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Votes.fromJson(Map<String, dynamic> json) => Votes(
    id: json["id"] ?? 0,
    phasesIntervenantId: json["phasesIntervenantId"] ?? 0,
    phasesCritereId: json["phasesCritereId"] ?? 0,
    phasesJurysId: json["phasesJurysId"] ?? 0,
    cote: json["cote"] ?? 0.0,
    nombre: json["nombre"] ?? 0,
    isVerified: json["isVerified"] ?? false,
    createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
    updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phasesIntervenantId": phasesIntervenantId,
    "phasesCritereId": phasesCritereId,
    "phasesJurysId": phasesJurysId,
    "cote": cote,
    "nombre": nombre,
    "isVerified": isVerified,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

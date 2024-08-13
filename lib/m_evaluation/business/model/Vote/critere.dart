import 'dart:convert';

class Criteres {
  int id;
  int phase_id;
  String libelle;
  int ponderation;
  String description;

  Criteres({
    required this.id,
    required this.phase_id,
    this.libelle ="",
    this.ponderation=0,
    this.description="",
  });

  factory Criteres.fromRawJson(String str) => Criteres.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Criteres.fromJson(Map json) => Criteres(
    id: json["id"]??0,
    phase_id: json["phase_id"]??0,
    libelle: json["libelle"]?? "",
    ponderation: json["ponderation"]??0,
    description: json["description"]?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phase_id": phase_id,
    "libelle": libelle,
    "ponderation": ponderation,
    "description": description
  };
}

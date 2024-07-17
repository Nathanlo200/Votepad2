import 'dart:convert';

class Criteres {
  int id;
  String libelle;
  int ponderation;
  String description;

  Criteres({
    required this.id,
    this.libelle ="",
    this.ponderation=0,
    this.description="",
  });

  factory Criteres.fromRawJson(String str) => Criteres.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Criteres.fromJson(Map json) => Criteres(
    id: json["id"]??0,
    libelle: json["libelle"]?? "",
    ponderation: json["ponderation"]??0,
    description: json["description"]?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "libelle": libelle,
    "ponderation": ponderation,
    "description": description
  };
}

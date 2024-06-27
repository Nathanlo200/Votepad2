import 'dart:convert';

Phases phasesFromJson(String str) => Phases.fromJson(json.decode(str));

String phasesToJson(Phases data) => json.encode(data.toJson());

class Phases {
  int id;
  String nom;
  String description;
  DateTime dateDebut;
  DateTime dateFin;
  String type;
  String slug;
  dynamic duree;
  int evenementId;
  bool statut;

  Phases({
    required this.id,
    required this.nom,
    required this.description,
    required this.dateDebut,
    required this.dateFin,
    required this.type,
    required this.slug,
    required this.duree,
    required this.evenementId,
    required this.statut
  });

  factory Phases.fromJson(Map<String, dynamic> json) => Phases(
    id: json["id"],
    nom: json["nom"],
    description: json["description"],
    dateDebut: DateTime.parse(json["date_debut"]),
    dateFin: DateTime.parse(json["date_fin"]),
    type: json["type"],
    slug: json["slug"],
    duree: json["duree"],
    evenementId: json["evenement_id"],
    statut: json["statut"]??false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "description": description,
    "date_debut": dateDebut.toIso8601String(),
    "date_fin": dateFin.toIso8601String(),
    "type": type,
    "slug": slug,
    "duree": duree,
    "evenement_id": evenementId,
    "statut": statut
  };
}

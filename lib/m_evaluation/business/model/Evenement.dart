import 'dart:convert';

Evenement evenementFromJson(String str) => Evenement.fromJson(json.decode(str));

String evenementToJson(Evenement data) => json.encode(data.toJson());

class Evenement {
    int id;
    String nom;
    String description;
    String type;
    DateTime dateDebut;
    DateTime dateFin;
    bool statut;
    DateTime createdAt;
    DateTime updatedAt;

    Evenement({
        required this.id,
        this.nom ="",
        this.description ="",
        this.type ="",
        required this.dateDebut,
        required this.dateFin,
        this.statut = false,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Evenement.fromJson(Map<String, dynamic> json) => Evenement(
        id: json["id"] ?? 1,
        nom: json["nom"] ?? "",
        description: json["description"] ?? "",
        type: json["type"] ?? "",
        dateDebut: json["dateDebut"] != null? DateTime.parse(json["dateDebut"] ?? ""): DateTime.now(),
        dateFin: json["dateFin"] != null? DateTime.parse(json["dateFin"] ?? ""): DateTime.now(),
        statut: json["statut"] ?? "",
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "description": description,
        "type": type,
        "dateDebut": dateDebut.toIso8601String(),
        "dateFin": dateFin.toIso8601String(),
        "statut": statut,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

import 'dart:convert';

Phases phasesFromJson(String str) => Phases.fromJson(json.decode(str));

String phasesToJson(Phases data) => json.encode(data.toJson());

class Phases {
    int id;
    int evenementId;
    String nom;
    String description;
    String type;
    DateTime dateDebut;
    DateTime dateFin;
    bool statut;
    DateTime createdAt;
    DateTime updatedAt;
    int nbreCandidats;

    Phases({
        required this.id,
        this.evenementId =1,
        this.nom = "",
        this.description ="",
        this.type ="",
        required this.dateDebut,
        required this.dateFin,
        this.statut = false,
        required this.createdAt,
        required this.updatedAt,
        this.nbreCandidats = 0
    });

    factory Phases.fromJson(Map<String, dynamic> json) => Phases(
        id: json["id"] ?? 1,
        evenementId: json["evenementId"] ?? 0,
        nbreCandidats: json["nbreCandidats"] ?? 0,
        nom: json["nom"] ?? "",
        description: json["description"] ?? "",
        type: json["type"] ?? "",
        dateDebut: json["dateDebut"] != null? DateTime.parse(json["dateDebut"] ?? ""): DateTime.now(),
        dateFin: json["dateDebut"] != null? DateTime.parse(json["dateDebut"] ?? ""): DateTime.now(),
        statut: json["statut"] ?? false,
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "evenementId": evenementId,
        "nbreCandidats": nbreCandidats,
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

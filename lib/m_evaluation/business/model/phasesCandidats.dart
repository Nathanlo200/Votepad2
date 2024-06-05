import 'dart:convert';

PhasesCandidats phasesCandidatsFromJson(String str) => PhasesCandidats.fromJson(json.decode(str));

String phasesCandidatsToJson(PhasesCandidats data) => json.encode(data.toJson());

class PhasesCandidats {
    int id;
    int phaseId;
    int candidatId;
    double ponderation;
    DateTime createdAt;
    DateTime updatedAt;

    PhasesCandidats({
        required this.id,
        this.phaseId =1,
        this.candidatId =1,
        this.ponderation = 0.0,
        required this.createdAt,
        required this.updatedAt,
    });

    factory PhasesCandidats.fromJson(Map<String, dynamic> json) => PhasesCandidats(
        id: json["id"] ?? 1,
        phaseId: json["phaseId"] ?? 0,
        candidatId: json["candidatId"] ?? 0,
        ponderation: json["ponderation"] ?? 0.0,
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phaseId": phaseId,
        "candidatId": candidatId,
        "ponderation": ponderation,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String()
    };
}

import 'dart:convert';

class Intervenants {
    int id;
    int phaseId;
    int intervenantId;
    String phaseName;
    String email;
    DateTime createdAt;
    DateTime updatedAt;
    bool isDone;

    Intervenants({
        required this.id,
        this.phaseId = 1,
        this.intervenantId = 1,
        this.phaseName = "",
        this.email ="",
        required this.createdAt,
        required this.updatedAt,
        this.isDone = false,
    });

    factory Intervenants.fromRawJson(String str) => Intervenants.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Intervenants.fromJson(Map<String, dynamic> json) => Intervenants(
        id: json["id"] ?? 1,
        phaseId: json["phase_id"] ?? 1,
        intervenantId: json["intervenant"] ?? 1,
        phaseName: json["phase_nom"] ?? "",
        email: json["email"] ?? "",
        isDone: json["isDone"] ?? false,
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phase_id": phaseId,
        "intervenant": intervenantId,
        "phase_nom": phaseName,
        "email": email,
        "isDone": isDone,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

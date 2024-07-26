import 'dart:convert';



class PhaseCriteres {
    int id;
    int phaseId;
    int echelle;
    DateTime createdAt;
    DateTime updatedAt;

    PhaseCriteres({
        required this.id,
        this.phaseId =0,
        this.echelle= 0,
        required this.createdAt,
        required this.updatedAt,
    });

    factory PhaseCriteres.fromRawJson(String str) => PhaseCriteres.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PhaseCriteres.fromJson(Map json) => PhaseCriteres(
        id: json["id"]?? 0,
        phaseId: json["phase_id"]?? 0,
        echelle: json["echelle"]?? 0,
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? ""): DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phase_id": phaseId,
        "echelle": echelle,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

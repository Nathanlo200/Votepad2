import 'dart:convert';

class PhaseJurys {
    int id;
    int phaseId;
    int juryId;
    String typeJury;
    double ponderationPrive;
    double ponderarionPublic;
    DateTime createdAt;
    DateTime updatedAt;

    PhaseJurys({
        required this.id,
        this.phaseId =1,
        this.juryId =1,
        this.typeJury = "",
        this.ponderationPrive = 0.0,
        this.ponderarionPublic = 0.0,
        required this.createdAt,
        required this.updatedAt,
    });

    factory PhaseJurys.fromRawJson(String str) => PhaseJurys.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PhaseJurys.fromJson(Map<String, dynamic> json) => PhaseJurys(
        id: json["id"] ?? 1,
        phaseId: json["phase_id"] ?? 0,
        juryId: json["jury_id"] ?? 0,
        typeJury: json["type_jury"] ?? "",
        ponderationPrive: json["ponderation_prive"] ?? 0.0,
        ponderarionPublic: json["ponderarion_public"] ?? 0.0,
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phase_id": phaseId,
        "jury_id": juryId,
        "type_jury": typeJury,
        "ponderation_prive": ponderationPrive,
        "ponderarion_public": ponderarionPublic,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

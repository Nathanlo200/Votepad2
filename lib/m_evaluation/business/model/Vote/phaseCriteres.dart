import 'package:meta/meta.dart';
import 'dart:convert';

class PhaseCriteres {
    int id;
    int phaseId;
    int critereId;
    int echelle;
    DateTime createdAt;
    DateTime updatedAt;

    PhaseCriteres({
        required this.id,
        this.phaseId = 1,
        this.critereId = 1,
        this.echelle = 1,
        required this.createdAt,
        required this.updatedAt,
    });

    factory PhaseCriteres.fromRawJson(String str) => PhaseCriteres.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PhaseCriteres.fromJson(Map<String, dynamic> json) => PhaseCriteres(
        id: json["id"] ?? 1,
        phaseId: json["phase_id"] ?? 0,
        critereId: json["critere_id"] ?? 0,
        echelle: json["echelle"] ?? 0,
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phase_id": phaseId,
        "critere_id": critereId,
        "echelle": echelle,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

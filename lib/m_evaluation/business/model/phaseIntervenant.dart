import 'package:meta/meta.dart';
import 'dart:convert';

class PhaseIntervenant {
    int id;
    int idPhase;
    int idGroupe;
    DateTime createdAt;
    DateTime updatedAt;

    PhaseIntervenant({
        required this.id,
        this.idPhase = 1,
        this.idGroupe = 1,
        required this.createdAt,
        required this.updatedAt,
    });

    factory PhaseIntervenant.fromRawJson(String str) => PhaseIntervenant.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PhaseIntervenant.fromJson(Map<String, dynamic> json) => PhaseIntervenant(
        id: json["id"] ?? 1,
        idPhase: json["id_phase"] ?? 0,
        idGroupe: json["id_groupe"] ?? 0,
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_phase": idPhase,
        "id_groupe": idGroupe,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

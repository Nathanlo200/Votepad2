import 'package:meta/meta.dart';
import 'dart:convert';

Reponses reponsesFromJson(String str) => Reponses.fromJson(json.decode(str));

String reponsesToJson(Reponses data) => json.encode(data.toJson());

class Reponses {
    int id;
    int phaseQuestionId;
    int phasecandidatId;
    String choix;
    DateTime createdAt;
    DateTime updatedAt;

    Reponses({
        required this.id,
        this.phaseQuestionId =1,
        this.phasecandidatId =1,
        this.choix ="",
        required this.createdAt,
        required this.updatedAt,
    });

    factory Reponses.fromJson(Map<String, dynamic> json) => Reponses(
        id: json["id"] ?? 1,
        phaseQuestionId: json["phaseQuestionId"] ?? 0,
        phasecandidatId: json["phasecandidatId"] ?? 0,
        choix: json["choix"] ?? "",
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phaseQuestionId": phaseQuestionId,
        "phasecandidatId": phasecandidatId,
        "choix": choix,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

import 'dart:convert';

PhasesQuestions phasesQuestionsFromJson(String str) => PhasesQuestions.fromJson(json.decode(str));

String phasesQuestionsToJson(PhasesQuestions data) => json.encode(data.toJson());

class PhasesQuestions {
    int id;
    int phaseId;
    int questionId;
    double ponderation;
    DateTime createdAt;
    DateTime updatedAt;

    PhasesQuestions({
        required this.id,
        this.phaseId = 1,
        this.questionId =1,
        this.ponderation = 0.0,
        required this.createdAt,
        required this.updatedAt,
    });

    factory PhasesQuestions.fromJson(Map<String, dynamic> json) => PhasesQuestions(
        id: json["id"] ?? 1,
        phaseId: json["phaseId"] ?? 0,
        questionId: json["questionId"] ?? 0,
        ponderation: json["ponderation"] ?? 0.0,
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phaseId": phaseId,
        "questionId": questionId,
        "ponderation": ponderation,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

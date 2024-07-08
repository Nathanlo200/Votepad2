import 'dart:convert';

PhasesQuestions phasesQuestionsFromJson(String str) => PhasesQuestions.fromJson(json.decode(str));

String phasesQuestionsToJson(PhasesQuestions data) => json.encode(data.toJson());

class PhasesQuestions {
    int id;
    int phase_id;
    int question_id;
    double ponderation;
    DateTime createdAt;
    DateTime updatedAt;

    PhasesQuestions({
        required this.id,
        this.phase_id = 1,
        this.question_id =1,
        this.ponderation = 0.0,
        required this.createdAt,
        required this.updatedAt,
    });

    factory PhasesQuestions.fromJson(Map<String, dynamic> json) => PhasesQuestions(
        id: json["id"] ?? 1,
        phase_id: json["phase_id"] ?? 0,
        question_id: json["question_id"] ?? 0,
        ponderation: json["ponderation"] ?? 0.0,
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phase_id": phase_id,
        "question_id": question_id,
        "ponderation": ponderation,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

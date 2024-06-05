import 'dart:convert';

Question questionFromJson(String str) => Question.fromJson(json.decode(str));

String questionToJson(Question data) => json.encode(data.toJson());

class Question {
  int id;
  String question;
  int evaluationId;
  DateTime createdAt;
  DateTime updatedAt;

  Question({
    required this.id,
    this.question ="",
    this.evaluationId =1,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"] ?? 1,
    question: json["question"] ?? "",
    evaluationId: json["evaluationId"] ?? 0,
    createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
    updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "evaluationId": evaluationId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

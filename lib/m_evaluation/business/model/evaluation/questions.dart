import 'dart:convert';

Question questionFromJson(String str) => Question.fromJson(json.decode(str));

String questionToJson(Question data) => json.encode(data.toJson());

class Question {
  int id;
  String libelle;
  DateTime createdAt;
  DateTime updatedAt;

  Question({
    required this.id,
    this.libelle ="",
    required this.createdAt,
    required this.updatedAt,
  });

  factory Question.fromJson(Map json) => Question(
    id: json["id"] ?? 1,
    //libelle: json["question"] ?? "",
    libelle: json["libele"] ?? "",
    createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
    updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
  );

  Map toJson() => {
    "id": id,
    "libele": libelle,
    //"question": libelle,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

import 'dart:convert';


Assertions assertionsFromJson(String str) => Assertions.fromJson(json.decode(str));

String assertionsToJson(Assertions data) => json.encode(data.toJson());

class Assertions {
  int id;
  int questionId;
  String libelle;
  double ponderation;
  DateTime createdAt;
  DateTime updatedAt;

  Assertions({
    required this.id,
    this.questionId =1,
    this.libelle ="",
    this.ponderation =0.0,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Assertions.fromJson(Map<String, dynamic> json) => Assertions(
    id: json["id"],
    questionId: json["questionId"],
    libelle: json["libelle"],
    ponderation: json["ponderation"],
    createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
    updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "questionId": questionId,
    "libelle": libelle,
    "ponderation": ponderation,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

}

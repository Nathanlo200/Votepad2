import 'dart:convert';


Assertions assertionsFromJson(String str) => Assertions.fromJson(json.decode(str));

String assertionsToJson(Assertions data) => json.encode(data.toJson());

class Assertions {
  int id;
  int question_id;
  String libelle;
  int ponderation;
  DateTime createdAt;
  DateTime updatedAt;

  Assertions({
    required this.id,
    this.question_id =1,
    this.libelle ="",
    this.ponderation =0,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Assertions.fromJson(Map json) => Assertions(
    id: json["id"]??0,
    question_id: json["question_id"]?? 0,
    libelle: json["assertion"]?? "",
    ponderation: json["ponderation"]?? 0,
    createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
    updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question_id": question_id,
    "assertion": libelle,
    "ponderation": ponderation,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

}

import 'dart:convert';

Notification notificationFromJson(String str) => Notification.fromJson(json.decode(str));

String notificationToJson(Notification data) => json.encode(data.toJson());

class Notification {
    int id;
    int questionId;
    String libelle;
    double ponderation;
    DateTime createdAt;
    DateTime updatedAt;


    Notification({
       required this.id,
        this.questionId = 1,
        this.libelle = "",
        this.ponderation = 0.0,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"] ?? 1,
        questionId: json["questionId"] ?? 1,
        libelle: json["libelle"] ?? "",
        ponderation: json["ponderation"] ?? 0.0,
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

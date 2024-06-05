import 'dart:convert';

Notification notificationFromJson(String str) => Notification.fromJson(json.decode(str));

String notificationToJson(Notification data) => json.encode(data.toJson());

class Notification {
    int id;
    int phaseCandidatId;
    String objet;
    String message;
    DateTime createdAt;
    DateTime updatedAt;

    Notification({
        required this.id,
        this.phaseCandidatId = 1,
        this.objet ="",
        this.message ="",
        required this.createdAt,
        required this.updatedAt,
    });

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"] ?? 1,
        phaseCandidatId: json["phaseCandidatId"] ?? 1,
        objet: json["objet"] ?? "",
        message: json["message"] ?? "",
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phaseCandidatId": phaseCandidatId,
        "objet": objet,
        "message": message,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

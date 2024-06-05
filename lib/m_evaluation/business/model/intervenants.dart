import 'package:meta/meta.dart';
import 'dart:convert';

class Intervenants {
    int id;
    int phasesIntervenantsId;
    String name;
    String email;
    DateTime createdAt;
    DateTime updatedAt;

    Intervenants({
        required this.id,
        this.phasesIntervenantsId = 1,
        this.name = "",
        this.email ="",
        required this.createdAt,
        required this.updatedAt,
    });

    factory Intervenants.fromRawJson(String str) => Intervenants.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Intervenants.fromJson(Map<String, dynamic> json) => Intervenants(
        id: json["id"] ?? 1,
        phasesIntervenantsId: json["phases_intervenants_id"] ?? 1,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phases_intervenants_id": phasesIntervenantsId,
        "name": name,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

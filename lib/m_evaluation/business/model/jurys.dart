import 'package:meta/meta.dart';
import 'dart:convert';

class Jurys {
    int id;
    String email;
    String name;
    String fonction;
    String token;
    DateTime createdAt;
    DateTime updatedAt;

    Jurys({
        required this.id,
        this.email ="",
        this.name ="",
        this.fonction ="",
        this.token ="",
        required this.createdAt,
        required this.updatedAt,
    });

    factory Jurys.fromRawJson(String str) => Jurys.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Jurys.fromJson(Map<String, dynamic> json) => Jurys(
        id: json["id"] ?? 1,
        email: json["email"] ?? "",
        name: json["name"] ?? "",
        fonction: json["fonction"] ?? "",
        token: json["token"] ?? "",
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),

    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "fonction": fonction,
        "token": token,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

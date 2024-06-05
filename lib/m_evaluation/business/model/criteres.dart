import 'package:meta/meta.dart';
import 'dart:convert';

class Criteres {
    int id;
    String libelle;
    double ponderation;
    DateTime createdAt;
    DateTime updatedAt;

    Criteres({
        required this.id,
        this.libelle = "",
        this.ponderation = 0.0,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Criteres.fromRawJson(String str) => Criteres.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Criteres.fromJson(Map<String, dynamic> json) => Criteres(
        id: json["id"] ?? 1,
        libelle: json["libelle"] ?? "",
        ponderation: json["ponderation"] ?? 0.0,
        createdAt: json["created_at"]!=null? DateTime.parse(json["created_at"] ?? ""): DateTime.now(),
        updatedAt: json["updated_at"]!=null? DateTime.parse(json["updated_at"] ?? "") : DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "ponderation": ponderation,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

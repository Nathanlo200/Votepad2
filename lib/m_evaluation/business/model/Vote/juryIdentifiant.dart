import '../Phases.dart';

class JuryIdentifiant {
  Phases? phase;
  String token;
  int nombre_user;

  JuryIdentifiant({
    this.phase,
    this.token ="",
    this.nombre_user =0
  });

  factory JuryIdentifiant.fromJson(Map json) => JuryIdentifiant(
    phase: json["phase"] == null ? null : Phases.fromJson(json["phase"]),
    token: json["token"]?? "",
    nombre_user: json["nombre_user"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "phase": phase?.toJson(),
    "token": token,
    "nombre_user": nombre_user
  };
}
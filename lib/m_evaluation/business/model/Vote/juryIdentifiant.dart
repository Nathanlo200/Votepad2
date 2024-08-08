import '../Phases.dart';

class JuryIdentifiant {
  Phases? phase;
  String? token;

  JuryIdentifiant({
    this.phase,
    this.token,
  });

  factory JuryIdentifiant.fromJson(Map<String, dynamic> json) => JuryIdentifiant(
    phase: json["phase"] == null ? null : Phases.fromJson(json["phase"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "phase": phase?.toJson(),
    "token": token,
  };
}
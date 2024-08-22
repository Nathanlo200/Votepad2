import 'dart:convert';

IntervenantEvaluation intervenantEvaluationFromJson(String str) => IntervenantEvaluation.fromJson(json.decode(str));

String intervenantEvaluationToJson(IntervenantEvaluation data) => json.encode(data.toJson());

class IntervenantEvaluation {
  int id;
  int phaseId;
  int intervenant;
  String phaseNom;
  String eventNom;
  String email;
  String createdAt;
  String updatedAt;
  String token;

  IntervenantEvaluation({
    this.id= 0,
    this.phaseId=0,
    this.intervenant=0,
    this.phaseNom="",
    this.email="",
    this.createdAt="",
    this.updatedAt="",
    this.token="",
    this.eventNom = ""
  });

  factory IntervenantEvaluation.fromJson(Map<String, dynamic> json) => IntervenantEvaluation(
    id: json["id"]?? 1,
    phaseId: json["phase_id"]?? 1,
    intervenant: json["intervenant"]?? 1,
    phaseNom: json["phase_nom"] ?? "",
    eventNom: json["evenement_nom"] ?? "",
    email: json["email"]??"",
    createdAt: json["created_at"]?? "",
    updatedAt: json["updated_at"]?? "",
    token: json["token"]?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phase_id": phaseId,
    "intervenant": intervenant,
    "phase_nom": phaseNom,
    "evenement_nom": eventNom,
    "email": email,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "token": token,
  };
}

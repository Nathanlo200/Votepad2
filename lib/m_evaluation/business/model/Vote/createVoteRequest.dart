import 'dart:convert';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/ResultatVotes.dart';

class CreateVoteRequest {
  int? intervenantId;
  int? phaseId;
  List<ResultatVotes>? cote;
  int nombre_user;

  CreateVoteRequest({
    this.intervenantId,
    this.phaseId,
    this.cote,
    this.nombre_user = 0
  });

  factory CreateVoteRequest.fromRawJson(String str) => CreateVoteRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateVoteRequest.fromJson(Map json) => CreateVoteRequest(
    intervenantId: json["intervenant_id"],
    phaseId: json["phase_id"],
    cote: json["cote"] == null ? [] : List<ResultatVotes>.from(json["cote"]!.map((x) => ResultatVotes.fromJson(x))),
    nombre_user: json["nombre_user"]??0
  );

  Map<String, dynamic> toJson() => {
    "intervenant_id": intervenantId,
    "phase_id": phaseId,
    "cote": cote == null ? [] : cote!.map((x) => x.toJson()).toList(),
    "nombre_user": nombre_user
  };
}

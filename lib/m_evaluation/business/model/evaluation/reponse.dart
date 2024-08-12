import 'dart:convert';

Reponse reponsesFromJson(String str) => Reponse.fromJson(json.decode(str));

String reponsesToJson(Reponse data) => json.encode(data.toJson());

class Reponse {
  int intervenantId;
  int questionsPhasesId;
  List<Map<String, int>> cote;
  Reponse({
    this.intervenantId =1,
    this.questionsPhasesId=1,
    this.cote= const [],

  });

  factory Reponse.fromJson(Map json) => Reponse(
    intervenantId: json["intervenant_id"] ?? 1,
    questionsPhasesId: json["phase_id"] ?? 1,
    cote: json["cote"]

  );

  Map toJson() => {
    "intervenant_id": intervenantId.toString(),
    "phase_id": questionsPhasesId.toString(),
    "cote": cote//.map<Map<String, String>>((e)=> {"question_id":e["question_id"].toString(), "assertion_id": e["assertion_id"].toString()}).toList(),
  };
}

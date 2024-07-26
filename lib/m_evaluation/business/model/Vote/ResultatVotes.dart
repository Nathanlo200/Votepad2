import 'dart:convert';

class ResultatVotes {
  int? critereId;
  double? valeur;

  ResultatVotes({
    this.critereId,
    this.valeur,
  });

  factory ResultatVotes.fromRawJson(String str) => ResultatVotes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultatVotes.fromJson(Map json) => ResultatVotes(
    critereId: json["critere_id"],
    valeur: json["valeur"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "critere_id": critereId,
    "valeur": valeur,
  };
}

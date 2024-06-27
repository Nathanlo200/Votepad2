import 'dart:convert';

EvenementVote evenementFromJson(String str) => EvenementVote.fromJson(json.decode(str));

String evenementToJson(EvenementVote data) => json.encode(data.toJson());


class EvenementVote {
  int idEvent;
  String nomEvent;
  String typeEvent;

  EvenementVote({
    required this.idEvent,
    required this.nomEvent,
    required this.typeEvent,
  });

  factory EvenementVote.fromJson(Map<String, dynamic> json) => EvenementVote(
    idEvent: json["id_event"],
    nomEvent: json["nom_event"],
    typeEvent: json["type_event"],
  );

  Map<String, dynamic> toJson() => {
    "id_event": idEvent,
    "nom_event": nomEvent,
    "type_event": typeEvent,
  };
}
import 'dart:convert';

class CreateVoteRequest {
  int idVotes;
  double cote;
  int nombre;
  int phasesJurysid;

  CreateVoteRequest({
    required this.idVotes,
    required this.cote,
    required this.nombre,
    required this.phasesJurysid,
  });

  factory CreateVoteRequest.fromRawJson(String str) => CreateVoteRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateVoteRequest.fromJson(Map<String, dynamic> json) => CreateVoteRequest(
    idVotes: json["id_votes"],
    cote: json["cote"]?.toDouble(),
    nombre: json["nombre"],
    phasesJurysid: json["phasesJurysid"],
  );

  Map<String, dynamic> toJson() => {
    "id_votes": idVotes,
    "cote": cote,
    "nombre": nombre,
    "phasesJurysid": phasesJurysid,
  };
}

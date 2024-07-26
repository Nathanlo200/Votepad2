import 'dart:convert';

import 'package:odc_mobile_project/m_evaluation/business/model/phases.dart';

import 'EvenementVote.dart';


PhasesVote phasesVoteFromJson(String str) => PhasesVote.fromJson(json.decode(str));

String phasesVoteToJson(PhasesVote data) => json.encode(data.toJson());

class PhasesVote {
    Phases? phases;
    EvenementVote? evenement;
    int intervenants;

    PhasesVote({
        this.phases,
        this.evenement,
        this.intervenants=0,
    });

    factory PhasesVote.fromJson(Map<String, dynamic> json) => PhasesVote(
        phases: json["phases"] == null ? null : Phases.fromJson(json["phases"]),
        evenement: json["evenement"] == null ? null : EvenementVote.fromJson(json["evenement"]),
        intervenants: json["intervenants"]??0,
    );

    Map<String, dynamic> toJson() => {
        "phases": phases?.toJson(),
        "evenement": evenement?.toJson(),
        "intervenants": intervenants,
    };
}
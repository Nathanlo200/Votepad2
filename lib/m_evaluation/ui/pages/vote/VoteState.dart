import 'package:odc_mobile_project/m_evaluation/business/model/Vote/createVoteRequest.dart';

import '../../../business/model/Vote/intervenants.dart';
import '../../../business/model/Vote/phaseCriteres.dart';
class VoteState {
  bool isLoading;
  List<PhaseCriteres> criteres;
  Map<String, double> valeurs = {};
  Intervenants? phaseVoteIntervenants;
  CreateVoteRequest? vote;
  bool isVoteSend = false;
  Map<String, Map<String, double>> VoteResultatStore = {};


  VoteState(
      {this.isLoading = false,
      this.criteres = const [],
        Map<String, double>? valeurs,
      this.phaseVoteIntervenants,
      this.vote,
      this.isVoteSend = false,
      this.VoteResultatStore = const {}}){

    this.valeurs = valeurs ?? {};
  }
  VoteState copywith({
    bool? isLoading,
    List<PhaseCriteres>? criteres,
    Map<String, double>? valeurs,
    Intervenants? phaseVoteIntervenants,
    CreateVoteRequest? vote,
    bool? isVoteSend,
    Map<String, Map<String, double>>? VoteResultatStore,

  }) =>
      VoteState(
          isLoading: isLoading ?? this.isLoading,
          criteres: criteres ?? this.criteres,
          valeurs: valeurs ?? this.valeurs,
          vote: vote ?? this.vote,
          isVoteSend: isVoteSend ?? this.isVoteSend,
          VoteResultatStore: VoteResultatStore ?? this.VoteResultatStore,
          phaseVoteIntervenants: phaseVoteIntervenants ?? this.phaseVoteIntervenants);
}
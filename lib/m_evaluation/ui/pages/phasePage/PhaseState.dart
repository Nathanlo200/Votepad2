import 'package:odc_mobile_project/m_evaluation/business/model/Evenement.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Phases.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/juryIdentifiant.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/intervenants.dart';

import '../../../business/model/Vote/PhasesVote.dart';


class PhaseState {
  Evenement? evenement;
  List<Phases> phasesVote;
  List<PhasesVote> phases;
  List<Intervenants> intervenants;
  JuryIdentifiant? phasename;
  bool statut;

  bool isLoading;

  PhaseState({
    this.evenement,
    this.isLoading=false,
    this.phasesVote = const [],
    this.phases = const [],
    this.intervenants = const [],
    this.phasename,
    this.statut = true,
  });

  PhaseState copyWith({
    Evenement? evenement,
    bool? isLoading,

    List<Phases>? PhasesVote,
     List<PhasesVote>? phases,
    List<Intervenants>?intervenants,
    JuryIdentifiant? phasename,
    bool? statut,

  }) =>
      PhaseState(
        evenement: evenement ?? this.evenement,
        isLoading: isLoading ?? this.isLoading,
        phasesVote: PhasesVote ?? this.phasesVote,
      phases: phases ?? this.phases,
      intervenants: intervenants ?? this.intervenants,
      phasename: phasename ?? this.phasename,
      statut: statut ?? this.statut,
      );
}
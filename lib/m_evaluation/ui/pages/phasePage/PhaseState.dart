


import 'package:odc_mobile_project/m_evaluation/business/model/Phases.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/intervenants.dart';

import '../../../business/model/Vote/PhasesVote.dart';


class PhaseState {
  List<PhasesVote> phasesVote;
  List<Phases> phases;
  List<Intervenants> intervenants;
  bool isLoading;

  PhaseState({
    this.isLoading=false,
    this.phasesVote = const [],
    this.phases = const [],
    this.intervenants = const [],
  });

  PhaseState copyWith({
    bool? isLoading,
    List<PhasesVote>? PhasesVote,
    List<Phases>?phases,
    List<Intervenants>?intervenants
  }) =>
    PhaseState(
        isLoading: isLoading ?? this.isLoading,
      phasesVote: PhasesVote ?? this.phasesVote,
      phases: phases ?? this.phases,
      intervenants: intervenants ?? this.intervenants
      );
}
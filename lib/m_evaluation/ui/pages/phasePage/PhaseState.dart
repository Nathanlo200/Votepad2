


import 'package:odc_mobile_project/m_evaluation/business/model/Vote/PhasesVote.dart';

import '../../../business/model/Vote/PhasesVote.dart';
import '../../../business/model/Vote/phases.dart';

class PhaseState {
  List<PhasesVote> phasesVote;
  bool isLoading;

  PhaseState({
    this.isLoading=false,
    this.phasesVote = const [],
  });

  PhaseState copyWith({
    bool? isLoading,
    List<PhasesVote>? PhasesVote,
    required List<PhasesVote> phases,
  }) =>
    PhaseState(
        isLoading: isLoading ?? this.isLoading,
      phasesVote: PhasesVote ?? this.phasesVote,
      );
}
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/PhasesVote.dart';

import '../../../business/model/Vote/intervenants.dart';

class IntervenantState {
  List<Intervenants> intervenants;
  List<Intervenants> intervenantsOrigin;
  bool isLoading;
  PhasesVote? phaseVote;


  IntervenantState({
    this.isLoading=false,
    this.intervenants = const [],
    this.intervenantsOrigin = const [],
    this.phaseVote
  });

  IntervenantState copyWith({
    bool? isLoading,
    List<Intervenants>? intervenants,
    List<Intervenants>? intervenantsOrigin,
    PhasesVote? phaseVote
  }) =>
      IntervenantState(
        isLoading: isLoading ?? this.isLoading,
        intervenants: intervenants ?? this.intervenants,
        intervenantsOrigin: intervenantsOrigin ?? this.intervenantsOrigin,
        phaseVote: phaseVote ?? this.phaseVote,
      );
}
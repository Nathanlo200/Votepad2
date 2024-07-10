import 'package:odc_mobile_project/m_evaluation/business/model/Vote/PhasesVote.dart';

class PhaseState {
  List<PhasesVote> phases;
  bool isLoading;

  PhaseState({
    this.isLoading=false,
    this.phases = const [],
  });

  PhaseState copyWith({
    bool? isLoading,
    List<PhasesVote>? phases,
  }) =>
      PhaseState(
        isLoading: isLoading ?? this.isLoading,
        phases: phases ?? this.phases,
      );
}
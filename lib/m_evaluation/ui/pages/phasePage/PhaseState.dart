


import '../../../business/model/Vote/PhasesVote.dart';

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
  }) =>
    PhaseState(
        isLoading: isLoading ?? this.isLoading,
      phasesVote: PhasesVote ?? this.phasesVote,
      );
}
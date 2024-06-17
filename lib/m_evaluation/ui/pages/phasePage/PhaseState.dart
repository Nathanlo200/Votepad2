import '../../../business/model/phases.dart';

class PhaseState {
  List<Phases> phases;
  bool isLoading;

  PhaseState({
    this.isLoading=false,
    this.phases = const [],
  });

  PhaseState copyWith({
    bool? isLoading,
    List<Phases>? phases,
  }) =>
    PhaseState(
        isLoading: isLoading ?? this.isLoading,
        phases: phases ?? this.phases,
      );
}
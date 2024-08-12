
class IntroEvaluationState {
  String phaseNom;

  IntroEvaluationState({
    this.phaseNom = ""
  });

  IntroEvaluationState copyWith({
    String ? phaseNom
  }) =>
      IntroEvaluationState(
          phaseNom: phaseNom ?? this.phaseNom
      );
}

class IntroEvaluationState {
  String phaseNom;
  String eventNom;
  int? duree;
  List<int> mytime = [];
  IntroEvaluationState({
    this.phaseNom = "",
    this.eventNom = "",
    this.duree = 0,
    this.mytime =const []
  });

  IntroEvaluationState copyWith({
    String ? phaseNom,
    String ? eventNom,
    int ? duree,
    List<int> ? mytime,
  }) =>
      IntroEvaluationState(
          phaseNom: phaseNom ?? this.phaseNom,
          eventNom: eventNom ?? this.eventNom,
          duree: duree ?? this.duree,
          mytime: mytime ?? this.mytime
      );
}
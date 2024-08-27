
import '../../../../business/model/evaluation/questionAssertions.dart';

class IntroEvaluationState {
  String phaseNom;
  String eventNom;
  int? duree;
  List<int> mytime = [];
  bool hasBody;
  List<QuestionsAssertions>? questions;
  IntroEvaluationState({
    this.phaseNom = "",
    this.eventNom = "",
    this.duree = null,
    this.mytime =const [],
    this.hasBody = true,
    this.questions = const []
  });

  IntroEvaluationState copyWith({
    String ? phaseNom,
    bool ? hasBody,
    String ? eventNom,
    int ? duree,
    List<int> ? mytime,
    List<QuestionsAssertions>? questions
  }) =>
      IntroEvaluationState(
          phaseNom: phaseNom ?? this.phaseNom,
          eventNom: eventNom ?? this.eventNom,
          duree: duree ?? this.duree,
          hasBody: hasBody ?? this.hasBody,
          mytime: mytime ?? this.mytime,
          questions: questions ?? this.questions
      );
}
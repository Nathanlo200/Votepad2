import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/assertions.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/questionAssertions.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/questions.dart';

class EvaluationState {

  bool isLoading;
  bool nextButtonVisible;
  bool submitVisible;
  bool pageVisible;
  bool backButtonVsible;
  List<QuestionsAssertions> reponses = [];
  List<QuestionsAssertions> questions = [];
  List<Assertions> assertions = [];
  List myAssertions = [];

  int currentQuestionIndex = 0;
  int currentIndex = 1;

  int? selectedAnswerIndex = -1;

  Question? maQuestion;
   Map <int,int>? reponsesChoices;
  List<Map<String, int>>? postReponses;

  EvaluationState({
    this.nextButtonVisible = true,
    this.pageVisible = true,
    this.submitVisible = false,
    this.backButtonVsible = false,
    this.maQuestion,
    this.isLoading = false,
    this.reponses = const [],
    this.questions = const [],
    this.assertions = const [],
    this.currentQuestionIndex = 0,
    this.currentIndex = 1,
    this.selectedAnswerIndex = -1,
    this.reponsesChoices,
   this.postReponses
  });

  EvaluationState copyWith({
    bool? isLoading,
    bool? nextButtonVisible,
    bool? submitVisible,
    bool? pageVisible,
    bool? backButtonVsible,
    Question? maQuestion,
    int ? currentQuestionIndex,
    int ? currentIndex,
    int ? selectedAnswerIndex,
    List<QuestionsAssertions>? reponses,
    List<Assertions>? assertions,
    List<QuestionsAssertions>? questions,
    Map <int,int>? reponsesChoices,
    List<Map<String, int>>? postReponses

  }) =>
      EvaluationState(
          isLoading: isLoading ?? this.isLoading,
          nextButtonVisible: nextButtonVisible ?? this.nextButtonVisible,
          pageVisible: pageVisible ?? this.pageVisible,
          submitVisible: submitVisible ?? this.submitVisible,
          backButtonVsible: backButtonVsible ?? this.backButtonVsible,
          maQuestion: maQuestion ?? this.maQuestion,
          reponses: reponses ?? this.reponses,
          questions: questions ?? this.questions,
          assertions: assertions ?? this.assertions,
          selectedAnswerIndex: selectedAnswerIndex ?? this.selectedAnswerIndex,
          currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
          currentIndex: currentIndex ?? this.currentIndex,
          reponsesChoices: reponsesChoices ?? this.reponsesChoices,
          postReponses: postReponses ?? this.postReponses
      );
}
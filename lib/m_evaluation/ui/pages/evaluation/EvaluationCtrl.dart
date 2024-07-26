import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/assertions.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/postReponses.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/questions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../business/interactor/EvaluationInteractor.dart';
import 'EvaluationState.dart';

part "EvaluationCtrl.g.dart";

@riverpod
class EvaluationCtrl extends _$EvaluationCtrl {
  @override
  EvaluationState build() {
    return EvaluationState();
  }

  void saveReponses() async {
    var useCase=ref.watch(evaluationInteractorProvider).saveReponseUseCase;
    await useCase.run(state.reponsesChoices);
  }

  void getReponses() async {
    var usecase = ref.watch(evaluationInteractorProvider).getReponseListUseCase;
    var data = await usecase.run();
    state = state.copyWith(
      reponsesChoices: data,
    );
  }


  void getQuestions(int phaseId) async {
    // var useCase =
    //     ref.watch(evaluationInteractorProvider).getQuestionListByPhaseUseCase;
    // var res = await useCase.run();
    // if (res.length > 0) {
    //   state = await state.copyWith(
    //       question: res[state.currentQuestionIndex].question,
    //       assertions: res[state.currentQuestionIndex].assertions,
    //       currentQuestionIndex: 0);
    // }
    // state = await state.copyWith(questions: res);


    var usecase = ref.watch(evaluationInteractorProvider).getQuestionListByPhaseUseCase;
    var res = await usecase.run(phaseId);
    if (res.length > 0) {
      state = await state.copyWith(
          maQuestion: res[state.currentQuestionIndex].question,
          assertions: res[state.currentQuestionIndex].assertions,
          currentQuestionIndex: 0);
    }
    state = await state.copyWith(questions: res);

  } //end getQuestions



  void resetQuestionIndex() {
    state = state.copyWith(currentQuestionIndex: 0);
  }

  void selectAnswer(int choix) {
    var choices = state.reponsesChoices ?? {};
    choices[state.maQuestion!.id] = choix;
    state = state.copyWith(
      reponsesChoices: choices,
    );
    print("mes choix ${state.reponsesChoices}");
    saveReponses();
  }


  void postAnswers() async{
    var myList = state.reponsesChoices!.entries.map( (entry) => {"question_id":entry.key,"assertion_id": entry.value}).toList();
    var usecase = ref.watch(evaluationInteractorProvider).postReponseUseCase;
    await usecase.run(myList.map((e)=>PostReponses.fromJson(e)).toList());
  }

  void nextPreviousQuestion(int step) {
    int myindex = step + state.currentIndex;
    var newIndex = state.currentQuestionIndex + step;
    if (newIndex >= 0 && newIndex <= state.questions.length) {
      print("index $newIndex");
      Question? currentQueestion = state.maQuestion;
      List<Assertions> currentAssertions = state.assertions;

      if (newIndex < state.questions.length) {
        currentQueestion = state.questions[newIndex].question;
        currentAssertions = state.questions[newIndex].assertions;
      }
      state = state.copyWith(
        currentQuestionIndex: newIndex,
        maQuestion: currentQueestion,
        assertions: currentAssertions,
      );
    }


    state = state.copyWith(currentIndex: myindex);


    if(state.currentIndex > 1 && state.currentIndex <= state.questions.length){
      state = state.copyWith(
          backButtonVsible: true
      );
    }


    if(state.currentIndex <= 1){
      state = state.copyWith(
          backButtonVsible: false,
        nextButtonVisible: true
      );
    }


    if(state.currentIndex >= state.questions.length){
      state = state.copyWith(
          nextButtonVisible: false,
        submitVisible: true,
      );
    }


    if(state.currentIndex < state.questions.length){
      state = state.copyWith(
        nextButtonVisible: true,
        submitVisible: false
      );
    }
}
}

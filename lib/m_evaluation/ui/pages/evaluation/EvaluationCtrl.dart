import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/assertions.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/questions.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/reponse.dart';
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


  void getQuestions() async {
    var getIntervenant = ref.watch(evaluationInteractorProvider).getIntervenantLocalUseCase;
    var intervenant = await getIntervenant.run();
    var usecase = ref.watch(evaluationInteractorProvider).getQuestionListByPhaseUseCase;
    var res = await usecase.run(intervenant.phaseId);
    if (res.length > 0) {
      state = await state.copyWith(
          maQuestion: res[state.currentQuestionIndex].question,
          assertions: res[state.currentQuestionIndex].assertions,
          currentQuestionIndex: 0);
    }
    state = await state.copyWith(questions: res);

    if(state.currentIndex == state.questions.length){
      state = state.copyWith(
        nextButtonVisible: false,
        submitVisible: true,
      );
    }
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


  void resetIntervenantAndResponses() async{
    var resetRep = ref.watch(evaluationInteractorProvider).resetReponseLocalUseCase;
    var resetInt = ref.watch(evaluationInteractorProvider).resetIntervenantLocalUseCase;
    await resetRep.run();
    await resetInt.run();
  }


  void postAnswers() async{
    var intervenant = ref.watch(evaluationInteractorProvider).getIntervenantLocalUseCase;
    var usecase = ref.watch(evaluationInteractorProvider).postReponseUseCase;

    var data = await intervenant.run();
    var myList = state.reponsesChoices!.entries
        .map((entry) => {"questtion_id": entry.key, "assertion_id": entry.value})
        .toList();
    var phaseid = data.phaseId;
    var intervenantId = data.intervenantId;
    var rep = Reponse(
        intervenantId: intervenantId,
        questionsPhasesId: phaseid,
        cote: myList);
    var post = await usecase.run(rep);
    state = state.copyWith(
      statusCode: post
    );
    print("statuscode dans le controller : ${state.statusCode}");
    print("post : ${post}");
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

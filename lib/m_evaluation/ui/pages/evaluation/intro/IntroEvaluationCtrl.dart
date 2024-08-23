import 'package:odc_mobile_project/m_evaluation/business/interactor/EvaluationInteractor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'IntroEvaluationState.dart';

part 'IntroEvaluationCtrl.g.dart';

@riverpod
class IntroEvaluationCtrl extends _$IntroEvaluationCtrl {
  @override
  IntroEvaluationState build() {
    return IntroEvaluationState();
  }

  void getPhaseAndEventName() async {
    var useCase = ref
        .watch(evaluationInteractorProvider)
        .getIntervenantLocalUseCase;
    var phaseName = await useCase.run();
    state = state.copyWith(
        phaseNom: phaseName!.phaseNom,
        eventNom: phaseName.eventNom
    );
  }

  void getDuration() async {
    var getIntervenant = ref
        .watch(evaluationInteractorProvider)
        .getIntervenantLocalUseCase;
    var intervenant = await getIntervenant.run();
    var usecase = ref
        .watch(evaluationInteractorProvider)
        .getQuestionListByPhase2NetworkUseCase;
    var res = await usecase.run(intervenant!.phaseId, intervenant.intervenant);
    var duree = res?.duree ?? 0;
    var questAssert = res?.questionaire;

    print("duuuuuuuuuuuuuuuuuuuuuurer $duree");

    state = await state.copyWith(questions: questAssert);

    if (questAssert?.length != null) {
      state = await state.copyWith(
        duree: duree,
      );
    }

  }

  void resetIntervenant(){
    var resetInt = ref.watch(evaluationInteractorProvider).resetIntervenantLocalUseCase;
    resetInt.run();
  }
}
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

  void getPhasename() async{
    var useCase = ref.watch(evaluationInteractorProvider).getIntervenantLocalUseCase;
    var phaseName = await useCase.run();
    state = state.copyWith(
      phaseNom: phaseName!.phaseNom
    );
  }

}

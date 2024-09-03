import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../business/model/Phases.dart';
import 'PhaseState.dart';
import '../../../business/interactor/EvaluationInteractor.dart';
part 'PhaseCtrl.g.dart';

@riverpod
class PhaseCtrl extends _$PhaseCtrl{

  @override
  PhaseState build() {
    return PhaseState();
  }

  disconnect() async {
    var useCase = ref.watch(evaluationInteractorProvider).resetJuryLocalUseCase;
    await useCase.run();
  }

  void recupererListPhase() async {
    var usecase = ref.watch(evaluationInteractorProvider).getPhasesListNetworkUseCase;

    state = state.copyWith(isLoading: true, );
    var res = await usecase.run();
    print("phases $res");

    state = state.copyWith(isLoading: false, phases: res);
  }

  void recupererPhase()async {
    var usecase = ref.watch(evaluationInteractorProvider).getJuryLocalUseCase;

    state = state.copyWith(isLoading: true, );
    var res = await usecase.run();
    print("phases $res");
    state = state.copyWith(isLoading: false, phasename: res);

  }
}
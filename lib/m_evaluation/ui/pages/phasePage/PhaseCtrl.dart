import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../business/model/Vote/PhasesVote.dart';
import 'PhaseState.dart';
import '../../../business/interactor/EvaluationInteractor.dart';
part 'PhaseCtrl.g.dart';

@riverpod
class PhaseCtrl extends _$PhaseCtrl{

  @override
  PhaseState build() {
    return PhaseState();
  }

  void recupererListPhase() async {
    var usecase = ref.watch(evaluationInteractorProvider).getPhasesListNetworkUseCase;
    state = state.copyWith(isLoading: true, phases: []);
    var res = await usecase.run();
    if (res!= null) {
      state = state.copyWith(phases: res,isLoading: false);
    }
    state = state.copyWith(isLoading: false, phases: []);
  }
  }
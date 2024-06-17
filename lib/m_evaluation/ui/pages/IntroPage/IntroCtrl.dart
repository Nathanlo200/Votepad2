
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../m_user/business/interactor/UserInteractor.dart';
import '../../../../m_user/business/model/Authenticate.dart';
import '../../../business/interactor/EvaluationInteractor.dart';
import 'IntroState.dart';

part "IntroCtrl.g.dart";

@riverpod
class IntroCtrl extends _$IntroCtrl {
  @override
  IntroState build() {
    return IntroState();
  }

  Future<bool> soumettre(String coupon) async {
    var usecase = ref.watch(evaluationInteractorProvider).getJuryNetworkUseCase;
    state = state.copyWith(isLoading: true);
    var res = await usecase.run(coupon);
    state = state.copyWith(isLoading: false);
    return res !=null;
  }
}
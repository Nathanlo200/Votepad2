import 'package:odc_mobile_project/m_evaluation/business/interactor/EvaluationInteractor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'AuthState.dart';
part "AuthCtrl.g.dart";
@riverpod
class AuthCtrl extends _$AuthCtrl {
  @override
  AuthState build() {
    return AuthState();
  }

  Future<String?> soumettre( String email, String coupon) async {
    var usecase = ref.watch(evaluationInteractorProvider).getIntervenantNetworkUseCase;
    state = state.copyWith(isLoading: true);
    try {
      await usecase.run(email, coupon);
      state = state.copyWith(isLoading: false);
      return  null;
    } catch (e) {
      return e.toString();
    }
  }
}

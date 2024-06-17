import 'package:odc_mobile_project/m_evaluation/business/interactor/EvaluationInteractor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../m_user/business/interactor/UserInteractor.dart';
import '../../../../m_user/business/model/Authenticate.dart';
import 'AuthState.dart';
part "AuthCtrl.g.dart";
@riverpod
class AuthCtrl extends _$AuthCtrl {
  @override
  AuthState build() {
    return AuthState();
  }

  Future<bool> soumettre( String email, String coupon) async {
    var usecase = ref.watch(evaluationInteractorProvider).getIntervenantNetworkUseCase;
    state = state.copyWith(isLoading: true);
    var res = await usecase.run(email, coupon);
    state = state.copyWith(isLoading: false);
    return res !=null;
  }
}

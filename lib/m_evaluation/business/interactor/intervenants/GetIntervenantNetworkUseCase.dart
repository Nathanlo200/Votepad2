import 'package:odc_mobile_project/m_evaluation/business/model/Vote/intervenants.dart';
import '../../services/evaluationNetworkService.dart';

class GetIntervenantNetworkUseCase {
  EvaluationNetworkService network;

  GetIntervenantNetworkUseCase(this.network);

  Future<Intervenants?> run(String email, String coupon) async {
    var res = await network.getIntervenant(email, coupon);
    return res;
  }
}

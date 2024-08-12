
import 'package:odc_mobile_project/m_evaluation/business/model/intervenants.dart';

import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetIntervenantNetworkUseCase {
  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetIntervenantNetworkUseCase(this.network, this.local);

  Future<Intervenants?> run(String email, String coupon) async {
    var res = await network.getIntervenant(email, coupon);
    local.saveIntervenant(res!);
    return res;
  }
}

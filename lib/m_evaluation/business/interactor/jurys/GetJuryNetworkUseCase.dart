import 'package:odc_mobile_project/m_evaluation/business/model/Vote/juryIdentifiant.dart';

import '../../model/Vote/jurys.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetJuryNetworkUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetJuryNetworkUseCase(this.network, this.local);

  Future<JuryIdentifiant?> run( String coupon, String imei) async {
    var res = await network.getJury(coupon, imei);
    if(res != null){
      local.saveJury(res);
    }
    return res;
  }
}
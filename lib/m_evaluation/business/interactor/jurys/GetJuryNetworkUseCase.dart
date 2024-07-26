import 'package:odc_mobile_project/m_evaluation/business/model/Vote/juryIdentifiant.dart';

import '../../services/evaluationNetworkService.dart';

class GetJuryNetworkUseCase{

  EvaluationNetworkService network;

  GetJuryNetworkUseCase(this.network);

  Future<JuryIdentifiant?> run( String coupon, String imei) async {
    var res = await network.getJury(coupon, imei);
    return res;
  }
}
import 'package:odc_mobile_project/m_evaluation/business/services/evaluationLocalService.dart';

import '../../model/Vote/PhasesVote.dart';
import '../../services/evaluationNetworkService.dart';

class GetPhaseListByIdNetworkUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetPhaseListByIdNetworkUseCase(this.network,this.local);
  Future<PhasesVote> run(int id) async{
    var jury = await local.getJury();
    var res = await network.getPhaseListById(id,jury?.token??"");
    return res;
  }
}
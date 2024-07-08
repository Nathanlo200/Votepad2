import 'package:odc_mobile_project/m_evaluation/business/model/Vote/PhasesVote.dart';

import '../../model/phases.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetPhasesListNetworkUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetPhasesListNetworkUseCase(this.network, this.local);
  Future<List<PhasesVote>?> run() async{
    var res = await network.getPhasesList();
    if(res != null){
      // local.savePhasesList(res);
    }
    return res;
  }
}
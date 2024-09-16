import 'package:odc_mobile_project/m_evaluation/business/services/evaluationLocalService.dart';

import '../../model/Vote/phaseCriteres.dart';
import '../../services/evaluationNetworkService.dart';

class GetCritereListByPhaseNetworkUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

GetCritereListByPhaseNetworkUseCase(this.network, this.local);

  Future<List<PhaseCriteres>?> run(int phaseId) async {
    var jury = await local.getJury();
    var res = await network.getCritereListByPhase(phaseId,jury?.token??"");

    return res;
  }
}
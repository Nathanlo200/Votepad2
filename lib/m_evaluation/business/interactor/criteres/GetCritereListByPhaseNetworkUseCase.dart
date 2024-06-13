import '../../model/Vote/phaseCriteres.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetCritereListByPhaseNetworkUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

GetCritereListByPhaseNetworkUseCase(this.network, this.local);

  Future<List<PhaseCriteres>?> run(int phaseId) async {
    var res = await network.getCritereListByPhase(phaseId);
    if(res != null){
      local.getCritereListByPhase();
    }
    return res;
  }
}
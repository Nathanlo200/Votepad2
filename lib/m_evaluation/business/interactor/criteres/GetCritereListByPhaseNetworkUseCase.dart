import '../../model/Vote/phaseCriteres.dart';
import '../../services/evaluationNetworkService.dart';

class GetCritereListByPhaseNetworkUseCase{

  EvaluationNetworkService network;

GetCritereListByPhaseNetworkUseCase(this.network);

  Future<List<PhaseCriteres>?> run(int phaseId) async {
    var res = await network.getCritereListByPhase(phaseId);

    return res;
  }
}
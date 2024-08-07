
import '../../model/phaseIntervenant.dart';
import '../../services/evaluationNetworkService.dart';

class GetGroupByIdNetworkUseCase{

  EvaluationNetworkService network;

  GetGroupByIdNetworkUseCase(this.network);

  Future<PhaseIntervenant> run(int id) async {
    var res = await network.getGroupById(id);
    return res;
  }
}


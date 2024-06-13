import '../../model/Vote/phaseIntervenant.dart';
import '../../services/evaluationNetworkService.dart';

class GetIntervenantByIdNetworkUseCase{

  EvaluationNetworkService network;

  GetIntervenantByIdNetworkUseCase(this.network);

  Future<PhaseIntervenant> run(int id) async {
    var res = await network.getIntervenantById(id);
    return res;
  }
}
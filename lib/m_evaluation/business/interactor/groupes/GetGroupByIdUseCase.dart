import '../../model/Vote/phaseIntervenant.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetGroupByIdUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetGroupByIdUseCase(this.network, this.local);

  Future<PhaseIntervenant> run(int id) async {
    var res = await network.getGroupById(id);
    return res;
  }
}
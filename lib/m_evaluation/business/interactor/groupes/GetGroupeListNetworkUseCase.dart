import '../../model/Vote/groupes.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetGroupeLisNetworktUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetGroupeLisNetworktUseCase(this.network, this.local);

  Future<List<Groupes>?> run(int phaseId) async {
    var res = await network.getGroupeList(phaseId);
    if(res != null){
      local.saveGroupeList(res);
    }
    return res;
  }
}
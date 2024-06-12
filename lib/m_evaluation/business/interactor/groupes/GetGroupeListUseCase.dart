import '../../model/Vote/groupes.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetGroupeListUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetGroupeListUseCase(this.network, this.local);

  Future<List<Groupes>> run(int phaseId) async {
    var res = await network.getGroupeList(phaseId);
    return res;
  }
}
import '../../model/intervenants.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetIntervenantListNetworkUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetIntervenantListNetworkUseCase(this.network, this.local);

  Future<List<Intervenants>?> run(int phaseId) async {
    var jury = await local.getJury();
    var res = await network.getIntervenantList(phaseId, jury?.token ?? "");
    return res;
  }
}
import '../../model/Vote/votes.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetVoteByIntervenantNetworkUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetVoteByIntervenantNetworkUseCase(this.network, this.local);

  Future<Votes?> run(int intervenantId) async {
    var res = await network.getVoteByIntervenant(intervenantId);
    return res;
  }
}
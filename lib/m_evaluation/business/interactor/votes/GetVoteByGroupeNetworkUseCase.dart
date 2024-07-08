import '../../model/Vote/votes.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetVoteByGroupeNetworkUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetVoteByGroupeNetworkUseCase(this.network, this.local);

  Future<Votes?> run(int groupeId) async {
    var res = await network.getVoteByGroupe(groupeId);
    return res;
  }
}
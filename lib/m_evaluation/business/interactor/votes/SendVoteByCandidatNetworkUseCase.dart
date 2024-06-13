import '../../model/Vote/createVoteRequest.dart';
import '../../services/evaluationNetworkService.dart';

class SendVoteByCandidatNetworkUseCase{

  EvaluationNetworkService network;


  SendVoteByCandidatNetworkUseCase(this.network);

  Future<dynamic> run(CreateVoteRequest data) async {
    var res = await network.sendVoteByCandidat(data);
    return res;
  }
}

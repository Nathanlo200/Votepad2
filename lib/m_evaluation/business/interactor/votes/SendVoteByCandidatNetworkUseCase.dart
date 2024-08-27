import '../../model/Vote/createVoteRequest.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class SendVoteByCandidatNetworkUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;


  SendVoteByCandidatNetworkUseCase(this.network,this.local);

  Future<dynamic> run(CreateVoteRequest data) async {
    var jury = await local.getJury();
    var res = await network.sendVoteByCandidat(data, jury?.token??"",jury?.nombre_user??0);
    return res;
  }
}

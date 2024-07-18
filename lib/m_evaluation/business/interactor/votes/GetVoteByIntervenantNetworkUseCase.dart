import 'package:odc_mobile_project/m_evaluation/business/model/Vote/createVoteRequest.dart';

import '../../model/Vote/ResultatVotes.dart';
import '../../services/evaluationNetworkService.dart';

class GetVoteByIntervenantNetworkUseCase{

  EvaluationNetworkService network;

  GetVoteByIntervenantNetworkUseCase(this.network);

  Future<CreateVoteRequest?> run(int intervenantId) async {
    var res = await network.getVoteByIntervenant(intervenantId);
    return res;
  }
}
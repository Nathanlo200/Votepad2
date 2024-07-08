import '../../model/Vote/PhasesVote.dart';
import '../../services/evaluationNetworkService.dart';

class GetPhaseListByIdNetworkUseCase{

  EvaluationNetworkService network;

  GetPhaseListByIdNetworkUseCase(this.network);
  Future<PhasesVote> run(int id) async{
    var res = await network.getPhaseListById(id);
    return res;
  }
}
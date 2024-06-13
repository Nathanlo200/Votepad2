import '../../model/phases.dart';
import '../../services/evaluationNetworkService.dart';

class GetPhaseListByIdNetworkUseCase{

  EvaluationNetworkService network;

  GetPhaseListByIdNetworkUseCase(this.network);
  Future<Phases> run(int id) async{
    var res = await network.getPhaseListById(id);
    return res;
  }
}
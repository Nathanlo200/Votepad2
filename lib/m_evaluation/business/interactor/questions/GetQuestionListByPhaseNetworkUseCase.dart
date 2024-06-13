import '../../model/evaluation/questions.dart';
import '../../services/evaluationNetworkService.dart';

class GetQuestionListByPhaseNetworkUseCase{

  EvaluationNetworkService network;

  GetQuestionListByPhaseNetworkUseCase(this.network);
  Future<List<Question>> run(int phaseId) async{
    var res = await network.getQuestionListByPhase(phaseId);
    return res;
  }


}
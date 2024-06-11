import '../../model/evaluation/questions.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';


class GetQuestionListByPhaseUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetQuestionListByPhaseUseCase(this.network, this.local);
  Future<List<Question>> run(int phaseId) async{
    var res = await network.getQuestionListByPhase(phaseId);
    return res;
  }


}
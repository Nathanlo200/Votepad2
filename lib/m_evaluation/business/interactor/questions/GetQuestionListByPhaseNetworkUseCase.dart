import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/questionAssertions.dart';

import '../../model/evaluation/questions.dart';
import '../../services/evaluationNetworkService.dart';

class GetQuestionListByPhaseNetworkUseCase{

  EvaluationNetworkService network;

  GetQuestionListByPhaseNetworkUseCase(this.network);
  Future<List<QuestionsAssertions>> run(int phaseId) async{
    var res = await network.getQuestionListByPhase(phaseId);
    return res;
  }


}
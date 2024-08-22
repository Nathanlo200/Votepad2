import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/DureeQuestionAssertion.dart';

import '../../services/evaluationNetworkService.dart';

class GetQuestionListByPhase2NetworkUseCase{

  EvaluationNetworkService network;

  GetQuestionListByPhase2NetworkUseCase(this.network);
  Future<DureeQuestionAssertion?> run(int phaseId, int intervenantId) async{
    var res = await network.getQuestionListByPhase2(phaseId,intervenantId);
    return res;
  }


}
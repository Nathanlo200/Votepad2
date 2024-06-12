import 'package:odc_mobile_project/m_evaluation/business/model/Evenement.dart';

import '../../model/evaluation/assertions.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';


class GetEvenementByIdUseCase{
  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetEvenementByIdUseCase(this.network, this.local);

  Future<Evenement> run(int questionId) async {
    var res = await network.getEvenementById(questionId);
    return res;
  }
}
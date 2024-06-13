import 'package:odc_mobile_project/m_evaluation/business/model/Evenement.dart';
import '../../services/evaluationNetworkService.dart';

class GetEvenementByIdNetworkUseCase{
  EvaluationNetworkService network;

  GetEvenementByIdNetworkUseCase(this.network);

  Future<Evenement> run(int questionId) async {
    var res = await network.getEvenementById(questionId);
    return res;
  }
}
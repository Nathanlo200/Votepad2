import 'package:odc_mobile_project/m_evaluation/business/model/Evenement.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class SaveEvenementByIdUseCase {
  EvaluationNetworkService network;
  EvaluationLocalService local;

  SaveEvenementByIdUseCase(this.network, this.local);

  Future<Evenement> run(Evenement data) async {
    var res = await local.saveEvenementById(data);
    return res;
  }
}

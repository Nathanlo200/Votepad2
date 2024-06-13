import 'package:odc_mobile_project/m_evaluation/business/model/Evenement.dart';
import '../../services/evaluationLocalService.dart';

class SaveEvenementByIdLocalUseCase {
  EvaluationLocalService local;

  SaveEvenementByIdLocalUseCase(this.local);

  Future<Evenement> run(Evenement data) async {
    var res = await local.saveEvenementById(data);
    return res;
  }
}

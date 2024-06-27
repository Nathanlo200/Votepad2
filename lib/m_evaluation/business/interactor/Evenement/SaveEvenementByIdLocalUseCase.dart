import 'package:odc_mobile_project/m_evaluation/business/model/Vote/EvenementVote.dart';
import '../../services/evaluationLocalService.dart';

class SaveEvenementByIdLocalUseCase {
  EvaluationLocalService local;

  SaveEvenementByIdLocalUseCase(this.local);

  Future<EvenementVote> run(EvenementVote data) async {
    var res = await local.saveEvenementById(data);
    return res;
  }
}

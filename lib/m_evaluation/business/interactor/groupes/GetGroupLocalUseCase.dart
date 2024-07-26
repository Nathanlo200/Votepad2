import 'package:odc_mobile_project/m_evaluation/business/model/phaseIntervenant.dart';
import '../../services/evaluationLocalService.dart';

class GetGroupLocalUseCase{

  EvaluationLocalService local;

  GetGroupLocalUseCase(this.local);

  Future<PhaseIntervenant> run(int id) async {
    var res = await local.getGroup(id);
    return res;
  }
}
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/juryIdentifiant.dart';

import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetJuryLocalUseCase{

  EvaluationLocalService local;

  GetJuryLocalUseCase(this.local);

  Future<JuryIdentifiant?> run() async {
    var res = await local.getJury();
    return res;
  }
}
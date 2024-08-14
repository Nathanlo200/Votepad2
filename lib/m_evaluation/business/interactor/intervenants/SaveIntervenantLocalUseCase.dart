import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/intervenantEvaluation.dart';

import '../../model/intervenants.dart';
import '../../services/evaluationLocalService.dart';


class SaveIntervenantLocalUseCase{
  EvaluationLocalService local;

  SaveIntervenantLocalUseCase( this.local);

  Future<bool> run(IntervenantEvaluation data) async{
    var res = await local.saveIntervenant(data);
    return res;
  }
}
import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/intervenantEvaluation.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/intervenants.dart';
import '../../services/evaluationLocalService.dart';

class GetIntervenantLocalUseCase{
  EvaluationLocalService local;

  GetIntervenantLocalUseCase( this.local);
  Future<IntervenantEvaluation> run() async{
   var res = await local.getIntervenant();
   return res;
  }

}
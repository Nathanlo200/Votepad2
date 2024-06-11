import 'package:odc_mobile_project/m_evaluation/business/model/Vote/intervenants.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetIntervenantLocalUseCase{
  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetIntervenantLocalUseCase(this.network, this.local);
  Future<Intervenants> run() async{
   var res = await local.getIntervenant();
   return res;
  }

}
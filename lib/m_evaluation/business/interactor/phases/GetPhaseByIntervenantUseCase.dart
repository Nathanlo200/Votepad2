import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetPhaseByIntervenantUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetPhaseByIntervenantUseCase(this.network, this.local);
  Future<bool> run( int competitionId) async{
    var intervenant=await local.getIntervenant();
    var res = await network.getPhasesByIntervenant(intervenant.id, competitionId);
    return res;

  }


}
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetPhaseByIntervenantNetworkUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetPhaseByIntervenantNetworkUseCase(this.network, this.local);
  Future<bool> run( int competitionId) async{
    var intervenant=await local.getIntervenant();
    var res = await network.getPhasesByIntervenant(intervenant.id, competitionId);
    return res;

  }


}
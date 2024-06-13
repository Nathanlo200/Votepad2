import '../../model/Vote/jurys.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetJuryNetworkUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetJuryNetworkUseCase(this.network, this.local);

  Future<Jury?> run( String coupon) async {
    var res = await network.getJury(coupon);
    if(res != null){
      local.saveJury(res);
    }
    return res;
  }
}
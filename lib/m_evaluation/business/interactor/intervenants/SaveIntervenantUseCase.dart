import '../../model/Vote/intervenants.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';


class SaveIntervenantUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  SaveIntervenantUseCase(this.network, this.local);

  Future<bool> run(Intervenants data) async{
    var res = await local.saveIntervenant(data);
    return res;
  }
}
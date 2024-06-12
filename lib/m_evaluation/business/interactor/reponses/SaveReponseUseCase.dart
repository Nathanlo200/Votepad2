import '../../model/evaluation/reponse.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class SaveReponseUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  SaveReponseUseCase(this.network, this.local);
  Future<Reponse?> run(Reponse data) async{
    var res = await local.saveReponses(data);
    return res;
  }
}
import '../../model/evaluation/reponse.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class GetReponseListUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetReponseListUseCase(this.network, this.local);

  Future<List<Reponse>> run() async{
    var res = await local.getReponsesList();
    return res;
  }
}
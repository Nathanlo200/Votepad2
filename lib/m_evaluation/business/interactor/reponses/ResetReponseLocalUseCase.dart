import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class ResetReponseLocalUseCase{


  EvaluationLocalService local;


  ResetReponseLocalUseCase(this.local);
  Future<bool> run() async{
    var res = await local.resetReponses();
    return res;
  }
}

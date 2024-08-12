import '../../model/evaluation/postReponses.dart';
import '../../model/evaluation/reponse.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class PostReponseNetworkUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;


  PostReponseNetworkUseCase(this.network, this.local);
  Future<int> run(Reponse reponse) async{
    var res = await network.postReponses(reponse);
    return res;
  }
}

import '../../model/evaluation/postReponses.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class PostReponseNetworkUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;


  PostReponseNetworkUseCase(this.network, this.local);
  Future<bool> run(List<PostReponses> data) async{
    await local.getReponsesList();
    var res = await network.postReponses(data);
    if(res){
      local.resetReponses();
    }
    return res;
  }
}

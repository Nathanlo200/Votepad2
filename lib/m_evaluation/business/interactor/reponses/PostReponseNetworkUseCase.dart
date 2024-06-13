import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/reponse.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class PostReponseNetworkUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;


  PostReponseNetworkUseCase(this.network, this.local);
  Future<bool> run(Reponse data) async{
    var res = await network.postReponses(data);
    if(res){
      local.resetReponses();
    }
    return res;
  }
}

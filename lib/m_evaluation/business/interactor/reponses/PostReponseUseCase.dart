import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/reponse.dart';

import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class PostReponseUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;


  PostReponseUseCase(this.network, this.local);
  Future<bool> run(Reponse data) async{
    var res = await network.postReponses(data);
    if(res){
      local.resetReponses();
    }
    return res;
  }
}

import '../../model/evaluation/reponse.dart';
import '../../services/evaluationLocalService.dart';

class SaveReponseLocalUseCase{

  EvaluationLocalService local;

  SaveReponseLocalUseCase(this.local);
  Future<Reponse?> run(Reponse data) async{
    var res = await local.saveReponses(data);
    return res;
  }
}
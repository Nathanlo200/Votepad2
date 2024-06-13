import '../../model/evaluation/reponse.dart';
import '../../services/evaluationLocalService.dart';

class GetReponseListLocalUseCase{

  EvaluationLocalService local;

  GetReponseListLocalUseCase(this.local);

  Future<List<Reponse>> run() async{
    var res = await local.getReponsesList();
    return res;
  }
}
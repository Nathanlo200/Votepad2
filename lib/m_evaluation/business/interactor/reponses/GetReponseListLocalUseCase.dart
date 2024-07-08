
import '../../services/evaluationLocalService.dart';

class GetReponseListLocalUseCase{

  EvaluationLocalService local;

  GetReponseListLocalUseCase(this.local);

  Future<Map<int, int>?> run() async{
    var res = await local.getReponsesList();
    return res;
  }
}
import '../../services/evaluationLocalService.dart';

class SaveReponseLocalUseCase{

  EvaluationLocalService local;

  SaveReponseLocalUseCase(this.local);
  Future<bool> run(Map<int, int>? data) async{
    var res = await local.saveReponses(data);
    return res;
  }
}
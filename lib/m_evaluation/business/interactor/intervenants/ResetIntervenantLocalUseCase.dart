import '../../services/evaluationLocalService.dart';

class ResetIntervenantLocalUseCase{

  EvaluationLocalService local;


  ResetIntervenantLocalUseCase(this.local);
  Future<bool> run() async{
    var res = await local.resetIntervenant();
    return res;
  }
}
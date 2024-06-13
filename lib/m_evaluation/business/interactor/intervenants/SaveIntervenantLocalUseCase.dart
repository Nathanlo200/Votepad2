import '../../model/Vote/intervenants.dart';
import '../../services/evaluationLocalService.dart';


class SaveIntervenantLocalUseCase{

  EvaluationLocalService local;

  SaveIntervenantLocalUseCase(this.local);

  Future<bool> run(Intervenants data) async{
    var res = await local.saveIntervenant(data);
    return res;
  }
}
import '../../model/Vote/intervenants.dart';
import '../../services/evaluationLocalService.dart';

class SaveIntervenantListLocalUseCase{

  EvaluationLocalService local;

  SaveIntervenantListLocalUseCase( this.local);

  Future<bool> run(List<Intervenants> data) async {
    var res = await local.saveIntervenantList(data);
    return res;
  }
}
import '../../model/Vote/groupes.dart';
import '../../services/evaluationLocalService.dart';

class SaveGroupeListLocalUseCase{

  EvaluationLocalService local;

  SaveGroupeListLocalUseCase(this.local);

  Future<bool> run(List<Groupes> data) async {
    var res = await local.saveGroupeList(data);
    return res;
  }
}
import '../../model/Vote/groupes.dart';
import '../../services/evaluationLocalService.dart';


class SaveGroupLocalUseCase{

  EvaluationLocalService local;
  SaveGroupLocalUseCase(this.local);

  Future<bool> run(Groupes data) async {
    var res = await local.saveGroup(data);
    return res;
  }
}
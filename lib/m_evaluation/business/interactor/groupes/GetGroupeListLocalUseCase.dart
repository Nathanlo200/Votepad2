import '../../model/Vote/groupes.dart';
import '../../services/evaluationLocalService.dart';

class GetGroupeListLocalUseCase{

  EvaluationLocalService local;

  GetGroupeListLocalUseCase(this.local);

  Future<List<Groupes>> run(int phaseId) async {
    var res = await local.getGroupeList();
    return res;
  }
}
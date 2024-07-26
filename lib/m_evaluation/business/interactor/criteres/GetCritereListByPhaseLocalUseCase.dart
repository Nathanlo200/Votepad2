import '../../model/Vote/phaseCriteres.dart';
import '../../services/evaluationLocalService.dart';
class GetCritereListByPhaseLocalUseCase {
  EvaluationLocalService local;

  GetCritereListByPhaseLocalUseCase( this.local);

  Future<List<PhaseCriteres>?> run() async {
    var res = await local.getCritereListByPhase();
    return res;
  }
}

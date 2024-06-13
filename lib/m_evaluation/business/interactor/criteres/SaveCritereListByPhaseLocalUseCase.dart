import '../../model/Vote/phaseCriteres.dart';
import '../../services/evaluationLocalService.dart';

class SaveCritereListByPhaseLocalUseCase{

  EvaluationLocalService local;

  SaveCritereListByPhaseLocalUseCase(this.local);

  Future<bool> run(List<PhaseCriteres> data) async {
    var res = await local.saveCritereListByPhase(data);
    return res;
  }
}
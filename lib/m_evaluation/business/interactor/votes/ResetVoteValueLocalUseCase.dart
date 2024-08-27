
import '../../services/evaluationLocalService.dart';

class ResetVoteValueLocalUseCase {
  EvaluationLocalService local;
  ResetVoteValueLocalUseCase(this.local);
  Future<bool> run() async{
    var res = await local.resetVoteValue();
    return res;
  }
}
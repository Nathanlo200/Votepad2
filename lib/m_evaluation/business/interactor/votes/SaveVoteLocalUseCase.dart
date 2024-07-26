import '../../model/Vote/createVoteRequest.dart';
import '../../services/evaluationLocalService.dart';

class SaveVoteLocalUseCase{

  EvaluationLocalService local;

  SaveVoteLocalUseCase(this.local);

  Future<bool> run(int intervenantId,   Map<String, double> data) async {
    var res = await local.saveVote(intervenantId,data);
    return res;
  }
}

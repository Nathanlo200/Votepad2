import '../../model/Vote/createVoteRequest.dart';
import '../../services/evaluationLocalService.dart';

class SaveVoteLocalUseCase{

  EvaluationLocalService local;

  SaveVoteLocalUseCase(this.local);

  Future<bool> run(CreateVoteRequest data) async {
    var res = await local.saveVote(data);
    return res;
  }
}

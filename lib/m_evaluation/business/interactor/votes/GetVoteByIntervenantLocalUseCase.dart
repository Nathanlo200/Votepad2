import '../../services/evaluationLocalService.dart';

class GetVoteByIntervenantLocalUseCase {
  EvaluationLocalService local;

  GetVoteByIntervenantLocalUseCase(this.local);
  Future<Map<String, double>?> run(int intervenantId) async {
    var res = await local.getVoteByIntervenant(intervenantId);
    return res;
  }
}
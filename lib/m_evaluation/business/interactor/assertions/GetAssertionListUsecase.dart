import '../../model/evaluation/assertions.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';


class GetAssertionListUsecase{
  EvaluationNetworkService network;
  EvaluationLocalService local;

  GetAssertionListUsecase(this.network, this.local);

  Future<List<Assertions>> run(int questionId) async {
    var res = await network.getAssertionList(questionId);
    return res;

  }
}
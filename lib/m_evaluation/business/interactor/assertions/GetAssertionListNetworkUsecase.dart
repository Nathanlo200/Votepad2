import '../../model/evaluation/assertions.dart';
import '../../services/evaluationNetworkService.dart';


class GetAssertionListNetworkUsecase{
  EvaluationNetworkService network;

  GetAssertionListNetworkUsecase(this.network);

  Future<List<Assertions>> run(int questionId) async {
    var res = await network.getAssertionList(questionId);
    return res;

  }
}
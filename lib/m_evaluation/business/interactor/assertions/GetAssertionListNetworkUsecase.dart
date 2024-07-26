import '../../model/evaluation/assertions.dart';
import '../../services/evaluationNetworkService.dart';


class GetAssertionListNetworkUsecase{
  EvaluationNetworkService network;

  GetAssertionListNetworkUsecase(this.network);

  Future<List<Assertions>> run(int id) async {
    var res = await network.getAssertionList( id);
    return res;

  }
}
import '../../model/Vote/juryIdentifiant.dart';
import '../../model/Vote/jurys.dart';
import '../../services/evaluationLocalService.dart';
import '../../services/evaluationNetworkService.dart';

class SaveJuryLocalUseCase{

  EvaluationNetworkService network;
  EvaluationLocalService local;

  SaveJuryLocalUseCase(this.network, this.local);

  Future<bool> run(JuryIdentifiant data) async {
    var res = await local.saveJury(data);
    return res;
  }
}
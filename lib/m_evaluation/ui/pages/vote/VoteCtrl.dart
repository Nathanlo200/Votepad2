import 'package:odc_mobile_project/m_evaluation/business/model/Vote/createVoteRequest.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../business/interactor/EvaluationInteractor.dart';
import '../../../business/model/Vote/intervenants.dart';
import 'VoteState.dart';

part "VoteCtrl.g.dart";

@riverpod
class VoteCtrl extends _$VoteCtrl {
  @override
  VoteState build() {
    return VoteState();
  }

  recupererCriteres(int phaseId) async {
    state = state.copywith(isLoading: true);
    var usecase = ref
        .watch(evaluationInteractorProvider)
        .getCritereListByPhaseNetworkUseCase;
    var res = await usecase.run(phaseId);
    if (res != null) {
      state = state.copywith();
      Map<String, double> criteresValues = {};
      for (var critere in res) {
        criteresValues[critere.critere.id.toString()] = 0.0;
      }
      print("criteresValues $criteresValues");
      state = state.copywith(valeurs: criteresValues, criteres: res);
    }
    state = state.copywith(isLoading: false);
  }

  void onSliderChanged(int critereId, double value, int intervenantId) async {
    var valeurs = state.valeurs;
    valeurs["$critereId"] = value;
    print("valeurs $valeurs");
    state = state.copywith(valeurs: valeurs);
    var useCase = ref
        .watch(evaluationInteractorProvider)
        .saveVoteLocalUseCase;
    useCase.run(intervenantId, valeurs);
  }

  void setCandidat(Intervenants intervenant) {
    state = state.copywith(phaseVoteIntervenants: intervenant);
    print("CANDIDAT: ${state.phaseVoteIntervenants?.email}");
  }

  void checkVote(int intervenantId) async {
    var useCase = ref
        .watch(evaluationInteractorProvider)
        .getVoteByIntervenantLocalUseCase;
    var res = await useCase.run(intervenantId);
    if (res != null) {
      state = state.copywith(valeurs: res);
    }
  }

  void sendVoteResulats(int intervenantId) async {
    print("SAVE  VOTE $intervenantId");
    var useCase = ref.watch(evaluationInteractorProvider).sendVoteByCandidatNetworkUseCase;
    var cotes = state.valeurs.entries
        .map((entry) => {"critere_id": int.parse(entry.key) , "valeur":entry.value})
        .toList();
    var store = {
      "intervenant_id": intervenantId,
      "cote": cotes
    };
    print("store $store");
    var data = CreateVoteRequest.fromJson(store) ;
    print("VER ${data.toJson()}");
    return;
    var res = await useCase.run(data);
    print("res $res");
    state = state.copywith(isVoteSend: true);
    print(res);}
}

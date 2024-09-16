import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../business/interactor/EvaluationInteractor.dart';
import 'intervenantState.dart';

part "intervenantCtrl.g.dart";

@riverpod
class IntervenantCtrl extends _$IntervenantCtrl {
  @override
  IntervenantState build() {
    return IntervenantState();
  }

  void recupererListIntervenant(int phaseId) async {
    var usecase = ref
        .watch(evaluationInteractorProvider)
        .getIntervenantListNetworkUseCase;
    state = state.copyWith(isLoading: true, intervenants: []);
    var res = await usecase.run(phaseId);
    print("iNTERVENANTS $res.toString()");
    if (res != null) {
      state = state.copyWith(intervenants: res, intervenantsOrigin: res);
    }
    state = state.copyWith(intervenants: res, isLoading: false);
  }

  void rechercherIntervenant(String recherche) async {
    var listeData = state.intervenantsOrigin;
    print(listeData);
    var results = listeData
        .where((n) => n.email.toLowerCase().contains(recherche.toLowerCase()))
        .toList();
    state = state.copyWith(intervenants: results);
  } //TODO: Mettre le code de la

  void updateIntervenantStatus(int intervenantId, bool isDone) {
    var listeIntervenants = state.intervenants;
    var intervenantRecherche = listeIntervenants
        .where((e) => e.intervenantId == intervenantId)
        .toList();
    if (intervenantRecherche.length > 0) {
      var user = intervenantRecherche[0];
      user.isDone = isDone;
      state = state.copyWith(intervenants: listeIntervenants);
    }
  }
}

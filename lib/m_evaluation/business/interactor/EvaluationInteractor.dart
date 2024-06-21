import 'package:odc_mobile_project/m_evaluation/business/interactor/jurys/GetJuryNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/phases/GetPhaseByIntervenantNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/phases/GetPhasesListNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/questions/GetQuestionListByPhaseNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/reponses/GetReponseListLocalUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/reponses/PostReponseNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/reponses/SaveReponseLocalUseCase.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/evaluationLocalService.dart';
import '../services/evaluationNetworkService.dart';
import 'assertions/GetAssertionListNetworkUsecase.dart';
import 'intervenants/GetIntervenantListNetworkUseCase.dart';
import 'intervenants/GetIntervenantLocalUseCase.dart';
import 'intervenants/GetIntervenantNetworkUseCase.dart';
import 'intervenants/SaveIntervenantLocalUseCase.dart';
part 'EvaluationInteractor.g.dart';


class EvaluationInteractor{
  GetIntervenantNetworkUseCase getIntervenantNetworkUseCase;
  GetJuryNetworkUseCase getJuryNetworkUseCase;
  GetPhasesListNetworkUseCase getPhasesListNetworkUseCase;
  SaveIntervenantLocalUseCase saveIntervenantLocalUseCase;
  GetIntervenantListNetworkUseCase getIntervenantListNetworkUseCase;

  EvaluationInteractor._(
      this.getIntervenantNetworkUseCase,
      this.getJuryNetworkUseCase,
      this.getPhasesListNetworkUseCase,
      this.saveIntervenantLocalUseCase,
      this.getIntervenantListNetworkUseCase,
      );

  static build(EvaluationNetworkService network, EvaluationLocalService local ){
    return EvaluationInteractor._(
        GetIntervenantNetworkUseCase(network),
      GetJuryNetworkUseCase(network,local),
      GetPhasesListNetworkUseCase(network,local),
      SaveIntervenantLocalUseCase(local),
      GetIntervenantListNetworkUseCase(network,local),

    );
  }
}

@Riverpod(keepAlive: true)
EvaluationInteractor evaluationInteractor(Ref ref){
  throw Exception("Non implementé");
}

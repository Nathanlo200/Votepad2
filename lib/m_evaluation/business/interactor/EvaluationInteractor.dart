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
  GetIntervenantLocalUseCase getIntervenantLocalUseCase;
  GetAssertionListNetworkUsecase getAssertionListUsecase;
  GetQuestionListByPhaseNetworkUseCase getQuestionListByPhaseUseCase;
  GetPhaseByIntervenantNetworkUseCase getPhaseByIntervenantuseCase;
  PostReponseNetworkUseCase postReponseUseCase;
  SaveReponseLocalUseCase saveReponseUseCase;
  SaveIntervenantLocalUseCase saveIntervenantUseCase;
  GetReponseListLocalUseCase getReponseListUseCase;
  GetPhasesListNetworkUseCase getPhasesListNetworkUseCase;
  SaveIntervenantLocalUseCase saveIntervenantLocalUseCase;
  GetJuryNetworkUseCase getJuryNetworkUseCase;
  GetIntervenantListNetworkUseCase getIntervenantListNetworkUseCase;


  EvaluationInteractor._(
      this.getIntervenantNetworkUseCase,
      this.getPhasesListNetworkUseCase,
      this.saveIntervenantLocalUseCase,
      this.getAssertionListUsecase,
      this.getPhaseByIntervenantuseCase,
      this.getQuestionListByPhaseUseCase,
      this.postReponseUseCase,
      this.saveReponseUseCase,
      this.getIntervenantLocalUseCase,
      this.saveIntervenantUseCase,
      this.getReponseListUseCase,
      this.getJuryNetworkUseCase,
      this.getIntervenantListNetworkUseCase
      );

  static build(EvaluationNetworkService network, EvaluationLocalService local){
    return EvaluationInteractor._(
        GetIntervenantNetworkUseCase(network),
      GetPhasesListNetworkUseCase(network, local),
      SaveIntervenantLocalUseCase(local),
        GetAssertionListNetworkUsecase(network,),
        GetPhaseByIntervenantNetworkUseCase(network, local),
        GetQuestionListByPhaseNetworkUseCase(network),
        PostReponseNetworkUseCase(network, local),
        SaveReponseLocalUseCase(local),
        GetIntervenantLocalUseCase( local),
        SaveIntervenantLocalUseCase(local),
        GetReponseListLocalUseCase(local),
      GetJuryNetworkUseCase(network, local),
      GetIntervenantListNetworkUseCase(network, local)
    );
  }
}

@Riverpod(keepAlive: true)
EvaluationInteractor evaluationInteractor(Ref ref){
  throw Exception("Non implementé");
}

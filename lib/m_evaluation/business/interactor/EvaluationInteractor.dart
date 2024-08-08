import 'package:odc_mobile_project/m_evaluation/business/interactor/criteres/GetCritereListByPhaseNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/jurys/GetJuryNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/phases/GetPhaseByIntervenantNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/phases/GetPhasesListNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/questions/GetQuestionListByPhaseNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/reponses/GetReponseListLocalUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/reponses/PostReponseNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/reponses/ResetReponseLocalUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/reponses/SaveReponseLocalUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/votes/GetVoteByIntervenantLocalUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/votes/GetVoteByIntervenantNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/votes/SaveVoteLocalUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/votes/SendVoteByCandidatNetworkUseCase.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/evaluationLocalService.dart';
import '../services/evaluationNetworkService.dart';
import 'assertions/GetAssertionListNetworkUsecase.dart';
import 'criteres/GetCritereListByPhaseLocalUseCase.dart';
import 'criteres/SaveCritereListByPhaseLocalUseCase.dart';
import 'intervenants/GetIntervenantListNetworkUseCase.dart';
import 'intervenants/GetIntervenantLocalUseCase.dart';
import 'intervenants/GetIntervenantNetworkUseCase.dart';
import 'intervenants/ResetIntervenantLocalUseCase.dart';
import 'intervenants/SaveIntervenantLocalUseCase.dart';

part 'EvaluationInteractor.g.dart';

class EvaluationInteractor {
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

  ResetReponseLocalUseCase resetReponseLocalUseCase;
  ResetIntervenantLocalUseCase resetIntervenantLocalUseCase;

  GetCritereListByPhaseNetworkUseCase getCritereListByPhaseNetworkUseCase;
  GetCritereListByPhaseLocalUseCase getCritereListByPhaseLocalUseCase;
  SaveCritereListByPhaseLocalUseCase saveCritereListByPhaseLocalUseCase;
  GetVoteByIntervenantNetworkUseCase getVoteByIntervenantNetworkUseCase;
  GetVoteByIntervenantLocalUseCase getVoteByIntervenantLocalUseCase;
  SaveVoteLocalUseCase saveVoteLocalUseCase;
  SendVoteByCandidatNetworkUseCase sendVoteByCandidatNetworkUseCase;


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
      this.getIntervenantListNetworkUseCase,

      this.resetReponseLocalUseCase,
      this.resetIntervenantLocalUseCase,


      this.getCritereListByPhaseNetworkUseCase,
      this.getCritereListByPhaseLocalUseCase,
      this.saveCritereListByPhaseLocalUseCase,
      this.getVoteByIntervenantNetworkUseCase,
      this.saveVoteLocalUseCase,
      this.getVoteByIntervenantLocalUseCase,
      this.sendVoteByCandidatNetworkUseCase);

  static build(EvaluationNetworkService network, EvaluationLocalService local) {
    return EvaluationInteractor._(

        GetIntervenantNetworkUseCase(network,local),
      GetPhasesListNetworkUseCase(network, local),
      SaveIntervenantLocalUseCase(local),
        GetAssertionListNetworkUsecase(network,),

        GetPhaseByIntervenantNetworkUseCase(network, local),
        GetQuestionListByPhaseNetworkUseCase(network),
        PostReponseNetworkUseCase(network, local),
        SaveReponseLocalUseCase(local),
        GetIntervenantLocalUseCase(local),
        SaveIntervenantLocalUseCase(local),
        GetReponseListLocalUseCase(local),

        GetJuryNetworkUseCase(network),
        GetIntervenantListNetworkUseCase(network, local),
        ResetReponseLocalUseCase(local),
        ResetIntervenantLocalUseCase(local),

        GetCritereListByPhaseNetworkUseCase(network),
        GetCritereListByPhaseLocalUseCase(local),
        SaveCritereListByPhaseLocalUseCase(local),
        GetVoteByIntervenantNetworkUseCase(network),
        SaveVoteLocalUseCase(local),
        GetVoteByIntervenantLocalUseCase(local),
        SendVoteByCandidatNetworkUseCase(network));

  }
}

@Riverpod(keepAlive: true)
EvaluationInteractor evaluationInteractor(Ref ref) {
  throw Exception("Non implementé");
}

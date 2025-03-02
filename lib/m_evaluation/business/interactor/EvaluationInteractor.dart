import 'package:odc_mobile_project/m_evaluation/business/interactor/criteres/GetCritereListByPhaseNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/intervenants/SaveIntervenantListLocalUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/jurys/GetJuryNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/phases/GetPhaseByIntervenantNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/phases/GetPhaseListByIdNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/phases/GetPhasesListNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/questions/GetQuestionListByPhase2NetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/questions/GetQuestionListByPhaseNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/reponses/GetReponseListLocalUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/reponses/PostReponseNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/reponses/ResetReponseLocalUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/reponses/SaveReponseLocalUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/votes/GetVoteByIntervenantLocalUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/votes/GetVoteByIntervenantNetworkUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/votes/ResetVoteValueLocalUseCase.dart';
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
import 'jurys/GetJuryLocalUseCase.dart';
import 'jurys/ResetJury.dart';

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
  GetPhaseListByIdNetworkUseCase getPhaseListByIdNetworkUseCase;
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
  GetJuryLocalUseCase getJuryLocalUseCase;
  SaveIntervenantLocalUseCase saveIntervenantLocalUseCase;
  GetQuestionListByPhase2NetworkUseCase getQuestionListByPhase2NetworkUseCase;
  ResetVoteValueLocalUseCase resetVoteValueLocalUseCase;
  ResetJuryLocalUseCase resetJuryLocalUseCase;

  EvaluationInteractor._(
      this.getIntervenantNetworkUseCase,
      this.getPhasesListNetworkUseCase,
      this.getPhaseListByIdNetworkUseCase,
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
      this.sendVoteByCandidatNetworkUseCase,
      this.getJuryLocalUseCase,
      this.getQuestionListByPhase2NetworkUseCase,
      this.resetVoteValueLocalUseCase,
      this.resetJuryLocalUseCase
      ) ;

  static build(EvaluationNetworkService network, EvaluationLocalService local) {
    return EvaluationInteractor._(
        GetIntervenantNetworkUseCase(network, local),
        GetPhasesListNetworkUseCase(network, local),
        GetPhaseListByIdNetworkUseCase(network,local),
        SaveIntervenantLocalUseCase(local),
        GetAssertionListNetworkUsecase(
          network,
        ),
        GetPhaseByIntervenantNetworkUseCase(network, local),
        GetQuestionListByPhaseNetworkUseCase(network),
        PostReponseNetworkUseCase(network, local),
        SaveReponseLocalUseCase(local),
        GetIntervenantLocalUseCase(local),
        SaveIntervenantLocalUseCase(local),
        GetReponseListLocalUseCase(local),
        GetJuryNetworkUseCase(network, local),
        GetIntervenantListNetworkUseCase(network, local),
        ResetReponseLocalUseCase(local),
        ResetIntervenantLocalUseCase(local),
        GetCritereListByPhaseNetworkUseCase(network,local),
        GetCritereListByPhaseLocalUseCase(local),
        SaveCritereListByPhaseLocalUseCase(local),
        GetVoteByIntervenantNetworkUseCase(network),
        SaveVoteLocalUseCase(local),
        GetVoteByIntervenantLocalUseCase(local),
        SendVoteByCandidatNetworkUseCase(network, local),
        GetJuryLocalUseCase(local),
    GetQuestionListByPhase2NetworkUseCase(network),
        ResetVoteValueLocalUseCase(local),
        ResetJuryLocalUseCase(local)
    );
  }
}

@Riverpod(keepAlive: true)
EvaluationInteractor evaluationInteractor(Ref ref) {
  throw Exception("Non implementé");
}

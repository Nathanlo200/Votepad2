import 'package:odc_mobile_project/m_evaluation/business/interactor/phases/GetPhaseByIntervenantUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/questions/GetQuestionListByPhaseUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/reponses/GetReponseListUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/reponses/PostReponseUseCase.dart';
import 'package:odc_mobile_project/m_evaluation/business/interactor/reponses/SaveReponseUseCase.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/evaluationLocalService.dart';
import '../services/evaluationNetworkService.dart';
import 'assertions/GetAssertionListUsecase.dart';
import 'intervenants/GetIntervenantLocalUseCase.dart';
import 'intervenants/GetIntervenantNetworkUseCase.dart';
import 'intervenants/SaveIntervenantUseCase.dart';
part 'EvaluationInteractor.g.dart';


class EvaluationInteractor{
  GetIntervenantNetworkUseCase getIntervenantNetworkUseCase;
  GetIntervenantLocalUseCase getIntervenantLocalUseCase;
  GetAssertionListUsecase getAssertionListUsecase;
  GetQuestionListByPhaseUseCase getQuestionListByPhaseUseCase;
  GetPhaseByIntervenantUseCase getPhaseByIntervenantuseCase;
  PostReponseUseCase postReponseUseCase;
  SaveReponseUseCase saveReponseUseCase;
  SaveIntervenantUseCase saveIntervenantUseCase;
  GetReponseListUseCase getReponseListUseCase;
  
  EvaluationInteractor._(
      this.getIntervenantNetworkUseCase,
      this.getAssertionListUsecase,
      this.getPhaseByIntervenantuseCase,
      this.getQuestionListByPhaseUseCase,
      this.postReponseUseCase,
      this.saveReponseUseCase,
      this.getIntervenantLocalUseCase,
      this.saveIntervenantUseCase,
      this.getReponseListUseCase
      );

  static build(EvaluationNetworkService network, EvaluationLocalService local ){
    return EvaluationInteractor._(
        GetIntervenantNetworkUseCase(network, local),
      GetAssertionListUsecase(network, local),
      GetPhaseByIntervenantUseCase(network, local),
      GetQuestionListByPhaseUseCase(network, local),
      PostReponseUseCase(network, local),
      SaveReponseUseCase(network, local),
      GetIntervenantLocalUseCase(network, local),
      SaveIntervenantUseCase(network, local),
      GetReponseListUseCase(network, local)
    );
  }
}

@Riverpod(keepAlive: true)
EvaluationInteractor evaluationInteractor(Ref ref){
  throw Exception("Non implementé");
}

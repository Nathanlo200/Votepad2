import 'package:odc_mobile_project/m_evaluation/business/model/Evenement.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/phases.dart';

import '../model/Vote/createVoteRequest.dart';
import '../model/Vote/groupes.dart';
import '../model/Vote/intervenants.dart';
import '../model/Vote/jurys.dart';
import '../model/Vote/phaseCriteres.dart';
import '../model/Vote/phaseIntervenant.dart';
import '../model/Vote/votes.dart';
import '../model/evaluation/assertions.dart';
import '../model/evaluation/reponse.dart';
import '../model/evaluation/questions.dart';



abstract class EvaluationNetworkService
{
  //eventNetworkService
  Future<Evenement> getEvenementById(int id);
  Future<List<Phases>?> getPhasesList();
  Future<Phases> getPhaseListById(int id);
  //Fin eventNetworkservice*

  //evaluationNetworkService
  Future<Intervenants?> getIntervenant(String email, String coupon);
  Future<bool> getPhasesByIntervenant(int intervenantId, int competitionId);
  Future<List<Question>> getQuestionListByPhase(int phaseId);
  Future<List<Assertions>> getAssertionList(int questionId);
  Future<bool> postReponses(Reponse data);
  //Fin evalutaionNetworkService*

  //voteNetworkservice
  Future<Jury?> getJury(String coupon);
  Future<List<Groupes>?> getGroupeList(int phaseId);
  Future<PhaseIntervenant> getGroupById(int id);
  Future<List<Intervenants>?> getIntervenantList(int phaseId);
  Future<PhaseIntervenant> getIntervenantById(int id);
  Future<List<PhaseCriteres>?> getCritereListByPhase(int phaseId);
  Future<Votes?> getVoteByIntervenant(int intervenantId);
  Future<Votes?> getVoteByGroupe(int groupeId);
  Future<dynamic> sendVoteByCandidat(CreateVoteRequest data);
  //Fin voteNetworkService*
}
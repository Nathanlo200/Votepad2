import 'package:odc_mobile_project/m_evaluation/business/model/Evenement.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/PhasesVote.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/DureeQuestionAssertion.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/intervenantEvaluation.dart';
import '../model/Vote/createVoteRequest.dart';
import '../model/Vote/groupes.dart';
import '../model/Vote/juryIdentifiant.dart';
import '../model/evaluation/reponse.dart';
import '../model/intervenants.dart';
import '../model/Vote/phaseCriteres.dart';
import '../model/evaluation/assertions.dart';
import '../model/evaluation/questionAssertions.dart';
import '../model/phaseIntervenant.dart';

abstract class EvaluationNetworkService
{
  //eventNetworkService
  Future<Evenement> getEvenementById(int id);
  Future<List<PhasesVote>?> getPhasesList();
  Future<PhasesVote> getPhaseListById(int id,String token);
  //Fin eventNetworkservice*

  //evaluationNetworkService
  Future<IntervenantEvaluation?> getIntervenant(String email, String coupon);
  Future<PhaseIntervenant> getPhasesByIntervenant(int intervenantId, int competitionId);
  Future<List<QuestionsAssertions>> getQuestionListByPhase(int phaseId);
  Future<DureeQuestionAssertion?> getQuestionListByPhase2(int phaseId, int intervenantId);
  Future<List<Assertions>> getAssertionList(int questionId);
  Future<int> postReponses(Reponse reponse);
  //Fin evalutaionNetworkService*

  //voteNetworkservice
  Future<JuryIdentifiant?> getJury(String coupon, String imei);
  Future<List<Groupes>?> getGroupeList(int phaseId);
  Future<PhaseIntervenant> getGroupById(int id);
  Future<List<Intervenants>?> getIntervenantList(int phaseId,String token);
  Future<PhaseIntervenant> getIntervenantById(int id);
  Future<List<PhaseCriteres>?> getCritereListByPhase(int phaseId,String token);
  Future<CreateVoteRequest?> getVoteByIntervenant(int intervenantId);
  Future<CreateVoteRequest?> getVoteByGroupe(int groupeId);
  Future<Map> sendVoteByCandidat(CreateVoteRequest data, String token,int nombre_user);
//Fin voteNetworkService*
}
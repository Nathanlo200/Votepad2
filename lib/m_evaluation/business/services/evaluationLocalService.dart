
import '../model/Evenement.dart';
import '../model/Vote/EvenementVote.dart';
import '../model/Vote/createVoteRequest.dart';
import '../model/Vote/groupes.dart';
import '../model/Vote/juryIdentifiant.dart';
import '../model/intervenants.dart';
import '../model/Vote/jurys.dart';
import '../model/Vote/phaseCriteres.dart';
import '../model/phaseIntervenant.dart';
import '../model/evaluation/reponse.dart';
import '../model/Vote/PhasesVote.dart';

abstract class EvaluationLocalService {
  //eventLocalSave
  Future<EvenementVote> saveEvenementById(EvenementVote data);
  Future<bool> savePhasesList(List<PhasesVote> data);

  //eventLocalGet
  Future<Evenement> getEvenementById(int id);
  Future<List<PhasesVote>> getPhasesList();
  Future<PhasesVote> getPhaseListById(int id);
  //fin eventLocalService*

  //evaluationLocalService
  Future<Intervenants> getIntervenant();
  Future<bool> saveIntervenant(Intervenants intervenant);
  Future<Reponse?> saveReponses(Reponse data);

  Future<bool> resetReponses();
  Future<List<Reponse>> getReponsesList();
  //fin evaluationLocalService*


  //voteLocalService
  //LocalGetService
  Future<JuryIdentifiant> getJury();
  Future<List<Groupes>> getGroupeList();
  Future<PhaseIntervenant> getGroup(int id);
  Future<List<Intervenants>> getIntervenantList();
  Future<List<PhaseCriteres>> getCritereListByPhase();
  Future<CreateVoteRequest> getVoteByIntervenant(int intervenantId);
  Future<CreateVoteRequest> getVoteByGroupe(int groupeId);

  //LocalSaveService
  Future<bool> saveVote(CreateVoteRequest data);
  Future<bool> saveJury(JuryIdentifiant data);
  Future<bool> saveGroupeList(List<Groupes> data);
  Future<bool> saveGroup(Groupes data);
  Future<bool> saveIntervenantList(List<Intervenants> data);
  Future<bool> saveCritereListByPhase(List<PhaseCriteres> data);
//Fin voteLocalService*
}
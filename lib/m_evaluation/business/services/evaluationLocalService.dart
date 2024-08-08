
import '../model/Evenement.dart';
import '../model/Vote/EvenementVote.dart';
import '../model/Vote/createVoteRequest.dart';
import '../model/Vote/groupes.dart';
import '../model/Vote/intervenants.dart';
import '../model/Vote/jurys.dart';
import '../model/Vote/phaseCriteres.dart';
import '../model/Vote/PhasesVote.dart';
import '../model/intervenant/phaseIntervenant.dart';
import '../model/phases.dart';

abstract class EvaluationLocalService {
  //eventLocalSave
  Future<EvenementVote> saveEvenementById(EvenementVote data);
  Future<bool> savePhasesList(List<Phases> data);

  //eventLocalGet
  Future<Evenement> getEvenementById(int id);
  Future<List<Phases>> getPhasesList();
  Future<PhasesVote> getPhaseListById(int id);
  //fin eventLocalService*

  //evaluationLocalService
  Future<Intervenants> getIntervenant();
  Future<bool> saveIntervenant(Intervenants intervenant);
  Future<bool> saveReponses(Map<int, int>? data);

  Future<bool> resetReponses();
  Future<bool> resetIntervenant();
  Future <Map<int, int>?> getReponsesList();
  //fin evaluationLocalService*


  //voteLocalService
  //LocalGetService
  Future<Jury> getJury();
  Future<List<Groupes>> getGroupeList();
  Future<PhaseIntervenant> getGroup(int id);
  Future<List<Intervenants>> getIntervenantList();
  Future<List<PhaseCriteres>> getCritereListByPhase();
  Future<CreateVoteRequest> getVoteByIntervenant(int intervenantId);
  Future<CreateVoteRequest> getVoteByGroupe(int groupeId);

  //LocalSaveService
  Future<bool> saveVote(CreateVoteRequest data);
  Future<bool> saveJury(Jury data);
  Future<bool> saveGroupeList(List<Groupes> data);
  Future<bool> saveGroup(Groupes data);
  Future<bool> saveIntervenantList(List<Intervenants> data);
  Future<bool> saveCritereListByPhase(List<PhaseCriteres> data);
//Fin voteLocalService*
}
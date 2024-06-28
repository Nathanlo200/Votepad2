import 'package:get_storage/get_storage.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Evenement.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/createVoteRequest.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/groupes.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/intervenants.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/jurys.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/phaseCriteres.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/phaseIntervenant.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/reponse.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/PhasesVote.dart';

import '../business/model/Vote/EvenementVote.dart';
import '../business/services/evaluationLocalService.dart';

class EvaluationLocalServiceImplTest implements EvaluationLocalService{
  GetStorage stockage;

  EvaluationLocalServiceImplTest(this.stockage);
  @override
  Future<List<PhaseCriteres>> getCritereListByPhase() {
    var dataJson= stockage.read("CRITERES");
    return Future.value(List<PhaseCriteres>.from(dataJson.map((x) => PhaseCriteres.fromJson(x))));
  }

  @override
  Future<Evenement> getEvenementById(int id) {
    var dataJson= stockage.read("CRITERES");
    return Future.value(Evenement.fromJson(dataJson));
  }

  @override
  Future<PhaseIntervenant> getGroup(int id) {
   var dataJson= stockage.read("CRITERES");
    return Future.value(PhaseIntervenant.fromJson(dataJson));
  }

  @override
  Future<List<Groupes>> getGroupeList() {
   var dataJson= stockage.read("CRITERES");
    return Future.value(List<Groupes>.from(dataJson.map((x) => Groupes.fromJson(x))));
  }

  @override
  Future<Intervenants> getIntervenant() {
    var dataJson= stockage.read("CRITERES");
    return Future.value(Intervenants.fromJson(dataJson));
  }

  @override
  Future<List<Intervenants>> getIntervenantList() {
    var dataJson= stockage.read("CRITERES");
    return Future.value(List<Intervenants>.from(dataJson.map((x) => Intervenants.fromJson(x))));
  }

  @override
  Future<Jury> getJury() {
    var dataJson= stockage.read("CRITERES");
    return Future.value(Jury.fromJson(dataJson));
  }

  @override
  Future<PhasesVote> getPhaseListById(int id) {
    var dataJson= stockage.read("CRITERES");
    return Future.value(PhasesVote.fromJson(dataJson));
  }

  @override
  Future<List<PhasesVote>> getPhasesList() {
    var dataJson= stockage.read("CRITERES");
    return Future.value(List<PhasesVote>.from(dataJson.map((x) => PhasesVote.fromJson(x))));
  }

  @override
  Future<List<Reponse>> getReponsesList() {
    var dataJson= stockage.read("CRITERES");
    return Future.value(List<Reponse>.from(dataJson.map((x) => Reponse.fromJson(x))));
  }

  @override
  Future<CreateVoteRequest> getVoteByGroupe(int groupeId) {
   var dataJson= stockage.read("CRITERES");
    return Future.value(CreateVoteRequest.fromJson(dataJson));
  }

  @override
  Future<CreateVoteRequest> getVoteByIntervenant(int intervenantId) {
    var dataJson= stockage.read("CRITERES");
    return Future.value(CreateVoteRequest.fromJson(dataJson));
  }

  @override
  Future<bool> resetReponses() {
    var dataJson= [];
    stockage.write("CRITERES", dataJson);
    return Future.value(true);
  }

  @override
  Future<bool> saveCritereListByPhase(List<PhaseCriteres> data) {
    var dataJson= data.map((e) => e.toJson()).toList();
    stockage.write("CRITERES", dataJson);
    return Future.value(true);
  }

  @override
  Future<EvenementVote> saveEvenementById(EvenementVote data) {
    var dataJson= data.toJson();
    stockage.write("EVENEMENT", dataJson);
    return Future.value(data);
  }

  @override
  Future<bool> saveGroup(Groupes data) {
   var dataJson= data.toJson();
   stockage.write("GROUPES", dataJson);
    return Future.value(true);
  }

  @override
  Future<bool> saveGroupeList(List<Groupes> data) {
    var dataJson= data.map((e) => e.toJson()).toList();
    stockage.write("GROUPES", dataJson);
    return Future.value(true);
  }

  @override
  Future<bool> saveIntervenant(Intervenants intervenant) async {
   var data= intervenant.toJson();
   await stockage.write("INTERVENANT", data);
    return true;
  }

  @override
  Future<bool> saveIntervenantList(List<Intervenants> data) {
    var dataJson= data.map((e) => e.toJson()).toList();
    stockage.write("INTERVENANT", dataJson);
    return Future.value(true);
  }

  @override
  Future<bool> saveJury(Jury jury) async {
    var data= jury.toJson();
    await stockage.write("JURY", data);
    return true;
  }

  @override
  Future<bool> savePhasesList(List<PhasesVote> data) async {
    var dataJson= data.map((e) => e.toJson()).toList();
    await stockage.write("PHASES", dataJson);
    return true;
  }

  @override
  Future<Reponse?> saveReponses(Reponse data) {
    var dataJson= data.toJson();
    stockage.write("REPONSE", dataJson);
    return Future.value(data);
  }

  @override
  Future<bool> saveVote(CreateVoteRequest data) {
   var dataJson= data.toJson();
   stockage.write("VOTE", dataJson);
    return Future.value(true);
  }

}
import 'dart:async';

import 'package:get_storage/get_storage.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Evenement.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/EvenementVote.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/PhasesVote.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/groupes.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/intervenants.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/jurys.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/phaseCriteres.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/intervenant/phaseIntervenant.dart';
import 'package:odc_mobile_project/m_evaluation/business/services/evaluationLocalService.dart';

import '../../business/model/Vote/phases.dart';

class EvaluationLocalServiceNathImpl implements EvaluationLocalService {
  GetStorage stockage;

  EvaluationLocalServiceNathImpl(this.stockage);

  @override
  Future<Intervenants> getIntervenant() async {
    var dataJson = stockage.read("INTERVENANT");
    return Future.value(Intervenants.fromJson(dataJson));
  }

  @override
  Future<Map<int, int>?> getReponsesList() async {
    var key = "RESPONSES";
    var data = await stockage.read(key);
    if (data == null) {
      return {};
    } else {
      data = await stockage.read(key) as List;
      var result = Map.fromIterable(data,
          key: (v) => v["question_id"] as int,
          value: (v) => v["assertion_id"] as int);
      return result;
    }
  }

  @override
  Future<bool> resetReponses() async {
    var key = "REPONSES";
    await stockage.remove(key);
    return true;
  }

  @override
  Future<bool> saveIntervenant(Intervenants intervenant) async {
    var data = intervenant.toJson();
    await stockage.write("INTERVENANT", data);
    return true;
  }

  @override
  Future<bool> saveReponses(Map<int, int>? data) async {
    var key = "RESPONSES";
    print(data);
    var myList = data!.entries
        .map((entry) => {"question_id": entry.key, "assertion_id": entry.value})
        .toList();
    await stockage.write(key, myList);
    return true;
  }

  @override
  Future<Evenement> getEvenementById(int id) {
    var dataJson = stockage.read("EVENEMENTS");
    return Future.value(Evenement.fromJson(dataJson));
  }

  @override
  Future<PhasesVote> getPhaseListById(int id) {
    var dataJson = stockage.read("PHASES");
    return Future.value(PhasesVote.fromJson(dataJson));
  }

  @override
  Future<List<Phases>> getPhasesList() {
    var dataJson = stockage.read("PHASES");
    return Future.value(
        List<Phases>.from(dataJson.map((x) => Phases.fromJson(x))));
  }

  @override
  Future<EvenementVote> saveEvenementById(EvenementVote data) {
    var dataJson = data.toJson();
    stockage.write("EVENEMENTS", dataJson);
    return Future.value(data);
  }

  @override
  Future<bool> savePhasesList(List<Phases> data) async {
    var dataJson = data.map((e) => e.toJson()).toList();
    await stockage.write("PHASES", dataJson);
    return true;
  }

  @override
  Future<List<PhaseCriteres>> getCritereListByPhase() {
    var dataJson = stockage.read("CRITERES");
    return Future.value(List<PhaseCriteres>.from(
        dataJson.map((x) => PhaseCriteres.fromJson(x))));
  }

  @override
  Future<PhaseIntervenant> getGroup(int id) {
    var dataJson = stockage.read("GROUPES");
    return Future.value(PhaseIntervenant.fromJson(dataJson));
  }

  @override
  Future<List<Groupes>> getGroupeList() {
    var dataJson = stockage.read("GROUPES");
    return Future.value(
        List<Groupes>.from(dataJson.map((x) => Groupes.fromJson(x))));
  }

  @override
  Future<List<Intervenants>> getIntervenantList() {
    var dataJson = stockage.read("iNTERVENANTS");
    return Future.value(
        List<Intervenants>.from(dataJson.map((x) => Intervenants.fromJson(x))));
  }

  @override
  Future<Jury> getJury() {
    var dataJson = stockage.read("JURYS");
    return Future.value(Jury.fromJson(dataJson));
  }

  @override
  Future<Map<String, double>> getVoteByGroupe(int groupeId) {
    var dataJson = stockage.read("VOTES");
    return Future<Map<String, double>>.value(dataJson);
  }



  @override
  Future<bool> saveCritereListByPhase(List<PhaseCriteres> data) {
    var dataJson = data.map((e) => e.toJson()).toList();
    stockage.write("CRITERES", dataJson);
    return Future.value(true);
  }

  @override
  Future<bool> saveGroup(Groupes data) {
    var dataJson = data.toJson();
    stockage.write("GROUPES", dataJson);
    return Future.value(true);
  }

  @override
  Future<bool> saveGroupeList(List<Groupes> data) {
    var dataJson = data.map((e) => e.toJson()).toList();
    stockage.write("GROUPES", dataJson);
    return Future.value(true);
  }

  @override
  Future<bool> saveIntervenantList(List<Intervenants> data) {
    var dataJson = data.map((e) => e.toJson()).toList();
    stockage.write("iNTERVENANTS", dataJson);
    return Future.value(true);
  }

  @override
  Future<bool> saveJury(Jury jury) async {
    var data = jury.toJson();
    await stockage.write("JURYS", data);
    return true;
  }

  @override
  Future<Map<String, double>?> getVoteByIntervenant(int intervenantId) async {
    var data = await stockage.read("VOTES");
    print("DATA $data");
    if (data != null) {
      var res = data[intervenantId.toString()] as Map?;
      print("LOCAL VOTES $res" );
      return res?.cast<String, double>();
    }
    return null;
  }

  @override
  Future<bool> saveVote(int intervenantId, Map<String, double> data) async {
    var existingVotes = await stockage.read("VOTES") as Map?;
    if (existingVotes == null) {
      existingVotes = {};
    }
    existingVotes[intervenantId.toString()] = data;
    print("existingVotes $existingVotes");
    await stockage.write("VOTES", existingVotes);

    return Future.value(true);
  }
}

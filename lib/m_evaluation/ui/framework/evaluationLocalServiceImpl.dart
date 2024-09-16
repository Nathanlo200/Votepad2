import 'dart:async';

import 'package:get_storage/get_storage.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Evenement.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Phases.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/EvenementVote.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/PhasesVote.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/createVoteRequest.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/groupes.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/phaseCriteres.dart';

import '../../business/model/Vote/juryIdentifiant.dart';
import '../../business/model/evaluation/intervenantEvaluation.dart';
import '../../business/model/intervenants.dart';
import '../../business/model/phaseIntervenant.dart';
import '../../business/services/evaluationLocalService.dart';

class EvaluationLocalServiceImpl implements EvaluationLocalService{
  GetStorage stockage;

  EvaluationLocalServiceImpl(this.stockage);
  var VOTE_KEY="_VOTES_3";

  @override
  Future<IntervenantEvaluation?> getIntervenant() async{
    var dataJson= stockage.read("INTERVENANT");
    if(dataJson == null){
      return null;
    }else {
      return Future.value(IntervenantEvaluation.fromJson(dataJson));
    }

  }

  @override
  Future<Map<int, int>?> getReponsesList() async{
    var key = "RESPONSES";
    var data = await stockage.read(key);
    if(data == null){
      return {};
    }
    else{
      data = await stockage.read(key) as List;
      var result = Map.fromIterable(data,
          key: (v) => v["question_id"] as int, value: (v) => v["assertion_id"] as int);
      return result;
    }
    }

  @override
  Future<bool> resetReponses()async {
    var key = "RESPONSES";
    await stockage.remove(key);
    return true;
  }

  @override
  Future<bool> resetIntervenant()async {
    var key = "INTERVENANT";
    await stockage.remove(key);
    return true;
  }

  @override
  Future<bool> saveIntervenant(IntervenantEvaluation intervenant) async{
    var data= intervenant.toJson();
    await stockage.write("INTERVENANT", data);
    print('donnees à stocker : $data');
    return true;

  }

  @override
  Future<bool> saveReponses(Map<int, int>? data) async{
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
    var dataJson= stockage.read("EVENEMENTS");
    return Future.value(Evenement.fromJson(dataJson));
  }

  @override
  Future<PhasesVote> getPhaseListById(int id) {
    var dataJson= stockage.read("PHASES");
    return Future.value(PhasesVote.fromJson(dataJson));
  }

  @override
  Future<EvenementVote> saveEvenementById(EvenementVote data) {
    var dataJson= data.toJson();
    stockage.write("EVENEMENTS", dataJson);
    return Future.value(data);
  }

  @override
  Future<List<PhaseCriteres>> getCritereListByPhase() {
    var dataJson= stockage.read("CRITERES");
    return Future.value(List<PhaseCriteres>.from(dataJson.map((x) => PhaseCriteres.fromJson(x))));
  }

  @override
  Future<PhaseIntervenant> getGroup(int id) {
    var dataJson= stockage.read("GROUPES");
    return Future.value(PhaseIntervenant.fromJson(dataJson));
  }

  @override
  Future<List<Groupes>> getGroupeList() {
    var dataJson= stockage.read("GROUPES");
    return Future.value(List<Groupes>.from(dataJson.map((x) => Groupes.fromJson(x))));
  }

  @override
  Future<List<Intervenants>> getIntervenantList() {
    var dataJson= stockage.read("INTERVENANTS");
    return Future.value(List<Intervenants>.from(dataJson.map((x) => Intervenants.fromJson(x))));
  }

  @override
  Future<JuryIdentifiant?> getJury() {
    var dataJson= stockage.read("JURYS");
    if (dataJson == null) {
      return Future.value(null);
    }
    return Future.value(JuryIdentifiant.fromJson(dataJson));
  }



  @override
  Future<bool> saveGroup(Groupes data) {
    var dataJson= data.toJson();
    stockage.write("GROUPES", dataJson);
    return Future.value(true);
  }

  @override
  Future<bool> saveCritereListByPhase(List<PhaseCriteres> data) {
    var dataJson= data.map((e) => e.toJson()).toList();
    stockage.write("CRITERES", dataJson);
    return Future.value(true);
  }

  @override
  Future<bool> saveGroupeList(List<Groupes> data) {
    var dataJson= data.map((e) => e.toJson()).toList();
    stockage.write("GROUPES", dataJson);
    return Future.value(true);
  }

  @override
  Future<bool> saveIntervenantList(List<Intervenants> data) {
    var dataJson= data.map((e) => e.toJson()).toList();
    stockage.write("INTERVENANTS", dataJson);
    return Future.value(true);
  }
  @override

  Future<bool> saveVote(int intervenantId,Map<String, double> data) async {
    var existingVotes = await stockage.read(VOTE_KEY) as Map?;
    if (existingVotes == null) {
      existingVotes = {};
    }
    print(existingVotes.runtimeType);
    print("==== $existingVotes");
    // existingVotes=existingVotes.cast<String, Map<String, double>>();
    print(existingVotes.runtimeType);
    existingVotes[intervenantId.toString()] = data;
    print("existingVotes $existingVotes");
    await stockage.write(VOTE_KEY, existingVotes);

    return Future.value(true);
  }
  @override
  Future<Map<String, double>> getVoteByGroupe(int groupeId) {
    // TODO: implement getVoteByGroupe
    throw UnimplementedError();
  }

  @override
  Future<Map<String, double>?> getVoteByIntervenant(int intervenantId) async{
    var data = await stockage.read("_VOTES_3") as Map?;
    print("DATA $data");
    if (data != null) {
      var res = data[intervenantId.toString()] as Map?;
      print("LOCAL VOTES $res" );
      return res?.cast<String, double>();
    }
    return null;
  }

  @override
  Future<bool> savePhasesList(List<dynamic> data) {
    // TODO: implement savePhasesList
    throw UnimplementedError();
  }

  @override
  Future<List<Phases>> getPhasesList() {
    // TODO: implement getPhasesList
    throw UnimplementedError();
  }

  @override
  Future<bool> saveJury(JuryIdentifiant data) {
    var dataJson= data.toJson();
    print('donnees à stocker : $dataJson');
    stockage.write("JURYS", dataJson);
    return Future.value(true);
  }

  @override
  Future<PhaseIntervenant>? getIntervenantById(int id) {
    // TODO: implement getIntervenantById
    throw UnimplementedError();
  }

  @override
  Future<bool> disconnect() async {
   var key = "JURYS";
   await stockage.remove(key);
   var key2 = VOTE_KEY;
   await stockage.remove(key2);
   var key3 = "PHASES";
   await stockage.remove(key3);
   var key4 = "CRITERES";
   await stockage.remove(key4);
   var key5 = "GROUPES";
   await stockage.remove(key5);
   var key6 = "INTERVENANTS";
   await stockage.remove(key6);
   var key7 = "EVENEMENTS";
   await stockage.remove(key7);
   return Future.value(true);

  }

  @override
  Future<bool> resetVoteValue() async{
    var key = VOTE_KEY;
    await stockage.remove(key);
    return true;
  }


}
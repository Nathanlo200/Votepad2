import 'package:odc_mobile_project/m_evaluation/business/model/Evenement.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/EvenementVote.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/createVoteRequest.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/groupes.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/intervenants.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/jurys.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/phaseCriteres.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/phaseIntervenant.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/votes.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/assertions.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/intervenants.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/questions.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/reponse.dart';

import 'package:odc_mobile_project/m_evaluation/business/model/Vote/PhasesVote.dart';
import '../business/model/Vote/PhasesVote.dart';
import '../business/services/evaluationNetworkService.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EvaluationNetworkServiceImpl implements EvaluationNetworkService {
  String baseURL;

  EvaluationNetworkServiceImpl(this.baseURL);

  @override
  Future<List<Assertions>> getAssertionList(int questionId) {
    // TODO: implement getAssertionList
    throw UnimplementedError();
  }

  @override
  Future<List<PhaseCriteres>?> getCritereListByPhase(int phaseId) {
    // TODO: implement getCritereListByPhase
    throw UnimplementedError();
  }

  @override
  Future<PhaseIntervenant> getGroupById(int id) {
    // TODO: implement getGroupById
    throw UnimplementedError();
  }

  @override
  Future<List<Groupes>?> getGroupeList(int phaseId) {
    // TODO: implement getGroupeList
    throw UnimplementedError();
  }

  @override
  Future<Intervenants?> getIntervenant(String email, String coupon) async {
    var res = await http.post(
        Uri.parse("$baseURL/api/intervenants-authenticate"),
        body: {"email": email, "coupon": coupon});
    // print(res.body);
    // print(res.statusCode);
    if ([200, 201].indexOf(res.statusCode) == -1) {
      throw Exception(res.body);
    }
    var reponseMap = json.decode(res.body) as Map;
    print("responseMap $reponseMap");
    var reponseFinal = Intervenants.fromJson(reponseMap.cast<String, dynamic>());
    return reponseFinal;
  }

  @override
  Future<PhaseIntervenant> getIntervenantById(int id) {
    // TODO: implement getIntervenantById
    throw UnimplementedError();
  }


  @override
  Future<Jury?> getJury(String coupon) {
    // TODO: implement getJury
    throw UnimplementedError();
  }


  @override
  Future<bool> getPhasesByIntervenant(int intervenantId, int competitionId) {
    // TODO: implement getPhasesByIntervenant
    throw UnimplementedError();
  }


  @override
  Future<List<Question>> getQuestionListByPhase(int phaseId) {
    // TODO: implement getQuestionListByPhase
    throw UnimplementedError();
  }

  @override
  Future<Votes?> getVoteByGroupe(int groupeId) {
    // TODO: implement getVoteByGroupe
    throw UnimplementedError();
  }

  @override
  Future<Votes?> getVoteByIntervenant(int intervenantId) {
    // TODO: implement getVoteByIntervenant
    throw UnimplementedError();
  }

  @override
  Future<bool> postReponses(Reponse data) {
    // TODO: implement postReponses
    throw UnimplementedError();
  }

  @override
  Future sendVoteByCandidat(CreateVoteRequest data) {
    // TODO: implement sendVoteByCandidat
    throw UnimplementedError();
  }

  @override
  Future<PhasesVote> getPhaseById(int id) {
    // TODO: implement getPhaseListById
    throw UnimplementedError();
  }


/*
main  () async{
  var baseUrlTest="http://10.252.252.59:8000";
  var impl=EvaluationNetworkServiceImpl(baseUrlTest);
  // test
  impl.getIntervenant("glody@gmail.com", "V5OZT7");

}*/

  @override
  Future<List<Intervenants>?> getIntervenantList(int phaseId) async {
    var res= await http.get(Uri.parse("$baseURL/api/intervenant-phases/$phaseId"),);
    var reponseList=json.decode(res.body) as List;
    print("responseList = $reponseList");
    var responseFinal= reponseList.map((e)=> Intervenants.fromJson(e) ).toList();
    return responseFinal;
  }

  @override
  Future<PhasesVote> getPhaseListById(int id) {
    // TODO: implement getPhaseListById
    throw UnimplementedError();
  }

  @override
  Future<Evenement> getEvenementById(int id) async {
    var res= await http.get(Uri.parse("$baseURL/api/phases"),);
    print(res.body);
    var reponseList=json.decode(res.body) as List;
    print("responseMap $reponseList");
    var responseFinal= reponseList.map((e)=> Evenement.fromJson(e) ).toList();
    return responseFinal[0];
  }

  @override
  Future<List<PhasesVote>?> getPhasesList() {
    // TODO: implement getPhasesList
    throw UnimplementedError();
  }
}
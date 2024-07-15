import 'dart:convert';
import 'package:odc_mobile_project/m_evaluation/business/model/Evenement.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/PhasesVote.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/createVoteRequest.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/groupes.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/intervenants.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/jurys.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/phaseCriteres.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/votes.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/assertions.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/questionAssertions.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/intervenant/phaseIntervenant.dart';
import '../../business/model/evaluation/postReponses.dart';
import '../../business/model/phases.dart';
import '../../business/services/evaluationNetworkService.dart';
import "package:http/http.dart" as http;

class EvaluationNetworkServiceImpl implements EvaluationNetworkService{
  String baseURL;

  EvaluationNetworkServiceImpl(this.baseURL);

  @override
  Future<List<Assertions>> getAssertionList(int questionId) async{
    var res= await http.get(Uri.parse("$baseURL/api/assertions"),
        headers: {});
    var reponseList=json.decode(res.body) as List;
    //print("responseMap $reponseList");
    await Future.delayed(Duration(seconds: 3));
    var responseFinal= reponseList.map((e)=> Assertions.fromJson(e) ).toList();
    return responseFinal;
  }


  @override
  Future<Intervenants?> getIntervenant(String email, String coupon) async {
    var res = await http.post(
        Uri.parse("$baseURL/api/intervenants-authenticate"),
        body: {"email": email, "coupon": coupon});
    // print("body response ${res.body}");
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
  Future<PhaseIntervenant> getPhasesByIntervenant(int intervenantId, int evenementId) async{
    var res= await http.get(Uri.parse("$baseURL/api/phases"),
        headers: {"Authorization": "Bearer $evenementId"});
    var reponseBody = json.decode(res.body) as PhaseIntervenant;
    await Future.delayed(Duration(seconds: 3));
    var responseFinal = PhaseIntervenant.fromJson(reponseBody as Map);
    return responseFinal;

  }

  @override
  Future<List<QuestionsAssertions>> getQuestionListByPhase(int phaseId) async {
    // var res= await http.get(Uri.parse("$baseURL/api/questions"));
    // var reponseList=json.decode(res.body) as List;
    // //print("responseMap $reponseList");
    // await Future.delayed(Duration(seconds: 1));
    // var responseFinal= reponseList.map((e)=> QuestionsAssertions.fromJson(e) ).toList();
    // return responseFinal;

    var res= await http.get(Uri.parse("$baseURL/api/question_phases/$phaseId"));
    var reponseList=json.decode(res.body) as List;
    print("responseMap $reponseList");
    await Future.delayed(Duration(seconds: 1));
    var responseFinal= reponseList.map((e)=>QuestionsAssertions.fromJson(e["data"])).toList() ;
    //var responseFinal= reponseList.map((e)=> QuestionsAssertions.fromJson(e) ).toList();
    return responseFinal;
  }

  @override
  Future<bool> postReponses(List<PostReponses> data) async{
    await http.post(Uri.parse("$baseURL/api/reponses"));
    return Future.value(true);
  }

  @override
  Future<Evenement> getEvenementById(int id) async {
    var res= await http.get(Uri.parse("$baseURL/api/phases"),);
    print(res.body);
    var reponseList=json.decode(res.body) as List;
    print("responseMap $reponseList");
    var responseFinal= reponseList.map((e)=> Evenement.fromJson(e) ).toList();
    return responseFinal as Evenement;
  }

  @override
  Future<PhasesVote> getPhaseListById(int id) {
    // TODO: implement getPhaseListById
    throw UnimplementedError();
  }

  @override
  Future<List<PhasesVote>> getPhasesList()  async{
    var res= await http.get(Uri.parse("$baseURL/api/phases"),);
    print(res.body);
    var reponseList=json.decode(res.body) as List;
    print("responseMap $reponseList");
    var responseFinal= reponseList.map((e)=> PhasesVote.fromJson(e) ).toList();
    return responseFinal;
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
  Future<PhaseIntervenant> getIntervenantById(int id) {
    // TODO: implement getIntervenantById
    throw UnimplementedError();
  }

  @override
  Future<List<Intervenants>?> getIntervenantList(int phaseId) async {
    var res= await http.get(Uri.parse("$baseURL/api/intervenant-phases/$phaseId"),);
    var reponseList=json.decode(res.body) as List;
    print("responseList = $reponseList");
    var responseFinal= reponseList.map((e)=> Intervenants.fromJson(e) ).toList();
    return responseFinal;
  }


  @override
  Future<Jury?> getJury(String coupon) {
    // TODO: implement getJury
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
  Future sendVoteByCandidat(CreateVoteRequest data) {
    // TODO: implement sendVoteByCandidat
    throw UnimplementedError();
  }

}
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Evenement.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/PhasesVote.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/createVoteRequest.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/groupes.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/juryIdentifiant.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/Vote/phaseCriteres.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/DureeQuestionAssertion.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/assertions.dart';
import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/questionAssertions.dart';
import '../../business/model/evaluation/intervenantEvaluation.dart';
import '../../business/model/evaluation/reponse.dart';
import '../../business/model/intervenants.dart';
import '../../business/model/phaseIntervenant.dart';
import '../../business/services/evaluationNetworkService.dart';
import "package:http/http.dart" as http;

class EvaluationNetworkServiceImpl implements EvaluationNetworkService{
  String baseURL;
  String PROD_BASE_URL;

  EvaluationNetworkServiceImpl(this.baseURL, this.PROD_BASE_URL);

  @override
  Future<List<Assertions>> getAssertionList(int questionId) async{
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    var res= await http.get(Uri.parse("$url/api/assertions"),
        headers: {});
    var reponseList=json.decode(res.body) as List;
    //print("responseMap $reponseList");
    await Future.delayed(Duration(seconds: 3));
    var responseFinal= reponseList.map((e)=> Assertions.fromJson(e) ).toList();
    return responseFinal;
  }

  @override
  Future<IntervenantEvaluation?> getIntervenant(
      String email, String coupon) async {
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    var res = await http.post(
        Uri.parse("$url/api/intervenants-authenticate"),
        body: {"email": email, "coupon": coupon});
    print("body response ${res.body}");
    print(res.statusCode);
    if ([200, 201].indexOf(res.statusCode) == -1) {
      throw Exception(res.body);
    }
    var reponseMap = json.decode(res.body) as Map;
    print("responseMap $reponseMap");
    var reponseFinal =
        IntervenantEvaluation.fromJson(reponseMap.cast<String, dynamic>());
    return reponseFinal;
  }

  @override
  Future<PhaseIntervenant> getPhasesByIntervenant(int intervenantId, int evenementId) async{
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    var res= await http.get(Uri.parse("$url/api/phases"),
        headers: {"Authorization": "Bearer $evenementId"});
    var reponseBody = json.decode(res.body) as PhaseIntervenant;
    await Future.delayed(Duration(seconds: 3));
    var responseFinal = PhaseIntervenant.fromJson(reponseBody as Map<String, dynamic>);
    return responseFinal;

  }

  @override
  Future<List<QuestionsAssertions>> getQuestionListByPhase(int phaseId) async {
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    // var res= await http.get(Uri.parse("$baseURL/api/questions"));
    // var reponseList=json.decode(res.body) as List;
    // //print("responseMap $reponseList");
    // await Future.delayed(Duration(seconds: 1));
    // var responseFinal= reponseList.map((e)=> QuestionsAssertions.fromJson(e) ).toList();
    // return responseFinal;

    var res= await http.get(Uri.parse("$url/api/question_phases/$phaseId"));
    var reponseList=json.decode(res.body) as List;
    print("responseMap $reponseList");
    await Future.delayed(Duration(seconds: 1));
    var responseFinal= reponseList.map((e)=>QuestionsAssertions.fromJson(e["data"])).toList() ;
    //var responseFinal= reponseList.map((e)=> QuestionsAssertions.fromJson(e) ).toList();
    return responseFinal;
  }

  @override
  Future<int> postReponses(Reponse reponse) async {
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    var dataToSend=reponse.toJson();
    print("DATA to send $dataToSend");
    final res = await http.post(Uri.parse("$url/api/reponses"), headers: {
      "content-type": "application/json",
    }, body: json.encode(dataToSend));
    if ([200, 201].indexOf(res.statusCode) == -1) {
      throw Exception(res.body);
    }
    print("statuscode de la requete ${res.statusCode}");
    return res.statusCode;
  }

  @override
  Future<Evenement> getEvenementById(int id) async {
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    var res= await http.get(Uri.parse("$url/api/phases"),);
    print(res.body);
    var reponseList=json.decode(res.body) as List;
    print("responseMap $reponseList");
    var responseFinal= reponseList.map((e)=> Evenement.fromJson(e) ).toList();
    return responseFinal as Evenement;
  }

  @override
  Future<PhasesVote> getPhaseListById(int id,String token) async {
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    var res= await http.get(Uri.parse("$url/api/phases/$id"),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }
    );
    var reponseMap = json.decode(res.body) as Map;
    print("responseMap $reponseMap");
    var reponseFinal = PhasesVote.fromJson(reponseMap.cast<String, dynamic>());
    return reponseFinal;
  }

  @override
  Future<List<PhasesVote>> getPhasesList()  async{
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    var res= await http.get(Uri.parse("$url/api/phases"),);
    print(res.body);
    var reponseList=json.decode(res.body) as List;
    print("responseMap $reponseList");
    var responseFinal= reponseList.map((e)=> PhasesVote.fromJson(e) ).toList();
    return responseFinal;
  }
  @override
  Future<List<PhaseCriteres>?> getCritereListByPhase(int phaseId,String token) async{
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    var res= await http.get(Uri.parse("$url/api/phase-criteres/$phaseId"),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responseList=json.decode(res.body) as List;
    print("responseMap $responseList");
    var responseFinal= responseList.map((e)=> PhaseCriteres.fromJson(e) ).toList();
    return responseFinal;
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
  Future<PhaseIntervenant> getIntervenantById(int id) async {
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    var res= await http.get(Uri.parse("$url/api/intervenants/$id"),);
    var reponseMap = json.decode(res.body) as Map;
    print("responseMap $reponseMap");
    var reponseFinal = PhaseIntervenant.fromJson(reponseMap.cast<String, dynamic>());
    return reponseFinal;
  }

  @override
  Future<List<Intervenants>?> getIntervenantList(int phaseId, String token) async {
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    var res= await http.get(Uri.parse("$url/api/intervenant-phases/$phaseId"),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }
    );
    var reponseList=json.decode(res.body) as List;
    print("responseList = $reponseList");
    var responseFinal= reponseList.map((e)=> Intervenants.fromJson(e) ).toList();
    return responseFinal;
  }

  @override
  Future<JuryIdentifiant?> getJury(String coupon, String imei) async{
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    print("data to send $coupon $imei");
    var res = await http.post(Uri.parse("$url/api/jurys-identifiant"),
        body: {"coupon": coupon, "identifiant": imei});
    print("body response ${res.body}");
    print(res.statusCode);
    if (res.statusCode == 200 || res.statusCode == 201) {
      print("success");
    }else{
      throw Exception(res.body);
    }
    var reponseMap = json.decode(res.body) as Map;
    print("responseMap $reponseMap");
    var reponseFinal = JuryIdentifiant.fromJson(reponseMap.cast<String, dynamic>());
    return reponseFinal;
  }

  @override
  Future<CreateVoteRequest?> getVoteByGroupe(int groupeId) {
    // TODO: implement getVoteByGroupe
    throw UnimplementedError();
  }

  @override
  Future<CreateVoteRequest?> getVoteByIntervenant(int intervenantId) async{
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    var res= await http.get(Uri.parse("$url/api/intervenants/$intervenantId"),);
    var reponseMap = json.decode(res.body) as Map;
    print("responseMap $reponseMap");
    var reponseFinal = CreateVoteRequest.fromJson(reponseMap.cast<String, dynamic>());
    return reponseFinal;
  }

  @override
  Future<Map> sendVoteByCandidat(CreateVoteRequest data,String token, int nombre_user) async{
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    var res = await http.post(
      Uri.parse("$url/api/votesUnique"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body:jsonEncode(data.toJson()),
    );
    if ([200, 201].indexOf(res.statusCode) == -1) {
      throw Exception("BLADE"+res.body);
    }
    print("RESULtat" + res.body);
    var reponseMap = json.decode(res.body);
    print("responseMap $reponseMap");
    return reponseMap;
  }


  @override
  Future<DureeQuestionAssertion?> getQuestionListByPhase2(int phaseId, int intervenantId) async{
    bool isProduction = kReleaseMode;  // Basculer selon l'environnement
    String url = isProduction ? PROD_BASE_URL : baseURL;
    var res =
        await http.get(Uri.parse("$url/api/question_phases/$phaseId/$intervenantId"));
    var reponseData = json.decode(res.body) as Map;
    print("responseMap $reponseData");
    var dureeQuestionnaire=DureeQuestionAssertion.fromJson(reponseData)  ;
    // var responseFinal = reponseList
        // .map((e) => DureeQuestionAssertion.fromJson(e))
        // .toList();
    //var responseFinal= reponseList.map((e)=> QuestionsAssertions.fromJson(e) ).toList();
    return dureeQuestionnaire;
  }
}



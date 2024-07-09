// import 'package:odc_mobile_project/m_evaluation/business/model/Vote/intervenants.dart';
// import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/assertions.dart';
// import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/postReponses.dart';
// import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/questionAssertions.dart';
// import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/questions.dart';
// import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/reponse.dart';
// import 'package:odc_mobile_project/m_evaluation/business/model/intervenant/phaseIntervenant.dart';
// import 'package:odc_mobile_project/m_evaluation/business/services/evaluationNetworkService.dart';
//
// class EvalutionNetworkTestImpl implements EvaluationNetworkService {
//
//   EvalutionNetworkTestImpl();
//
//   @override
//   Future<List<Assertions>> getAssertionList(int questionId) {
//     // TODO: implement getAssertionList
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Intervenants?> getIntervenant(String email, String coupon) {
//     // TODO: implement getIntervenant
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<PhaseIntervenant> getPhasesByIntervenant(
//       int intervenantId, int competitionId) {
//     // TODO: implement getPhasesByIntervenant
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<List<QuestionsAssertions>> getQuestionListByPhase() async {
//     final List<Map<String, dynamic>> questions = [
//       {
//         'question': {
//           "id": 3,
//           "libelle": "c'est quoi une variable en programmation ?"
//         },
//         'assertions': [
//           {"id": 5, "libelle": "zone de stockage des données"},
//           {"id": 30, "libelle": "mémoire de stockage"},
//           {"id": 7, "libelle": "zone-mémoire temporaire de stockage"},
//         ]
//       },
//
//       {
//         "question": {
//           "id": 20,
//           "libelle": "A la recherche du temps perdu"
//         },
//         "assertions": [
//           {"id": 1, "libelle": "Emile Zola"},
//           {"id": 2, "libelle": "honoré de balzac"},
//           {"id": 3, "libelle": "eugène de Rastignac"},
//           {"id": 4, "libelle": "tartarin de tarascon"}
//         ]
//       },
//
//
//
//
//       {
//         'question': {
//           "id": 2,
//           "libelle": "que signifie l'heritage en programmation ?"
//         },
//         'assertions': [
//           {
//             "id": 12,
//             "libelle": "le fait qu'une classe fille herite d'une classe mère"
//           },
//           {"id": 32, "libelle": "heritage multiple"},
//           {"id": 21, "libelle": "passage des parents aux enfants"},
//           {
//             "id": 24,
//             "libelle": "avoir l'implementation d'une autre classe"
//           }
//         ]
//       },
//       {
//         'question': {"id": 5, "libelle": "quel langage est né en premier ?"},
//         'assertions': [
//           {"id": 11, "libelle": "python"},
//           {"id": 12, "libelle": "java"},
//           {"id": 14, "libelle": "c#"},
//           {"id": 17, "libelle": "dart"}
//         ]
//       },
//       {
//         'question': {"id": 85, "libelle": "quelle fonction retourne la taille d'une liste en python ?"},
//         'assertions': [
//           {"id": 9, "libelle": "length"},
//           {"id": 18, "libelle": "taille"},
//           {"id": 19, "libelle": "len"},
//           {"id": 16, "libelle": "count"}
//         ]
//       },
//       {
//         'question': {"id": 6, "libelle": "quelle fonction permet de supprimer un element d'une liste en python ?"},
//         'assertions': [
//           {"id": 21, "libelle": "sup"},
//           {"id": 32, "libelle": "remove"},
//           {"id": 4, "libelle": "shift#"},
//           {"id": 7, "libelle": "unshift"}
//         ]
//       },
//     ];
//
//     //print("responseMap $reponseList");
//     await Future.delayed(Duration(milliseconds: 1500));
//     var responseFinal =
//         questions.map((e) => QuestionsAssertions.fromJson(e)).toList();
//     return responseFinal;
//   }
//
//   @override
//   Future<bool> postReponses(List<PostReponses> data) {
//     //await http.post(Uri.parse("$baseURL/api/reponses"));
//     return Future.value(true);
//   }
// }

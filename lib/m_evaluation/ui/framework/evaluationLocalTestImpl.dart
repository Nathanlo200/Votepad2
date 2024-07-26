// import 'dart:convert';
//
// import 'package:get_storage/get_storage.dart';
// import 'package:odc_mobile_project/m_evaluation/business/model/Vote/intervenants.dart';
// import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/questionAssertions.dart';
// import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/reponse.dart';
// import 'package:odc_mobile_project/m_evaluation/business/services/evaluationLocalService.dart';
//
// class EvaluationLocalTestImpl implements EvaluationLocalService {
//   GetStorage stockage;
//
//   EvaluationLocalTestImpl(this.stockage);
//
//   @override
//   Future<Intervenants> getIntervenant() async {
//     var key = "INTERVENANT";
//     var data = await stockage.read(key) as Intervenants;
//     return data;
//   }
//
//   @override
//   Future<Map<int, int>?> getReponsesList() async {
//     var key = "RESPONSES";
//     var data = await stockage.read(key);
//     if(data == null){
//       return {};
//     }
//     else{
//       data = await stockage.read(key) as List;
//       var result = Map.fromIterable(data,
//           key: (v) => v["question_id"] as int, value: (v) => v["assertion_id"] as int);
//       return result;
//     }
//   }
//
//   @override
//   Future<bool> resetReponses() async {
//     var key = "RESPONSES";
//     await stockage.remove(key);
//     return true;
//   }
//
//   @override
//   Future<bool> saveIntervenant(Intervenants intervenant) async {
//     var key = "INTERVENANT";
//     await stockage.write(key, intervenant);
//     return true;
//   }
//
//   @override
//   Future<bool> saveReponses(Map<int, int>? data) async {
//     var key = "RESPONSES";
//     print(data);
//     var myList = data!.entries
//         .map((entry) => {"question_id": entry.key, "assertion_id": entry.value})
//         .toList();
//
//     //var reponses = data.map((e) => e.toJson()).toList();
//     await stockage.write(key, myList);
//     return true;
//   }
// }

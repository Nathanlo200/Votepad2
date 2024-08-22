import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/questionAssertions.dart';

class DureeQuestionAssertion {
  String duree;
  List<QuestionsAssertions> questionaire;

  DureeQuestionAssertion({
    required this.duree,
    required this.questionaire,
  });

  factory DureeQuestionAssertion.fromJson(Map json) => DureeQuestionAssertion(
    duree: json["duree"],
    questionaire: List<QuestionsAssertions>.from(json["questionaire"].map((x) => QuestionsAssertions.fromJson(x["data"]))),
  );

  Map<String, dynamic> toJson() => {
    "duree": duree,
    "questionaire": List<dynamic>.from(questionaire.map((x) => x.toJson())),
  };
}
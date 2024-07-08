import 'package:odc_mobile_project/m_evaluation/business/model/evaluation/questions.dart';

import 'assertions.dart';

class QuestionsAssertions {
  Question question;
  List<Assertions> assertions;

  QuestionsAssertions({
    required this.question,
    required this.assertions,
  });

  factory QuestionsAssertions.fromJson(Map json) => QuestionsAssertions(
    question: Question.fromJson(json["questions"]),
    assertions: List<Assertions>.from(json["assertions"].map((x) => Assertions.fromJson(x))),
  );

  Map toJson() => {
    "questions": question.toJson(),
    "assertions": List.from(assertions.map((x) => x.toJson())),
  };
}
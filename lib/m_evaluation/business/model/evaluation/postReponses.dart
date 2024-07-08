
import 'dart:convert';

PostReponses postReponsesFromJson(String str) => PostReponses.fromJson(json.decode(str));

String postReponsesToJson(PostReponses data) => json.encode(data.toJson());

class PostReponses {
  int questionId;
  int assertionId;

  PostReponses({
    this.questionId = -1,
    this.assertionId = -1,
  });

  factory PostReponses.fromJson(Map json) => PostReponses(
    questionId: json["question_id"],
    assertionId: json["assertion_id"],
  );

  Map<String, dynamic> toJson() => {
    "question_id": questionId,
    "assertion_id": assertionId,
  };
}

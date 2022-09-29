class QuizModel {
  String? question;
  int? solution;

  QuizModel({this.question, this.solution});

  QuizModel.fromJson(Map<String, dynamic> json) {
    if (json["question"] is String) question = json["question"];
    if (json["solution"] is int) solution = json["solution"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data["question"] = question;
    data["solution"] = solution;
    return data;
  }
}

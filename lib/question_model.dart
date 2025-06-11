class QuestionModel {
  QuestionModel({required this.id, required this.question, required this.choices});

  int id;
  String question;
  List<String> choices;

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      question: json['question'],
      choices: (json['choices'] as List<dynamic>).map((e) => e.toString()).toList(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:teacher_estimation/question_model.dart';

class DataProvider extends ChangeNotifier {
  DataProvider({required this.questions});
  List<QuestionModel> questions;

  List<QuestionModel> getQuestions() {
    // List<dynamic> questionList = await _apiService.fetchQuestions();
    // questions = questionList.map((json) => QuestionModel.fromJson(json)).toList();
    notifyListeners();
    return questions;
  }
}
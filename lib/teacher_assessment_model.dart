import 'package:flutter/foundation.dart';
import 'package:teacher_estimation/question_model.dart';

class TeacherAssessmentModel extends ChangeNotifier {
  TeacherAssessmentModel(List<QuestionModel> questions) {
    setSelectedValues(questions);
  }

  final List<AssessmentValueModel> _selectedValues = [];
  List<AssessmentValueModel> get selectedValues => _selectedValues;

  void setSelectedValues(List<QuestionModel> questions) {
    for (var i = 0; i < questions.length; i++) {
      int n = questions[i].choices.length - 1;
      _selectedValues.add(AssessmentValueModel(n, questions[i].choices[n]));
    }
    notifyListeners();
  }

  void setSelectedValue(int index, AssessmentValueModel? value) {
    _selectedValues[index] = value!;
    notifyListeners();
  }
}

class AssessmentValueModel {
  AssessmentValueModel(this.number, this.description);

  int number;
  String description;
}
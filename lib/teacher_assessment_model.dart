import 'package:flutter/foundation.dart';
import 'package:teacher_estimation/main.dart';

class TeacherAssessmentModel extends ChangeNotifier {
  TeacherAssessmentModel(this._selectedValues);

  final List<AssessmentValueModel> _selectedValues;

  List<AssessmentValueModel> get selectedValues => _selectedValues;

  void setSelectedValue(int index, AssessmentValueModel? value) {
    _selectedValues[index] = value!;
    notifyListeners();
  }
}

class AssessmentValueModel {
  AssessmentValueModel(this._number, this._description);

  int _number;
  String _description;

  int get number => _number;
  String get description => _description;
  set number(int val) => _number = val;
  set description(String val) => _description = val;
}
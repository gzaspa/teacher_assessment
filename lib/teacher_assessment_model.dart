import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class TeacherAssessmentModel extends ChangeNotifier {
  List<int> _selectedValues = List.filled(questions.length, 4);

  void setSelectedValue(int index, int value) {
    _selectedValues[index] = value;
  }
}
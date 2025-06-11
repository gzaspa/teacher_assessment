import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_estimation/main.dart';
import 'package:teacher_estimation/teacher_assessment_model.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.n, required this.question, required this.items});

  final int n;
  final String question;
  final List<String> items;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     setState(() {
  //       context.read<TeacherAssessmentModel>().selectedValues[widget.n - 1] = AssessmentValueModel(widget.items.length - 1, widget.items[0]);
  //     });
  //   });
  // }

  void _moveToNextQuestion() {
    Navigator.of(context).pushNamed('/question${(widget.n)}');
  }

  void _confirmResult() {
    Navigator.of(context).pushNamed('/confirmation');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TeacherAssessmentModel>(
        builder: (context, assessment, child) {
          return AppScreen(
            bodyElement: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Питання ${widget.n}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 113, 58, 62),
                    ),
                  ),
                  Text(
                    widget.question,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromARGB(255, 35, 88, 133),
                    ),
                  ),
                  for (var i = 0; i < widget.items.length; i++)
                    ListTile(
                      title: Text(
                        widget.items[i],
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      leading: Radio<int>(
                        value: widget.items.length - 1 - i,
                        groupValue: assessment.selectedValues[widget.n - 1].number,
                        onChanged: (int? value) {
                          setState(() {
                            assessment.selectedValues[widget.n - 1] = AssessmentValueModel(value!, widget.items[i]);
                          });
                        },
                      ),
                    ),
                  const SizedBox(height: 30),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.resolveWith((value) {
                        return Colors.white;
                      }),
                      backgroundColor: WidgetStateProperty.resolveWith((value) {
                        return Colors.blue;
                      }),
                    ),
                    onPressed: widget.n < assessment.selectedValues.length
                        ? _moveToNextQuestion
                        : _confirmResult,
                    child: Text(
                      widget.n < assessment.selectedValues.length
                          ? 'До наступного питання'
                          : 'Завершити оцінювання',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class ConfirmScreen extends StatelessWidget {
  // _getColor(int grade) {
  //   switch(grade) {
  //     case 0: return Colors.red;
  //     case 1: return Colors.yellow;
  //     case 2: return Colors.orange;
  //     case 3: return Colors.green.shade400;
  //     case 4: return Colors.green.shade800;
  //     default: return Colors.black;
  //   }
  // }
  void onSaveResult() {

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TeacherAssessmentModel>(
        builder: (context, assessment, child) {
          return AppScreen(
            bodyElement: Padding(
              padding: const EdgeInsets.all(10),
              child:
                  Column(
                    children: [
                      const Text(
                        'Збережіть результат оцінювання',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.resolveWith((value) {
                            return Colors.white;
                          }),
                          backgroundColor: WidgetStateProperty.resolveWith((value) {
                            return Colors.blue;
                          }),
                        ),
                        onPressed: onSaveResult,
                        child: const Text(
                          'Зберегти результат',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
                  )
              // ListView(
              //     padding: const EdgeInsets.all(8),
              //     children: <Widget>[
              //
              //       for (var i = 0; i < assessment.selectedValues.length; i++)
              //         Container(
              //           padding: const EdgeInsets.all(16),
              //           decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.grey, width: 2))),
              //           child: Column(
              //             children: [
              //               Text(
              //                 questions[i],
              //                 textAlign: TextAlign.left,
              //                 style: const TextStyle(
              //                   fontSize: 22,
              //                 ),
              //               ),
              //               Text(
              //                 assessment.selectedValues[i].description,
              //                 textAlign: TextAlign.left,
              //                 style: TextStyle(
              //                   fontSize: 22,
              //                   color: _getColor(assessment.selectedValues[i].number),
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //     ],
              //   ),
            ),
          );
        }
    );
  }
}
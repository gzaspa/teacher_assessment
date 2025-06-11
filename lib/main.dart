import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_estimation/question.dart';
import 'package:teacher_estimation/question_model.dart';
import 'package:teacher_estimation/teacher_assessment_model.dart';

import 'data_provider.dart';
import 'http_service.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  final HttpService apiService = HttpService();
  List<dynamic> questionList = await apiService.fetchQuestions();
  List<QuestionModel> questions = questionList.map((json) => QuestionModel.fromJson(json)).toList();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TeacherAssessmentModel(questions)),
        ChangeNotifierProvider(create: (context) => DataProvider(questions: questions)),
      ],
      child:
        TeacherEstimationApp(questions: questions),
    ),
  );
}
// const List<String> questions = [
//   'Оцініть рівень додаткових знань, умінь та навичок, які Ви отримали після опанування цієї дисципліни',
//   'Оцініть рівень володіння викладачем навчальним матеріалом дисципліни',
//   'Оцініть рівень використання викладачем презентацій чи інших аудіовізуальних засобів під час проведення заняття з дисципліни',
  // 'Оцініть ступінь відкритості викладача та доступності його для спілкування під час проведення занять',
  // 'Оцініть ступінь об’єктивності, чесності та прозорості роботи викладача під час оцінювання Ваших знань або знань інших студентів',
  // 'Оцініть ступінь Вашого бажання і надалі проходити навчання з інших дисциплін у цього викладача',
  // 'Оцініть рівень культури мови викладача, чіткість його дикції, темп викладення матеріалу',
  // 'Оцініть ступінь творчого підходу і зацікавленості викладача до дисципліни, яку він викладає',
  // 'Оцініть рівень доброзичливості викладача і такту по відношенню до студентів',
  // 'Оцініть рівень забезпеченості дисципліни навчально-методичними матеріалами та інформаційними ресурсами',
  // 'Оцініть ступінь володіння викладача технологіями дистанційного навчання',
// ];

class TeacherEstimationApp extends StatefulWidget {
  const TeacherEstimationApp({super.key, required this.questions});

  final List<QuestionModel> questions;

  @override
  State<TeacherEstimationApp> createState() => TeacherEstimationAppState();
}

class TeacherEstimationAppState extends State<TeacherEstimationApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const InitialScreen(),
        for (var i = 0; i < widget.questions.length; i++)
          '/question$i': (context) => QuestionScreen(n: i + 1, question: widget.questions[i].question, items: widget.questions[i].choices),
        // '/question2': (context) => QuestionScreen(n: 2, question: dataProvider.questions[1].question, items: dataProvider.questions[1].choices),
        // '/question3': (context) => QuestionScreen(n: 3, question: dataProvider.questions[2].question, items: dataProvider.questions[2].choices),
        // '/question4': (context) => QuestionScreen(n: 4, question: questions[3], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        // '/question5': (context) => QuestionScreen(n: 5, question: questions[4], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        // '/question6': (context) => QuestionScreen(n: 6, question: questions[5], items: ['Дуже високий', 'Високий', 'Середній', 'Низький', 'Дуже низький']),
        // '/question7': (context) => QuestionScreen(n: 7, question: questions[6], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        // '/question8': (context) => QuestionScreen(n: 8, question: questions[7], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        // '/question9': (context) => QuestionScreen(n: 9, question: questions[8], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        // '/question10': (context) => QuestionScreen(n: 10, question: questions[9], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        // '/question11': (context) => QuestionScreen(n: 11, question: questions[10], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        '/confirmation': (context) => ConfirmScreen(),
      },
    );
  }
}

class AppScreen extends StatelessWidget {
  const AppScreen({super.key, required this.bodyElement});

  final Widget bodyElement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Оцінювання викладачів'),
        backgroundColor: Colors.blue.shade300,
      ),
      body: bodyElement,
    );
  }
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  void _moveToAssessment() {
    Navigator.of(context).pushNamed('/question0');
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
        bodyElement: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 200, bottom: 100, left: 10, right: 10),
              child: Text(
                'Оцініть професійні якості викладачів, які викладали чи викладають у Вас предмети',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.resolveWith((value) { return Colors.white;}),
                backgroundColor: WidgetStateProperty.resolveWith((value) { return Colors.blue;}),
              ),
              onPressed: _moveToAssessment,
              child: const Text('Почати', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
    );
  }
}

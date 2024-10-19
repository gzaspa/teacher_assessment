import 'package:flutter/material.dart';

void main() => runApp(TeacherEstimationApp());
const List<String> questions = [
  'Оцініть рівень додаткових знань, умінь та навичок, які Ви отримали після опанування цієї дисципліни',
  'Оцініть рівень володіння викладачем навчальним матеріалом дисципліни',
  'Оцініть рівень використання викладачем презентацій чи інших аудіовізуальних засобів під час проведення заняття з дисципліни',
  'Оцініть ступінь відкритості викладача та доступності його для спілкування під час проведення занять',
  'Оцініть ступінь об’єктивності, чесності та прозорості роботи викладача під час оцінювання Ваших знань або знань інших студентів',
  'Оцініть ступінь Вашого бажання і надалі проходити навчання з інших дисциплін у цього викладача',
  'Оцініть рівень культури мови викладача, чіткість його дикції, темп викладення матеріалу',
  'Оцініть ступінь творчого підходу і зацікавленості викладача до дисципліни, яку він викладає',
  'Оцініть рівень доброзичливості викладача і такту по відношенню до студентів',
  'Оцініть рівень забезпеченості дисципліни навчально-методичними матеріалами та інформаційними ресурсами',
  'Оцініть ступінь володіння викладача технологіями дистанційного навчання',
];

class TeacherEstimationApp extends StatefulWidget {
  const TeacherEstimationApp({Key? key}) : super(key: key);

  @override
  State<TeacherEstimationApp> createState() => TeacherEstimationAppState();
}

class TeacherEstimationAppState extends State<TeacherEstimationApp> {
  final List<int> _selectedValues = List.filled(questions.length, 4);

  List<int> get selectedValues => _selectedValues;

  void setSelectedValue(int index, int? value) {
    _selectedValues[index] = value!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const InitialScreen(),
        '/question1': (context) => QuestionScreen(n: 1, question: questions[0], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        '/question2': (context) => QuestionScreen(n: 2, question: questions[1], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        '/question3': (context) => QuestionScreen(n: 3, question: questions[2], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        '/question4': (context) => QuestionScreen(n: 4, question: questions[3], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        '/question5': (context) => QuestionScreen(n: 5, question: questions[4], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        '/question6': (context) => QuestionScreen(n: 6, question: questions[5], items: ['Дуже високий', 'Високий', 'Середній', 'Низький', 'Дуже низький']),
        '/question7': (context) => QuestionScreen(n: 7, question: questions[6], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        '/question8': (context) => QuestionScreen(n: 8, question: questions[7], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        '/question9': (context) => QuestionScreen(n: 9, question: questions[8], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        '/question10': (context) => QuestionScreen(n: 10, question: questions[9], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
        '/question11': (context) => QuestionScreen(n: 11, question: questions[10], items: ['Дуже добре', 'Добре', 'Нормально', 'Погано', 'Дуже погано']),
      },
    );
  }
}

class AppScreen extends StatefulWidget {
  const AppScreen({super.key, required this.bodyElement});

  final Widget bodyElement;

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Оцінювання викладачів'),
          backgroundColor: Colors.blue.shade300,
        ),
        body: widget.bodyElement,
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
    Navigator.of(context).pushNamed('/question1');
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

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.n, required this.question, required this.items});

  final int n;
  final String question;
  final List<String> items;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final GlobalKey<TeacherEstimationAppState> _appScreenWidgetKey = GlobalKey<TeacherEstimationAppState>();
  late List<int> selectedValues;

  void _moveToNextQuestion() {
    Navigator.of(context).pushNamed('/question${(widget.n + 1)}');
  }

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     if (_appScreenWidgetKey.currentState != null) {
  //       selectedValues = _appScreenWidgetKey.currentState!.selectedValues;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    int a = 9;
    return AppScreen(
      bodyElement: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Питання ${widget.n} ${a}',
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
                    value: 4 - i,
                    groupValue: _appScreenWidgetKey.currentState!.selectedValues[widget.n - 1],
                    onChanged: (int? value) {
                      setState(() {
                        _appScreenWidgetKey.currentState!.setSelectedValue(widget.n - 1, value);
                      });
                    },
                  ),
                ),
              const SizedBox(height: 30),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.resolveWith((value) { return Colors.white;}),
                  backgroundColor: WidgetStateProperty.resolveWith((value) { return Colors.blue;}),
                ),
                onPressed: _moveToNextQuestion,
                child: const Text('До наступного питання', style: TextStyle(fontSize: 22)),
              ),
            ],
          ),
        ),
    );
  }
}
import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

// void main(List<String> args) {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favourite food?',
        'answers': ['Pizza', 'Lasagna', 'Sushi', 'Sizzler'],
      },
      {
        'questionText': 'What\'s your favourite color?',
        'answers': ['Red', 'Green', 'Blue', 'Orange'],
      },
      {
        'questionText': 'What\'s your age?',
        'answers': ['Below 12', '12-18', '18-24', 'Above 2'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Little Quiz App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}

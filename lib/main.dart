import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

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
  final _questions = const [
    {
      'questionText': 'What\'s your favourite food?',
      'answers': [
        {'text': 'Pizza', 'score': 5},
        {'text': 'Lasagna', 'score': 2},
        {'text': 'Sushi', 'score': 4},
        {'text': 'Sizzler', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'Orange', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your age?',
      'answers': [
        {'text': 'Below 12', 'score': 5},
        {'text': '12-18', 'score': 4},
        {'text': '18-24', 'score': 3},
        {'text': 'Above 24', 'score': 2},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions.');
    } else {
      print('No more questions.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Little Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

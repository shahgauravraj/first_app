import 'package:flutter/material.dart';

// void main(List<String> args) {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}


class MyAppState extends State<MyApp> {

  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex += 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your name?',
      'What\'s your favourite color?',
      'What\'s your age?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Little Quiz App'),
        ),
        body: Column(
          children: [
            Text(
              questions[questionIndex],
            ),
            RaisedButton(
              child: Text('Answer1'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer2'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer3'),
              onPressed: answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

// Wigget Class
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// State Class
class _MyAppState extends State<MyApp> {
  // Properties
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answer': ['Red', 'Green', 'Yellow', 'Blue']
    },
    {
      'questionText': 'What\'s your favorite pet?',
      'answer': ['Cat', 'Turtle', 'Parrot', 'Owl']
    },
    {
      'questionText': 'What\'s your favorite town?',
      'answer': ['Toronto', 'New York', 'Los Angeles', 'Dublin']
    },
  ];

  var _questionIndex = 0;

  // Methods
  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(),
      ),
    );
  }
}

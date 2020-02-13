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
      'answer': [
        {'text': 'Red', 'score': 1},
        {'text': 'Green', 'score': 7},
        {'text': 'Yellow', 'score': 5},
        {'text': 'Blue', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favorite pet?',
      'answer': [
        {'text': 'Cat', 'score': 7},
        {'text': 'Turtle', 'score': 1},
        {'text': 'Parrot', 'score': 5},
        {'text': 'Owl', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favorite town?',
      'answer': [
        {'text': 'Toronto', 'score': 7},
        {'text': 'New York', 'score': 5},
        {'text': 'Los Angeles', 'score': 1},
        {'text': 'Dublin', 'score': 3}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  // Methods
  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

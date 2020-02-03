import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  var _questionIndex = 0;

  // Methods
  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answer'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(), // Answer
          ],
        ),
      ),
    );
  }
}

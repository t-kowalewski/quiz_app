import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetBtnHandler;

  // Getter
  String get resultText {
    String result;
    if (resultScore <= 4) {
      result = 'You\'re terrible :(';
    } else if (resultScore <= 13) {
      result = 'You\'re average..';
    } else {
      result = 'You\'re cool !!!';
    }
    return result;
  }

  Result(this.resultScore, this.resetBtnHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultText,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            textColor: Colors.blue,
            onPressed: resetBtnHandler,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './0.1global_variables.dart';
import './1Assessment.dart';
import '1.1Question.dart';

class Result extends StatelessWidget {
  final List<String> results;

  const Result({required this.results});

  @override
  Widget build(BuildContext context) {
    String resultText = '';
    for (int i = 0; i < results.length; i++) {
      Question question = questions[i];
      String answer = results[i];
      resultText += '\n$answer\n\n';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Assessment Results'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              resultText,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}

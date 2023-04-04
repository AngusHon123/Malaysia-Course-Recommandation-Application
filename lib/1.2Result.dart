import 'package:flutter/material.dart';
import './0.1global_variables.dart';
import './1Assessment.dart';
import '1.1Question.dart';
import 'package:fl_chart/fl_chart.dart';

class Result extends StatelessWidget {
  final List<String> assessmentAnswerByUser;
  final List<String> resultStrings;
  /* final String reaslisticValue;
  final String investigativeValue;
  final String artisticValue;
  final String socialValue;
  final String enterprisingValue;
  final String conventionalValue; */

  const Result({
    required this.assessmentAnswerByUser,
    required this.resultStrings,
    /* required this.reaslisticValue,
    required this.investigativeValue,
    required this.artisticValue,
    required this.socialValue,
    required this.enterprisingValue,
    required this.conventionalValue, */
  });

  @override
  Widget build(BuildContext context) {
    String resultText = '';
    /* for (int i = 0; i < assessmentAnswerByUser.length; i++) {
      Question question = questions[i];
      String answer = assessmentAnswerByUser[i];
      resultText += '\n$answer\n\n';
    } */

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
      body: ListView(
        children: [
          Container(
            child: RadarChart(
              RadarChartData(
                dataSets: [
                  RadarDataSet(
                    dataEntries: [
                      RadarEntry(value: 2),
                      RadarEntry(value: 3),
                      RadarEntry(value: 4),
                      RadarEntry(value: 5),
                      RadarEntry(value: 1),
                      RadarEntry(value: 2),
                    ],
                  ),
                ],
              ),
              swapAnimationDuration: Duration(milliseconds: 50), // Optional
              swapAnimationCurve: Curves.linear, // Optional
            ),
          ),
          Container(
            child: Text('sssssssssssssss'),
          ),
        ],
      ),
    );
  }
}

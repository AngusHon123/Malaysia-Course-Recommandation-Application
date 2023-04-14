import 'package:flutter/material.dart';
import './0.1global_variables.dart';
import './1Assessment.dart';
import '1.1Question.dart';
import 'package:fl_chart/fl_chart.dart';
import './1.4RadarChart.dart';
import './1.5DBHelper.dart';

class Result extends StatelessWidget {
  final List<String> assessmentAnswerByUser;
  final List<String> resultStrings;
  final List<String> categories;

  const Result({
    required this.assessmentAnswerByUser,
    required this.resultStrings,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    String resultText = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Assessment Results'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              DatabaseHelper dbHelper = DatabaseHelper();
              int result = await dbHelper.insertData("John Doe", 30);
              print("New record inserted with ID: $result");
              final snackBar = SnackBar(
                content: Text('Saved'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Text('Save'),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('This is your graph'),
                SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [RadarChartWidget(resultStrings: resultStrings)],
            ),
          ),
          Text('Your top 3 categories/themes are: ' +
              categories[0] +
              ',' +
              categories[1] +
              ',' +
              categories[2] +
              '.'),
        ],
      ),
    );
  }
}

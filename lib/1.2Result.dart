import 'package:flutter/material.dart';
import './0.1global_variables.dart';
import './1Assessment.dart';
import '1.1Question.dart';
import 'package:fl_chart/fl_chart.dart';
import './1.4RadarChart.dart';
import './1.5DBHelper.dart';
import './2History.dart';

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
              await DBHelper.insert('mytable', {
                'name': categories[0],
                'age': '32',
                'reaslisticString': resultStrings[0] = '2'.toString(),
                'investigativeString': resultStrings[1] = '3'.toString(),
                'artisticString': resultStrings[2] = '4'.toString(),
                'socialString': resultStrings[3] = '5'.toString(),
                'enterprisingString': resultStrings[4] = '6'.toString(),
                'conventionalString': resultStrings[5] = '7'.toString(),
                'categories1': categories[0],
                'categories2': categories[1],
                'categories3': categories[2],
              });
              final snackBar = SnackBar(content: Text('Saved'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              await Future.delayed(Duration(seconds: 1));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
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

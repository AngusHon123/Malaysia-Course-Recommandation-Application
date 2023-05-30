import 'package:flutter/material.dart';
import './0.1global_variables.dart';
import './1Assessment.dart';
import '1.1Question.dart';
import 'package:fl_chart/fl_chart.dart';
import './1.4RadarChart.dart';
import './1.5DBHelper.dart';
import './2History.dart';

class Review extends StatelessWidget {
  final List<String> resultStrings;
  final List<String> categories;

  const Review({
    required this.resultStrings,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results Review'),
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
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => print(categories[1].toString()),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadarChart extends StatelessWidget {
  final List<RadarSeries> series;
  final List<String> categories;
  final List<Color>? colors;

  RadarChart({required this.series, required this.categories, this.colors});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
            widget: Container(
              child: Text(
                'Radar Chart',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            angle: 0,
            radius: '90%'),
      ],
      series: series,
      legend: Legend(isVisible: true),
      palette: colors ?? SfChartTheme.of(context).palette,
    );
  }
}

class RadarSeries extends CircularSeries {
  final List<double> data;

  RadarSeries({required this.data, required String name, required Color color})
      : super(
            dataSource: _getData(data),
            xValueMapper: (dynamic, _) => dynamic['category'],
            yValueMapper: (dynamic, _) => dynamic['value'],
            pointColorMapper: (dynamic, _) => color,
            name: name);

  static List<Map<String, dynamic>> _getData(List<double> data) {
    List<Map<String, dynamic>> result = [];

    for (int i = 0; i < data.length; i++) {
      result.add({'category': i.toString(), 'value': data[i]});
    }

    return result;
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RadarChart(
            categories: [
              'Category 1',
              'Category 2',
              'Category 3',
              'Category 4',
              'Category 5',
              'Category 6'
            ],
            series: [
              RadarSeries(
                  data: [20, 50, 80, 40, 60, 30],
                  name: 'Series 1',
                  color: Colors.blue),
              RadarSeries(
                  data: [50, 30, 40, 90, 70, 20],
                  name: 'Series 2',
                  color: Colors.red),
              RadarSeries(
                  data: [80, 40, 20, 50, 30, 70],
                  name: 'Series 3',
                  color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}

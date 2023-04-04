import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radar Chart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const ticks = [7, 14, 21, 28, 45];
    /* const ticks = [100, 80, 60, 40, 20, 0]; */
    var features = ["AA", "BB", "CC", "DD", "EE", "FF"];
    var data = [
      [21.0, 7, 14, 5, 16, 15]
    ];

    features = features.sublist(0, 6);
/*     data = data.map((graph) => graph.sublist(0, 6)).toList(); */

    return Scaffold(
      appBar: AppBar(
        title: Text('Radar Chart Example'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: RadarChart.light(
                ticks: ticks,
                features: features,
                data: data,
                reverseAxis: false,
                useSides: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

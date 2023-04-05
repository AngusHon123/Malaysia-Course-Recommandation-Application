import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

class RadarChart extends StatelessWidget {
  const RadarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const ticks = [20, 40, 60, 80, 100];

    var features = ["AA", "BB", "CC", "DD", "EE", "FF"];
    var data = [
      [100.0, 80.0, 75.0, 60.0, 50.0, 10.0]
    ];

    features = features.sublist(0, 6);

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

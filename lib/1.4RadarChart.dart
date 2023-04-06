import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

class RadarChartWidget extends StatelessWidget {
  final List<String> resultStrings;

  const RadarChartWidget({
    required this.resultStrings,
  });

  @override
  Widget build(BuildContext context) {
    const ticks = [20, 40, 60, 80, 100];
    var features = [
      "REALISTIC ",
      "INVESTIGATIVE ",
      "ARTISTIC",
      "SOCIAL",
      "ENTERPRISING ",
      "CONVENTIONAL"
    ];
    var data = [resultStrings.map((value) => num.parse(value)).toList()];

    print(data);
    features = features.sublist(0, 6);

    return Expanded(
      child: RadarChart.light(
        ticks: ticks,
        features: features,
        data: data,
        reverseAxis: false,
        useSides: false,
      ),
    );
  }
}

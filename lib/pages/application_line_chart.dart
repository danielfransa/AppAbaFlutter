import 'package:aba_app/data/protocol_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ApplicationLineChart extends StatelessWidget {
  final List<ProtocolData> points;
  const ApplicationLineChart(this.points, {super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(lineBarsData: [
      LineChartBarData(
          barWidth: 2,
          color: Colors.black,
          spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
          dotData: const FlDotData(show: true)),
    ]));
  }
}

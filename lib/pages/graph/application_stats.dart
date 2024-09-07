import 'package:aba_app/data/application_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ApplicationStats extends StatelessWidget {
  final List<ApplicationData> data;
  const ApplicationStats(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    // Convert "Sucesso" to 1 and "Falha" to 0 for y-axis values
    final List<FlSpot> spots = data.map((entry) {
      double yValue = entry.y == 'Sucesso' ? 1.0 : 0.0;
      return FlSpot(entry.x, yValue);
    }).toList();

    // Create categorical labels for x-axis
    final List<String> xLabels = data.map((entry) {
      return 'Resultado ${entry.x.toInt() + 1}';
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grafico Aplicações'),
      ),
      body: Column(
        children: [
          const Text(
            'Gráfico',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      barWidth: 2,
                      color: Colors.black,
                      spots: spots,
                      dotData: const FlDotData(show: true),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        reservedSize: 60,
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          String valor;
                          switch (value) {
                            case 0.0:
                              valor = 'False';
                            case 1.0:
                              valor = 'Sucesso';
                            default:
                              valor = '';
                          }
                          return Text(
                            valor,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(axisNameWidget: Text('')),
                    rightTitles: const AxisTitles(axisNameWidget: Text('')),
                  ),
                  gridData: const FlGridData(
                    show: true, // essa é a linha de grade vertical
                    drawHorizontalLine: true, // essa é a linha horizontal
                    horizontalInterval:
                        0.2, // esse é o intervalo da linha horizontal
                  ),
                  borderData: FlBorderData(
                    border: const Border(
                      left: BorderSide(color: Colors.black, width: 1),
                      top: BorderSide(color: Colors.black, width: 1),
                      right: BorderSide(color: Colors.black, width: 1),
                      bottom: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  minX: 0,
                  maxX: data.length - 1.toDouble(),
                  minY: 0,
                  maxY: 1,
                  baselineY: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

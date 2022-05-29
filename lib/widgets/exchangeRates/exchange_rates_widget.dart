import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExchangeRatesWidget extends StatelessWidget {
  final List<Color> colors = [
    Colors.orange,
    Colors.lightBlue,
    Colors.lightGreen,
  ];

  ExchangeRatesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).cardColor;
    Color lineColor = Theme.of(context).backgroundColor;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildChart(backgroundColor, lineColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('USD'),
                Text('EUR'),
                Text('RUB'),
              ],
            )
          ],
        ),
      ),
    );
  }

  AspectRatio buildChart(Color backgroundColor, Color lineColor) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              show: true,
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  reservedSize: 42,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: lineColor,
                width: 1,
              ),
            ),
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 11,
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 1,
              verticalInterval: 0.2,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: lineColor,
                  strokeWidth: 0.5,
                );
              },
            ),
            lineBarsData: [
              createLineChartBarData(
                [
                  [0, 3],
                  [2.6, 2],
                  [4.9, 5],
                  [6.8, 3.1],
                  [8, 4],
                  [9.5, 3],
                  [11, 4]
                ],
                colors[0],
              ),
              createLineChartBarData(
                [
                  [0, 4],
                  [2.6, 5],
                  [4.9, 7.53],
                  [6.8, 3.5],
                  [8, 3],
                  [9.5, 2],
                  [11, 1]
                ],
                colors[1],
              ),
              createLineChartBarData(
                [
                  [0, 1],
                  [2.6, 6],
                  [4.9, 1],
                  [6.8, 1],
                  [8, 4],
                  [9.5, 5],
                  [11, 5]
                ],
                colors[2],
              )
            ],
          ),
        ),
      ),
    );
  }

  LineChartBarData createLineChartBarData(
      List<List<double>> spots, Color color) {
    return LineChartBarData(
      spots: spots.map((values) => FlSpot(values[0], values[1])).toList(),
      isCurved: true,
      color: color,
      barWidth: 5,
      dotData: FlDotData(show: true),
    );
  }
}

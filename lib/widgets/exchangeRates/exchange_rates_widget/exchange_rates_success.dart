import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kit_utilities/blocs/states/exchange_retes_state.dart';

class ExhangeRatesSuccess extends StatelessWidget {
  static List<Color> colors = [
    Colors.orange,
    Colors.lightBlue,
    Colors.lightGreen,
  ];

  final ExchangeRatesState state;
  final Function reload;

  const ExhangeRatesSuccess({
    Key? key,
    required this.state,
    required this.reload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).cardColor;
    Color lineColor = Theme.of(context).backgroundColor;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                reload();
              },
              icon: const Icon(Icons.restart_alt_rounded),
            )
          ],
        ),
        _buildChart(backgroundColor, lineColor),
        _buildLegend(),
      ],
    );
  }

  Widget _buildChart(Color backgroundColor, Color lineColor) {
    double minY, maxY = 0.0;

    var allRates =
        state.rates.values.reduce((value, element) => [...value, ...element]);
    minY = allRates.reduce(min).floorToDouble();
    maxY = allRates.reduce(max).ceilToDouble();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AspectRatio(
        aspectRatio: 1.7,
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
                  getTitlesWidget: (value, meta) {
                    DateTime date =
                        state.startDate.add(Duration(days: value.toInt()));
                    return Text(
                        DateFormat(DateFormat.NUM_MONTH_DAY).format(date));
                  },
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
            maxX: state.endDate.difference(state.startDate).inDays.toDouble(),
            minY: minY,
            maxY: maxY,
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: lineColor,
                  strokeWidth: 0.5,
                );
              },
            ),
            lineBarsData: _getLineChartBarData(state.rates.values.toList()),
            lineTouchData: LineTouchData(
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                fitInsideHorizontally: true,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<LineChartBarData> _getLineChartBarData(List<List<double>> rates) {
    int index = 0;
    return rates
        .map((e) => _createLineChartBarData(e, colors[index++]))
        .toList();
  }

  LineChartBarData _createLineChartBarData(List<double> spots, Color color) {
    double number = 0;
    return LineChartBarData(
      spots: spots.map((value) => FlSpot(number++, value)).toList(),
      isCurved: true,
      color: color,
      barWidth: 3.5,
      dotData: FlDotData(show: true),
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: state.rates.keys
          .map((key) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 20.0,
                    height: 5.0,
                    color: colors[state.rates.keys.toList().indexOf(key)],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(key),
                  )
                ],
              ))
          .toList(),
    );
  }
}

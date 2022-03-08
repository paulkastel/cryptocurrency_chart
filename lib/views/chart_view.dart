import 'package:cryptochart/network/dtos/data_dto.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartView extends StatelessWidget {
  const ChartView(this.data, {Key? key}) : super(key: key);

  final List<DataDto> data;

  bool get _isChangePositive => data.first.open - data.last.open < 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                data.length,
                (index) => FlSpot(index.toDouble(), data[index].open.toDouble()),
              ),
              dotData: FlDotData(show: false),
              barWidth: 1,
              colors: _isChangePositive ? [Colors.green] : [Colors.red],
              belowBarData: BarAreaData(
                show: true,
                colors: _isChangePositive
                    ? [Colors.green.withOpacity(0.24), Colors.green.withOpacity(0)]
                    : [Colors.red.withOpacity(0.24), Colors.red.withOpacity(0)],
                gradientFrom: const Offset(0.5, 0),
                gradientTo: const Offset(0.5, 1),
              ),
            ),
          ],
          titlesData: FlTitlesData(
            rightTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(showTitles: false),
            leftTitles: SideTitles(showTitles: false),
          ),
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor:
                  _isChangePositive ? Colors.green.withOpacity(0.5) : Colors.red.withOpacity(0.5),
              fitInsideHorizontally: true,
              getTooltipItems: (tooltipSpots) => tooltipSpots
                  .map(
                    (spot) => LineTooltipItem(
                      spot.y.toStringAsFixed(4),
                      Theme.of(context).textTheme.subtitle1!,
                    ),
                  )
                  .toList(),
            ),
          ),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: data.last.open.toDouble(),
                color: Colors.grey,
                strokeWidth: 2,
                dashArray: [2, 5],
              )
            ],
          ),
        ),
      ),
    );
  }
}

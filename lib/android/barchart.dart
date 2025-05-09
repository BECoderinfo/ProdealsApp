import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({super.key});

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final Color color5 = const Color.fromRGBO(129, 209, 255, 1);
  final Color color = const Color.fromRGBO(60, 129, 194, 1);

  @override
  Widget build(BuildContext context) {
    final List<double> weeklySummary = [10.4, 20.0, 30.3, 40.4, 50.5, 60.6];
    return Center(
      child: SizedBox(
        height: 300,
        width: 350,
        child: MyBarChart(
          weeklySummary: weeklySummary,
        ),
      ),
    );
  }
}

class MyBarChart extends StatelessWidget {
  final List<double> weeklySummary;

  const MyBarChart({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    final BarData myBarChart = BarData(
      janAmount: weeklySummary[0],
      febAmount: weeklySummary[1],
      marAmount: weeklySummary[2],
      aprAmount: weeklySummary[3],
      mayAmount: weeklySummary[4],
      junAmount: weeklySummary[5],
    );

    myBarChart.initializeBarData();

    return BarChart(
      BarChartData(
        extraLinesData: ExtraLinesData(
          extraLinesOnTop: true,
          horizontalLines: [
            HorizontalLine(
              y: 70,
              strokeCap: StrokeCap.round,
              color: const Color(0xFF3FC18D),
              strokeWidth: 15,
            ),
          ],
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              width: 10,
              color: Color(0xFFE2DEDE),
            ),
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
            ),
          ),
        ),
        maxY: 80,
        minY: 0,
        barGroups: myBarChart.barData.map((data) {
          return BarChartGroupData(
            x: data.x,
            barRods: [
              BarChartRodData(
                toY: data.y,
                color: data.color,
                borderRadius: BorderRadius.circular(2),
                width: 30,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class ChartData {
  ChartData({
    required this.x,
    required this.y,
    required this.color,
  });

  final int x;
  final double y;
  final Color color;
}

class BarData {
  final double janAmount;
  final double febAmount;
  final double marAmount;
  final double aprAmount;
  final double mayAmount;
  final double junAmount;

  BarData({
    required this.janAmount,
    required this.febAmount,
    required this.marAmount,
    required this.aprAmount,
    required this.mayAmount,
    required this.junAmount,
  });

  List<ChartData> barData = [];

  void initializeBarData() {
    barData = [
      ChartData(
          x: 0, y: janAmount, color: const Color.fromRGBO(129, 209, 255, 1)),
      ChartData(
          x: 1, y: febAmount, color: const Color.fromRGBO(60, 129, 194, 1)),
      ChartData(
          x: 2, y: marAmount, color: const Color.fromRGBO(129, 209, 255, 1)),
      ChartData(
          x: 3, y: aprAmount, color: const Color.fromRGBO(60, 129, 194, 1)),
      ChartData(
          x: 4, y: mayAmount, color: const Color.fromRGBO(129, 209, 255, 1)),
      ChartData(
          x: 5, y: junAmount, color: const Color.fromRGBO(60, 129, 194, 1)),
    ];
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 43, 40, 40),
    fontWeight: FontWeight.bold,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Jan', style: style);
      break;
    case 1:
      text = const Text('Feb', style: style);
      break;
    case 2:
      text = const Text('Mar', style: style);
      break;
    case 3:
      text = const Text('Apr', style: style);
      break;
    case 4:
      text = const Text('May', style: style);
      break;
    case 5:
      text = const Text('Jun', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 8.0,
    child: text,
  );
}

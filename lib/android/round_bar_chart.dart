import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class simplebar extends StatefulWidget {
  const simplebar({super.key});

  @override
  State<simplebar> createState() => _simplebarState();
}

class _simplebarState extends State<simplebar> {
  List<double> weeklysumary = [
    20.4,
    34.0,
    54.3,
    50,
    60.4,
    30.5,
    34.6,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: SizedBox(
          height: 130,
          width: 150,
          child: mybarchart(
            weeklysumary: weeklysumary,
          )),
    );
  }
}

class mybarchart extends StatelessWidget {
  final weeklysumary;
  const mybarchart({super.key, required this.weeklysumary});
  @override
  Widget build(BuildContext context) {
    bardata mybarchart = bardata(
      Janamount: weeklysumary[0],
      febamount: weeklysumary[1],
      maramount: weeklysumary[2],
      apramount: weeklysumary[3],
      mayamount: weeklysumary[4],
      junamount: weeklysumary[5],
      julamount: weeklysumary[6],
    );

    mybarchart.initializebardata();

    return BarChart(BarChartData(
        gridData: FlGridData(show: false),
        borderData: FlBorderData(
          show: false,
        ),
        titlesData: const FlTitlesData(
            show: true,
            rightTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
            )),
            leftTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
            )),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
            ))),
        maxY: 80,
        minY: 0,
        barGroups: mybarchart.Bardata.map((data) =>
            BarChartGroupData(x: data.x, barRods: [
              BarChartRodData(
                backDrawRodData:
                    BackgroundBarChartRodData(show: true, color: const Color.fromARGB(255, 216, 214, 214),toY: 80),
                toY: data.y,
                color: Color.fromARGB(255, 51, 114, 173),
                borderRadius: BorderRadius.circular(10),
                width: 10,
              ),
            ])).toList()));
  }
}

class ChartData {
  ChartData({
    required this.x,
    required this.y,
  
  });
  final int x;
  final double y;

}

class bardata {
  final double Janamount;
  final double febamount;
  final double maramount;
  final double apramount;
  final double mayamount;
  final double junamount;
  final double julamount;

  bardata({
    required this.Janamount,
    required this.febamount,
    required this.maramount,
    required this.apramount,
    required this.mayamount,
    required this.junamount,
    required this.julamount,
  });

  List<ChartData> Bardata = [];

  void initializebardata() {
    Bardata = [
      ChartData(x: 0, y: Janamount, ),
      ChartData(x: 1, y: febamount, ),
      ChartData(x: 2, y: maramount, ),
      ChartData(x: 3, y: apramount, ),
      ChartData(x: 4, y: mayamount, ),
      ChartData(x: 5, y: junamount, ),
      ChartData(x: 5, y: julamount, ),
    ];
  }
}

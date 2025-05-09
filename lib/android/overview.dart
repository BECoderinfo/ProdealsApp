import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'Area.dart';
import 'barchart.dart';

class overview extends StatefulWidget {
  const overview({super.key});

  @override
  State<overview> createState() => _overviewState();
}

class _overviewState extends State<overview> {
  final List<ChartData> chartData = [
    ChartData('Pizza', 58, Color(0xFF3C81C2)),
    ChartData('Burger', 21, Color(0xFFF3742D)),
    ChartData('Shake', 22, Color(0xFF81D1FF)),
  ];

  @override
  Widget build(BuildContext context) {
    Color color7 = Color(0xFF6BB5FA); // Blue color
    Color color8 = Color(0xFFFFFFFF); // White color
    Color color6 = Color(0xFFF3742D);
    Color color9 = Color(0xFFD0DFEE);
    Color color5 = Color(0xFF81D1FF);
    Color color = Color(0xFF3C81C2);
    Color color1 = Color(0xFFDAA520);
    Color color2 = Color(0xFFFCE5AC);
    Color color3 = Color(0xFF32801C);

    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    Color? mixedColor = Color.lerp(color7, color8, 0.5);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          Image.asset(
            'assets/images/Rectangle 5021.png',
            width: 60,
            height: 60,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Text(
              '   OVERVIEW',
              style: GoogleFonts.openSans(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            Gap(20),
            Center(
              child: Container(
                width: wid / 1.08,
                height: hei / 5.02,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          blurStyle: BlurStyle.normal,
                          blurRadius: 0,
                          spreadRadius: 0)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10),
                    Text(
                      '   Total Orders',
                      style: GoogleFonts.openSans(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              '  2,400',
                              style: GoogleFonts.openSans(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Gap(10),
                            Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: mixedColor,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: const Center(
                                  child: Text(
                                    '13.6%',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 51, 114, 173),
                                        fontWeight: FontWeight.w700),
                                  ),
                                )),
                          ],
                        ),
                        areachart(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Gap(20),
            Center(
              child: Container(
                width: wid / 1.08,
                height: hei / 5.02,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          blurStyle: BlurStyle.normal,
                          blurRadius: 0,
                          spreadRadius: 0)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10),
                    Text(
                      '   Product Share',
                      style: GoogleFonts.openSans(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              ' 34.6%',
                              style: GoogleFonts.openSans(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Gap(10),
                            Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 142, 170, 134),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: const Center(
                                  child: Text(
                                    '13.6%',
                                    style: TextStyle(
                                        color: Color(0xFF32801C),
                                        fontWeight: FontWeight.w700),
                                  ),
                                )),
                          ],
                        ),
                        Container(
                          width: wid / 2.40,
                          height: hei / 6.08,
                          child: SfRadialGauge(
                            axes: [
                              RadialAxis(
                                  showLabels: false,
                                  showAxisLine: false,
                                  showTicks: false,
                                  startAngle: 180,
                                  endAngle: 0,
                                  interval: 100,
                                  canScaleToFit: true,
                                  ranges: [
                                    GaugeRange(
                                        startValue: 0,
                                        endValue: 30,
                                        color: color,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        startWidth: 0.26,
                                        endWidth: 0.26),
                                    GaugeRange(
                                      startValue: 30,
                                      sizeUnit: GaugeSizeUnit.factor,
                                      startWidth: 0.26,
                                      endWidth: 0.26,
                                      endValue: 100,
                                      color: color9,
                                    ),
                                  ],
                                  annotations: const <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        axisValue: 50,
                                        positionFactor: 0.1,
                                        widget: Text(
                                          'Target 55%',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ))
                                  ])
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Gap(20),
            Center(
              child: Container(
                width: wid / 1.08,
                height: hei / 5.02,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          blurStyle: BlurStyle.normal,
                          blurRadius: 0,
                          spreadRadius: 0)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10),
                    Text(
                      '   Market Share',
                      style: GoogleFonts.openSans(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Gap(10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: chartData.map((data) {
                              return Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: data.color,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text('${data.x}  ${data.y}%'),
                                ],
                              );
                            }).toList(),
                          ),
                          SizedBox(width: 30),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 230,
                                height: 142,
                                child: SfCircularChart(
                                  series: <CircularSeries>[
                                    DoughnutSeries<ChartData, String>(
                                      dataSource: chartData,
                                      pointColorMapper: (ChartData data, _) =>
                                          data.color,
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y,
                                      innerRadius: '80%',
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '100k',
                                style: GoogleFonts.openSans(
                                  textStyle:
                                      Theme.of(context).textTheme.displayLarge,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(20),
            Center(
              child: Container(
                  width: wid / 1.08,
                  height: hei / 2.46,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            blurStyle: BlurStyle.normal,
                            blurRadius: 0,
                            spreadRadius: 0)
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' Sales Chart ',
                            style: GoogleFonts.openSans(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Text(
                            '₹ 9,45,570  ',
                            style: GoogleFonts.openSans(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                      BarChartWidget(),
                    ],
                  ),),
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}

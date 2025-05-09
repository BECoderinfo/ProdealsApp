import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../android/Area.dart';
import '../../android/barchart.dart';

class overview_ios extends StatefulWidget {
  const overview_ios({super.key});

  @override
  State<overview_ios> createState() => _overview_iosState();
}

class _overview_iosState extends State<overview_ios> {
  String? countryValue;

  List<String> country = ["Yearly", "Monthly", "Weekly", "Daily"];
  final List<ChartData> chartData = [
    ChartData('Pizza', 58, const Color(0xFF3C81C2)),
    ChartData('Burger', 21, const Color(0xFFF3742D)),
    ChartData('Shake', 22, const Color(0xFF81D1FF)),
  ];

  @override
  Widget build(BuildContext context) {
    Color color7 = const Color(0xFF6BB5FA); // Blue color
    Color color8 = const Color(0xFFFFFFFF); // White color
    Color color6 = const Color(0xFFF3742D);
    Color color9 = const Color(0xFFD0DFEE);
    Color color5 = const Color(0xFF81D1FF);
    Color color = const Color(0xFF3C81C2);
    Color color1 = const Color(0xFFDAA520);
    Color color2 = const Color(0xFFFCE5AC);
    Color color3 = const Color(0xFF32801C);
    Color? mixedColor = Color.lerp(color7, color8, 0.5);
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
        backgroundColor: const Color(0xfff9f9f9),
        child: Column(
          children: [
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed('/overview_ios');
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile_image.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'OVERVIEW',
                          style: GoogleFonts.openSans(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      const Gap(20),
                      Center(
                        child: Container(
                          width: wid / 1.08,
                          height: 190,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    blurStyle: BlurStyle.normal,
                                    blurRadius: 0,
                                    spreadRadius: 0.2)
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(10),
                              Text(
                                '   Total Orders',
                                style: GoogleFonts.openSans(
                                  textStyle:
                                      Theme.of(context).textTheme.displayLarge,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Gap(10),
                                  Column(
                                    children: [
                                      Text(
                                        '  2,400',
                                        style: GoogleFonts.openSans(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                      const Gap(10),
                                      Container(
                                          width: 100,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: mixedColor,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              '13.6%',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 51, 114, 173),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )),
                                    ],
                                  ),
                                  const areachart(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(20),
                      Center(
                        child: Container(
                          width: wid / 1.08,
                          height: 180,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    blurStyle: BlurStyle.normal,
                                    blurRadius: 0,
                                    spreadRadius: 0.2)
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(10),
                              Text(
                                '   Product Share',
                                style: GoogleFonts.openSans(
                                  textStyle:
                                      Theme.of(context).textTheme.displayLarge,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Gap(10),
                                  Column(
                                    children: [
                                      Text(
                                        ' 34.6%',
                                        style: GoogleFonts.openSans(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                      const Gap(10),
                                      Container(
                                          width: 100,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 142, 170, 134),
                                            borderRadius:
                                                BorderRadius.circular(40),
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
                                    width: 200,
                                    height: hei / 6.10,
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
                                                  sizeUnit:
                                                      GaugeSizeUnit.factor,
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                      const Gap(20),
                      Center(
                        child: Container(
                          width: wid / 1.08,
                          height: 180,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  blurStyle: BlurStyle.normal,
                                  blurRadius: 0,
                                  spreadRadius: 0)
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(10),
                              Text(
                                '   Market Share',
                                style: GoogleFonts.openSans(
                                  textStyle:
                                      Theme.of(context).textTheme.displayLarge,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Gap(10),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: chartData.map((data) {
                                        return Row(
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: data.color,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text('${data.x}  ${data.y}%'),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                    const SizedBox(width: 20),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          width: 180,
                                          height: 140,
                                          child: SfCircularChart(
                                            series: <CircularSeries>[
                                              DoughnutSeries<ChartData, String>(
                                                dataSource: chartData,
                                                pointColorMapper:
                                                    (ChartData data, _) =>
                                                        data.color,
                                                xValueMapper:
                                                    (ChartData data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (ChartData data, _) =>
                                                        data.y,
                                                innerRadius: '80%',
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          '100k',
                                          style: GoogleFonts.openSans(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
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
                      const Gap(20),
                      Center(
                        child: Container(
                            width: wid / 1.08,
                            height: 350,
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
                                const Gap(10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ' Sales Chart ',
                                      style: GoogleFonts.openSans(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    Text(
                                      '₹ 9,45,570  ',
                                      style: GoogleFonts.openSans(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                //                       Row(
                                //   children: [
                                //     Gap(16),
                                //     Container(
                                //                     height: 30,
                                //                     width: 100,
                                //                     padding: const EdgeInsets.symmetric(horizontal: 10),
                                //                     decoration: BoxDecoration(
                                //                     color: color2,
                                //                       borderRadius: BorderRadius.circular(10),
                                //                     ),
                                //                     child: DropdownButton<String>(
                                //                       value: countryValue,
                                //                       icon: Icon(Icons.keyboard_arrow_down,size: 14,),
                                //                       isExpanded: true,
                                //                       underline: SizedBox(),
                                //                       style: TextStyle(color: Colors.black, fontSize: 16),
                                //                       onChanged: (newValue) {
                                //                         setState(() {
                                //                           countryValue = newValue;
                                //                         });
                                //                       },
                                //                       items: country.map((valueItem) {
                                //                         return DropdownMenuItem<String>(
                                //                           value: valueItem,
                                //                           child: Text(valueItem),
                                //                         );
                                //                       }).toList(),
                                //                     ),
                                //                   ),
                                //   ],
                                // ),
                                const BarChartWidget(),
                              ],
                            )),
                      ),
                      const Gap(20),
                    ],
                  ),
                ))
          ],
        ));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../android/barchart.dart';
import '../../android/round_bar_chart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Expanded(
            flex: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  onPressed: () {
                    _innerDrawerKey.currentState
                        ?.toggle(direction: InnerDrawerDirection.end);
                  },
                  child: const Icon(
                    CupertinoIcons.bars,
                    size: 30,
                    color: CupertinoColors.black,
                  ),
                ),
                Image.asset(
                  'assets/images/Rectangle 5021 (1).png',
                  width: 80,
                  height: 80,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: InnerDrawer(
              key: _innerDrawerKey,
              onTapClose: false,
              swipe: false,
              tapScaffoldEnabled: true,
              offset: const IDOffset.only(bottom: 0.0, right: 0.5),
              scale: const IDOffset.horizontal(1.0),
              borderRadius: 0,
              rightChild: buildDrawerMenu(),
              scaffold: buildMainContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrawerMenu() {
    return Container(
      height: 500,
      width: 300,
      decoration: const BoxDecoration(color: Color(0xFFDAA520)),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Gap(40),
          Row(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/image 56.png"))),
              ),
              const Gap(10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "LA Pino'z Pizza",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  Gap(4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 14,
                      ),
                      Text(
                        "Varachha",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Gap(4),
                  Row(
                    children: [
                      Text(
                        "4.9",
                        style: TextStyle(fontSize: 14),
                      ),
                      Gap(5),
                      Icon(
                        Icons.star,
                        color: Colors.black,
                        size: 16,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.black,
                        size: 16,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.black,
                        size: 16,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.black,
                        size: 16,
                      ),
                      Icon(
                        Icons.star_half,
                        color: Colors.black,
                        size: 16,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          const Gap(30),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'MANAGE PROFILE',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'MANAGE OFFERS',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'TOTAL ORDERS',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'TOTAL EARNINGS',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'TOTAL REDEEMED',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'ACTIVE OFFERS',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'QR CODE',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
          const Gap(20),
          Row(
            children: [
              Text(
                'SETTINGS',
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Divider(
            indent: 0,
            endIndent: 0,
            color: Colors.black,
            thickness: 0.2,
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'ABOUT US',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'TERMS & CONDITION',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'PRIVACY POLICY',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
          const Gap(30),
        ],
      ),
    );
  }

  Widget buildMainContent() {
    Color color7 = const Color(0xFF6BB5FA); // Blue color
    Color color8 = const Color(0xFFFFFFFF); // White color
    Color color9 = const Color(0xFFD0DFEE);
    Color color = const Color(0xFF3C81C2);
    Color color2 = const Color(0xFFFCE5AC);
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    Color? mixedColor = Color.lerp(color7, color8, 0.5);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'TOTAl EARNINGS',
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
                height: hei / 3.50,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurStyle: BlurStyle.normal,
                        blurRadius: 0,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(10),
                    Text(
                      'Revenue',
                      style: GoogleFonts.openSans(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 190,
                          width: 400,
                          child: SfRadialGauge(
                            axes: [
                              RadialAxis(
                                showLabels: false,
                                startAngle: 180,
                                endAngle: 0,
                                interval: 100,
                                canScaleToFit: true,
                                minimum: 0,
                                maximum: 100,
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Gap(60),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'Total Revenue',
                                                style: GoogleFonts.openSans(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                              const Gap(2),
                                              Text(
                                                'Missed',
                                                style: GoogleFonts.openSans(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Gap(5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                '  ₹ 9,37,000',
                                                style: GoogleFonts.openSans(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                              const Gap(2),
                                              Text(
                                                '     ₹ 23,000',
                                                style: GoogleFonts.openSans(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ))
                                ],
                                pointers: const <GaugePointer>[
                                  NeedlePointer(
                                    needleLength: 1.10,
                                    value: 60,
                                    enableAnimation: true,
                                  )
                                ],
                                ranges: [
                                  GaugeRange(
                                    startValue: 0,
                                    endValue: 60,
                                    color: color,
                                    sizeUnit: GaugeSizeUnit.factor,
                                    startWidth: 0.26,
                                    endWidth: 0.26,
                                  ),
                                  GaugeRange(
                                    startValue: 60,
                                    sizeUnit: GaugeSizeUnit.factor,
                                    startWidth: 0.26,
                                    endWidth: 0.26,
                                    endValue: 100,
                                    color: color9,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
                height: hei / 5.30,
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
                    const Gap(10),
                    Text(
                      '   Weekly Sales',
                      style: GoogleFonts.openSans(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 14,
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
                              ' ₹ 14,000',
                              style: GoogleFonts.openSans(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 16,
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
                        const simplebar(),
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
                  height: hei / 2.30,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '    Sales Chart ',
                            style: GoogleFonts.openSans(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 18,
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
                      const BarChartWidget(),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

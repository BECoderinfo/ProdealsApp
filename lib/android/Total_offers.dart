import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../utils/colors.dart';
import '../widget/my_drawer.dart';

class Total_Offer extends StatefulWidget {
  const Total_Offer({super.key});

  @override
  State<Total_Offer> createState() => _Total_OfferState();
}

class _Total_OfferState extends State<Total_Offer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset("assets/image/s_la-pinoz.png"),
        ],
      ),
      drawer: drawer(900, 350),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "TOTAL REDEEMED",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Gap(20),
              Row(
                children: [
                  Image.asset("assets/image/image 55.png"),
                  const Gap(10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LA Pino'z Pizza",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
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
                            color: Color(0xFFD6AA26),
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xFFD6AA26),
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xFFD6AA26),
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xFFD6AA26),
                            size: 16,
                          ),
                          Icon(
                            Icons.star_half,
                            color: Color(0xFFD6AA26),
                            size: 16,
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                      "assets/image/Group 3765.png",
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: AppColor.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Take by",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Coupon code",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Take Date",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Create Date",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Expire Date",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "-",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "-",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "-",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "-",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "-",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gaurav Butani",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "xxxxxxxxxxxxxx",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "15 feb 2024",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "3 feb 2024",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "20 feb 2024",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 33,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 4, 74, 8),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Text(
                                  "REDEEMED",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                          const Gap(150),
                          GestureDetector(
                            child: SvgPicture.asset(
                              "assets/image/Frame 1000003093.svg",
                              height: 28,
                            ),
                          ),
                          const Gap(10),
                          GestureDetector(
                            child: SvgPicture.asset(
                              "assets/image/Frame 1000003096.svg",
                              height: 28,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Gap(15),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: AppColor.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Take by",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Coupon code",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Take Date",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Create Date",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Expire Date",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "-",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "-",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "-",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "-",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "-",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Yash Ratnani",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "xxxxxxxxxxxxxx",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "15 feb 2024",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "3 feb 2024",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "20 feb 2024",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 33,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 4, 74, 8),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Text(
                                  "REDEEMED",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                          const Gap(150),
                          GestureDetector(
                            child: SvgPicture.asset(
                              "assets/image/Frame 1000003093.svg",
                              height: 28,
                            ),
                          ),
                          const Gap(10),
                          GestureDetector(
                            child: SvgPicture.asset(
                              "assets/image/Frame 1000003096.svg",
                              height: 28,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

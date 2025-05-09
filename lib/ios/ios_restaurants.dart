import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class ios_restaurants extends StatefulWidget {
  const ios_restaurants({super.key});

  @override
  State<ios_restaurants> createState() => _ios_restaurantsState();
}

class _ios_restaurantsState extends State<ios_restaurants> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
        child: Container(
      height: hit,
      width: wid,
      color: AppColor.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Gap(hit / 26),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 0),
                            blurRadius: 2,
                            spreadRadius: 0,
                            color: AppColor.gray,
                          ),
                        ],
                      ),
                      child: Icon(
                        CupertinoIcons.arrow_left,
                        size: 16,
                        color: AppColor.black300,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Restaurants',
                      style: TextStyle(
                        color: AppColor.black300,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            color: Colors.grey.withOpacity(0.5),
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Gap(10),
                          Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CupertinoTextField(
                              controller: _searchController,
                              placeholder: "Search",
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _searchController.clear();
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 12,
                                ),
                              ),
                            ),
                          ),
                          Gap(10),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/images/filter.svg"),
                    ),
                  ),
                ],
              ),
              Gap(15),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Found 18 results",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              Gap(15),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed("/restaurant_details");
                          },
                          child: Container(
                            height: hit / 9.4,
                            width: wid - 34,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: wid / 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      image: const DecorationImage(
                                        image:
                                            AssetImage('assets/images/cc2.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Coffee Culture',
                                        style: GoogleFonts.openSans(
                                          color: AppColor.black300,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/location_gray.svg'),
                                              const Gap(6),
                                              Text(
                                                'Vesu',
                                                style: GoogleFonts.openSans(
                                                  color: AppColor.black300,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Gap(8),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/clock_gray.svg'),
                                              const Gap(6),
                                              Text(
                                                '30 minutes',
                                                style: GoogleFonts.openSans(
                                                  color: AppColor.black300,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Gap(8),
                                  Container(
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  const Gap(8),
                                  Container(
                                    width: wid / 11,
                                    height: hit,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/Star.svg'),
                                        Text(
                                          '4.5',
                                          style: GoogleFonts.openSans(
                                            color: AppColor.black300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(20),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed("/restaurant_details");
                          },
                          child: Container(
                            height: hit / 9.4,
                            width: wid - 34,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: wid / 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      image: const DecorationImage(
                                        image:
                                            AssetImage('assets/images/cc2.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Coffee Culture',
                                        style: GoogleFonts.openSans(
                                          color: AppColor.black300,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/location_gray.svg'),
                                              const Gap(6),
                                              Text(
                                                'Vesu',
                                                style: GoogleFonts.openSans(
                                                  color: AppColor.black300,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Gap(8),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/clock_gray.svg'),
                                              const Gap(6),
                                              Text(
                                                '30 minutes',
                                                style: GoogleFonts.openSans(
                                                  color: AppColor.black300,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Gap(8),
                                  Container(
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  const Gap(8),
                                  Container(
                                    width: wid / 11,
                                    height: hit,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/Star.svg'),
                                        Text(
                                          '4.5',
                                          style: GoogleFonts.openSans(
                                            color: AppColor.black300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(20),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed("/restaurant_details");
                          },
                          child: Container(
                            height: hit / 9.4,
                            width: wid - 34,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: wid / 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      image: const DecorationImage(
                                        image:
                                            AssetImage('assets/images/cc2.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Coffee Culture',
                                        style: GoogleFonts.openSans(
                                          color: AppColor.black300,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/location_gray.svg'),
                                              const Gap(6),
                                              Text(
                                                'Vesu',
                                                style: GoogleFonts.openSans(
                                                  color: AppColor.black300,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Gap(8),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/clock_gray.svg'),
                                              const Gap(6),
                                              Text(
                                                '30 minutes',
                                                style: GoogleFonts.openSans(
                                                  color: AppColor.black300,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Gap(8),
                                  Container(
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  const Gap(8),
                                  Container(
                                    width: wid / 11,
                                    height: hit,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/Star.svg'),
                                        Text(
                                          '4.5',
                                          style: GoogleFonts.openSans(
                                            color: AppColor.black300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(20),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed("/restaurant_details");
                          },
                          child: Container(
                            height: hit / 9.4,
                            width: wid - 34,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: wid / 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      image: const DecorationImage(
                                        image:
                                            AssetImage('assets/images/cc2.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Coffee Culture',
                                        style: GoogleFonts.openSans(
                                          color: AppColor.black300,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/location_gray.svg'),
                                              const Gap(6),
                                              Text(
                                                'Vesu',
                                                style: GoogleFonts.openSans(
                                                  color: AppColor.black300,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Gap(8),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/clock_gray.svg'),
                                              const Gap(6),
                                              Text(
                                                '30 minutes',
                                                style: GoogleFonts.openSans(
                                                  color: AppColor.black300,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Gap(8),
                                  Container(
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  const Gap(8),
                                  Container(
                                    width: wid / 11,
                                    height: hit,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/Star.svg'),
                                        Text(
                                          '4.5',
                                          style: GoogleFonts.openSans(
                                            color: AppColor.black300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(20),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed("/restaurant_details");
                          },
                          child: Container(
                            height: hit / 9.4,
                            width: wid - 34,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: wid / 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      image: const DecorationImage(
                                        image:
                                            AssetImage('assets/images/cc2.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Coffee Culture',
                                        style: GoogleFonts.openSans(
                                          color: AppColor.black300,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/location_gray.svg'),
                                              const Gap(6),
                                              Text(
                                                'Vesu',
                                                style: GoogleFonts.openSans(
                                                  color: AppColor.black300,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Gap(8),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/clock_gray.svg'),
                                              const Gap(6),
                                              Text(
                                                '30 minutes',
                                                style: GoogleFonts.openSans(
                                                  color: AppColor.black300,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Gap(8),
                                  Container(
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  const Gap(8),
                                  Container(
                                    width: wid / 11,
                                    height: hit,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/Star.svg'),
                                        Text(
                                          '4.5',
                                          style: GoogleFonts.openSans(
                                            color: AppColor.black300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(20),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed("/restaurant_details");
                          },
                          child: Container(
                            height: hit / 9.4,
                            width: wid - 34,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: wid / 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      image: const DecorationImage(
                                        image:
                                            AssetImage('assets/images/cc2.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Coffee Culture',
                                        style: GoogleFonts.openSans(
                                          color: AppColor.black300,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/location_gray.svg'),
                                              const Gap(6),
                                              Text(
                                                'Vesu',
                                                style: GoogleFonts.openSans(
                                                  color: AppColor.black300,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Gap(8),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/clock_gray.svg'),
                                              const Gap(6),
                                              Text(
                                                '30 minutes',
                                                style: GoogleFonts.openSans(
                                                  color: AppColor.black300,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Gap(8),
                                  Container(
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  const Gap(8),
                                  Container(
                                    width: wid / 11,
                                    height: hit,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/Star.svg'),
                                        Text(
                                          '4.5',
                                          style: GoogleFonts.openSans(
                                            color: AppColor.black300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

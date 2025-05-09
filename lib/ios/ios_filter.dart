import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_deals1/controller/slider_controller.dart';

import '../../utils/colors.dart';

class ios_filter extends StatelessWidget {
  const ios_filter({super.key});

  @override
  Widget build(BuildContext context) {
    SliderController slider = SliderController();
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Material(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 60,
          width: wid,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.gray.withOpacity(0.4),
                        offset: Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Clear All',
                    style: GoogleFonts.openSans(
                      color: AppColor.black300,
                    ),
                  ),
                ),
              ),
              const Gap(10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.gray.withOpacity(0.4),
                        offset: Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Apply',
                    style: GoogleFonts.openSans(
                      color: AppColor.black300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          height: hit,
          width: wid,
          padding: EdgeInsets.all(16),
          color: AppColor.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Filter',
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: wid,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.gray.withOpacity(0.4),
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Food',
                                    style: GoogleFonts.openSans(
                                      color: AppColor.black300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Restaurant',
                                    style: GoogleFonts.openSans(
                                      color: AppColor.black300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      Text(
                        'Food Type',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black300,
                          fontSize: 18,
                        ),
                      ),
                      const Gap(14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColor.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.gray.withOpacity(0.4),
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(4),
                              Text(
                                'Food',
                                style: GoogleFonts.openSans(
                                  color: AppColor.black300,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColor.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.gray.withOpacity(0.4),
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(4),
                              Text(
                                'Drink',
                                style: GoogleFonts.openSans(
                                  color: AppColor.black300,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColor.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.gray.withOpacity(0.4),
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(4),
                              Text(
                                'Cake',
                                style: GoogleFonts.openSans(
                                  color: AppColor.black300,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColor.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.gray.withOpacity(0.4),
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(4),
                              Text(
                                'Snacks',
                                style: GoogleFonts.openSans(
                                  color: AppColor.black300,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Gap(20),
                      Text(
                        'Location',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black300,
                          fontSize: 18,
                        ),
                      ),
                      const Gap(20),
                      // todo: show location that near the users set location
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: hit / 20,
                            width: wid / 4,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Kamerej',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColor.black300,
                              ),
                            ),
                          ),
                          Container(
                            height: hit / 20,
                            width: wid / 4,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Varachha',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColor.black300,
                              ),
                            ),
                          ),
                          Container(
                            height: hit / 20,
                            width: wid / 4,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Punagam',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColor.black300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: hit / 20,
                            width: wid / 4,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Kapodra',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColor.black300,
                              ),
                            ),
                          ),
                          Container(
                            height: hit / 20,
                            width: wid / 4,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Adajan',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColor.black300,
                              ),
                            ),
                          ),
                          Container(
                            height: hit / 20,
                            width: wid / 4,
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Near Me',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColor.black300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Text(
                        'Distance',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black300,
                          fontSize: 18,
                        ),
                      ),
                      const Gap(10),
                      Container(
                        width: wid,
                        alignment: Alignment.bottomRight,
                        child: Obx(
                          () => Text(
                            "${slider.km.value.toString()}km",
                            style: GoogleFonts.openSans(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Material(
                          child: Slider(
                            min: 1,
                            max: 10,
                            activeColor: AppColor.primary,
                            thumbColor: AppColor.primary,
                            value: slider.km.value,
                            label: "${slider.km.value.toString()}KM",
                            divisions: 18,
                            onChanged: (value) {
                              slider.UpdateSlider(value);
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1km',
                            style: GoogleFonts.openSans(
                              color: AppColor.black300,
                            ),
                          ),
                          Text(
                            '10km',
                            style: GoogleFonts.openSans(
                              color: AppColor.black300,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Text(
                        'Rating',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black300,
                          fontSize: 18,
                        ),
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: hit / 22,
                            width: wid / 4,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '3+',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColor.black300,
                              ),
                            ),
                          ),
                          Container(
                            height: hit / 22,
                            width: wid / 4,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '4+',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColor.black300,
                              ),
                            ),
                          ),
                          Container(
                            height: hit / 22,
                            width: wid / 4,
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gray.withOpacity(0.4),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '5',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColor.black300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Text(
                        'Price',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black300,
                          fontSize: 18,
                        ),
                      ),
                      const Gap(10),
                      Container(
                        width: wid,
                        alignment: Alignment.bottomRight,
                        child: Obx(
                          () => Text(
                            "${slider.val1.value.toString().split('.').first}\$ - ${slider.val2.value.toString().split('.').first}\$",
                            style: GoogleFonts.openSans(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Material(
                          child: RangeSlider(
                            min: 1,
                            max: 50,
                            activeColor: AppColor.primary,
                            // label: "${slider.km.value.toString()}KM",
                            onChanged: (value) {
                              slider.UpdateRangeSlider(value);
                            },
                            values: RangeValues(
                                slider.val1.value, slider.val2.value),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1\$',
                            style: GoogleFonts.openSans(
                              color: AppColor.black300,
                            ),
                          ),
                          Text(
                            '50\$',
                            style: GoogleFonts.openSans(
                              color: AppColor.black300,
                            ),
                          ),
                        ],
                      ),
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

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:pro_deals1/widget/separator.dart';

import '../utils/colors.dart';

class promocode extends StatefulWidget {
  const promocode({super.key});

  @override
  State<promocode> createState() => _promocodeState();
}

class _promocodeState extends State<promocode> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color myColor = const Color(0xFFDAA520);
    Color myColor2 = const Color(0xFFE73C42);
    Color myColor3 = const Color(0xFF3E60E8);
    Color myColor4 = const Color(0xFF28B453);
    Color myColor5 = const Color(0xFFAA54BF);
    Color myColor6 = const Color(0xFF9A6E00);
    Color myColor7 = const Color(0xFF962D31);
    Color myColor8 = const Color(0xFF2F4898);
    Color myColor9 = const Color(0xFF1D7336);
    Color myColor10 = const Color(0xFF843497);
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Gap(40),
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
                    'Promocode',
                    style: TextStyle(
                      color: AppColor.black300,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/promocodeDetails');
                      },
                      child: Container(
                        height: 120,
                        width: width,
                        decoration: BoxDecoration(
                          color: myColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 120,
                                width: width / 3,
                                decoration: BoxDecoration(
                                  color: myColor6,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '40% \noff',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            MyVerticalSeparator(
                              color: AppColor.white,
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  const Gap(14),
                                  Expanded(
                                    child: Text(
                                      'Black Coffee',
                                      style: TextStyle(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color: AppColor.white,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10))),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Redeem',
                                            style: TextStyle(
                                              color: AppColor.primary,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            'Details',
                                            style: TextStyle(
                                                color: AppColor.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Gap(10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(20),
                    Container(
                      height: 120,
                      width: width,
                      decoration: BoxDecoration(
                        color: myColor2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 120,
                              width: width / 3,
                              decoration: BoxDecoration(
                                color: myColor7,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '30% \noff',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          MyVerticalSeparator(
                            color: AppColor.white,
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                const Gap(14),
                                Expanded(
                                  child: Text(
                                    'Pizza',
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10))),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Redeem',
                                          style: TextStyle(
                                            color: myColor2,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Details',
                                          style:
                                              TextStyle(color: AppColor.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pro_deals1/widget/separator.dart';

import '../utils/colors.dart';

class promocode_details extends StatefulWidget {
  const promocode_details({super.key});

  @override
  State<promocode_details> createState() => _promocode_detailsState();
}

class _promocode_detailsState extends State<promocode_details> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color myColor = const Color(0xFFDAA520);

    Color myColor6 = const Color(0xFF9A6E00);

    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(16),
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
                    'Promocode Details',
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
                    Container(
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
                                borderRadius: BorderRadius.only(
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
                    const Gap(20),
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(10),
                          Text(
                            '40% Discount only for you.',
                            style: TextStyle(
                                fontSize: 22,
                                color: myColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'To get this discount apply the voucher',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const Gap(30),
                          const Text(
                            'Redeemable at all black coffee and all nescafe products.',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const Gap(20),
                          const Text(
                            'Not valid with any other discount and offers.',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const Gap(20),
                          const Text(
                            'Unable any other cash payments.',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const Gap(20),
                          Container(
                            height: 30,
                            width: 140,
                            decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(4)),
                            alignment: Alignment.center,
                            child: Text(
                              'Exp: 2 Apr, 2024',
                              style: TextStyle(color: AppColor.white),
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
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_deals1/utils/colors.dart';

import '../widget/ios/offerCard.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: Container(
        height: hit,
        width: wid,
        padding: const EdgeInsets.all(16),
        color: AppColor.white,
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
                    'Offer Details',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: hit / 3.2,
                      width: wid,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/detail_image.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Double cheese',
                              style: GoogleFonts.openSans(
                                color: AppColor.gray,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Cheese Pizza',
                              style: GoogleFonts.openSans(
                                color: AppColor.gray,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '\$5.10',
                          style: GoogleFonts.openSans(
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ratings',
                              style: GoogleFonts.openSans(
                                color: AppColor.gray,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  color: AppColor.black300,
                                ),
                                Text(
                                  '4.5',
                                  style: GoogleFonts.openSans(
                                    color: AppColor.gray,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Calories',
                              style: GoogleFonts.openSans(
                                color: AppColor.gray,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                Icon(
                                  Icons.local_fire_department,
                                  color: AppColor.black300,
                                ),
                                Text(
                                  '140Kcal',
                                  style: GoogleFonts.openSans(
                                    color: AppColor.gray,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time',
                              style: GoogleFonts.openSans(
                                color: AppColor.gray,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_filled,
                                  color: AppColor.black300,
                                ),
                                Text(
                                  '20m',
                                  style: GoogleFonts.openSans(
                                    color: AppColor.gray,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(20),
                    Divider(
                      color: AppColor.gray.withOpacity(0.5),
                      thickness: 1,
                    ),
                    const Gap(10),
                    // Example offer section
                    buildOfferCard(
                      title: "Just Arrived",
                      offer: "25% off",
                      description: "Get Any Choco Lava at Rs.99\nworth Rs.121",
                      discountPrice: "₹ 99/-",
                      originalPrice: "₹ 121/-",
                      validity: "All Days",
                      timings: "Sat, 11:00 AM-11:30 PM",
                    ),
                    buildOfferCard2(
                      title: "Special Offer",
                      offer: "SAVE",
                      description: "Get 50% off on your next purchase!",
                      discountPrice: "\$25.00",
                      originalPrice: "\$50.00",
                      validity: "Until Dec 31, 2024",
                      timings: "9 AM - 9 PM",
                      discountPercentage: "50",
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

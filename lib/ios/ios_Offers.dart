import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class ios_offers extends StatefulWidget {
  const ios_offers({super.key});

  @override
  State<ios_offers> createState() => _ios_offersState();
}

class _ios_offersState extends State<ios_offers> {
  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
        child: Container(
      height: hit,
      width: wid,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
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
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Gap(wid / 3.1),
                  Text(
                    'Offers',
                    style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 36,
                    width: 79,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primary),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "About",
                      style: GoogleFonts.openSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    )),
                  ),
                  Container(
                    height: 36,
                    width: 79,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primary),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Menu",
                      style: GoogleFonts.openSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    )),
                  ),
                  Container(
                    height: 36,
                    width: 79,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.primary),
                    child: Center(
                      child: Text(
                        "Offers",
                        style: GoogleFonts.openSans(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    height: 36,
                    width: 79,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primary),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Gallary",
                      style: GoogleFonts.openSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    )),
                  ),
                ],
              ),
              const Gap(30),
              Container(
                height: hit / 1.9,
                width: wid,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Image.asset("assets/images/0.1.png"),
                      const Gap(8),
                      Text(
                        "Coffee Culture",
                        style: GoogleFonts.openSans(
                          color: AppColor.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColor.primary,
                            size: 15,
                          ),
                          Gap(8),
                          Text(
                            "Khodiyar Nivas, Vesu, Surat",
                            style: GoogleFonts.openSans(
                                color: AppColor.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const Gap(15),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "*",
                                style: GoogleFonts.openSans(
                                    color: AppColor.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Gap(25),
                              Text(
                                "*",
                                style: GoogleFonts.openSans(
                                    color: AppColor.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Gap(25),
                              Text(
                                "*",
                                style: GoogleFonts.openSans(
                                    color: AppColor.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Gap(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rs.250 Off On A Minimum \nBilling Of Rs.1000",
                                style: GoogleFonts.openSans(
                                    color: AppColor.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Gap(5),
                              Text(
                                "Buy 1 Get 1 Half Soup \nAt Rs.126",
                                style: GoogleFonts.openSans(
                                    color: AppColor.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Gap(5),
                              Text(
                                "50% Off on buffet + 25% Off ",
                                style: GoogleFonts.openSans(
                                    color: AppColor.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       "*",
                      //       style: GoogleFonts.openSans(
                      //           color: AppColors.white,
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.w600),
                      //     ),
                      //     const Gap(5),
                      // Text(
                      //   "Rs.250 Off On A Minimum \nBilling Of Rs.1000",
                      //   style: GoogleFonts.openSans(
                      //       color: AppColors.primary,
                      //       fontSize: 14,
                      //       fontWeight: FontWeight.w600),
                      // )
                      //   ],
                      // ),
                      // const Gap(10),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       "*",
                      //       style: GoogleFonts.openSans(
                      //           color: AppColors.white,
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.w600),
                      //     ),
                      //     const Gap(5),
                      // Text(
                      //   "Buy 1 Get 1 Half Soup \nAt Rs.126",
                      //   style: GoogleFonts.openSans(
                      //       color: AppColors.primary,
                      //       fontSize: 14,
                      //       fontWeight: FontWeight.w600),
                      // )
                      //   ],
                      // ),
                      // const Gap(10),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       "*",
                      //       style: GoogleFonts.openSans(
                      //           color: AppColors.white,
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.w600),
                      //     ),
                      //     const Gap(5),
                      // Text(
                      //   "50% Off on buffet + 25% Off ",
                      //   style: GoogleFonts.openSans(
                      //       color: AppColors.primary,
                      //       fontSize: 14,
                      //       fontWeight: FontWeight.w600),
                      // ),
                      //   ],
                      // ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset("assets/images/22.svg"),
                                Text(
                                  "Free",
                                  style: GoogleFonts.openSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          const Gap(20),
                          Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset("assets/images/33.svg"),
                                Text(
                                  "10-15m",
                                  style: GoogleFonts.openSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          const Gap(20),
                          Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset("assets/images/11.svg"),
                                Text(
                                  "4.5",
                                  style: GoogleFonts.openSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "More Details",
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor.primary),
                            ),
                            child: Icon(
                              Icons.bookmark,
                              color: AppColor.primary,
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
      )),
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import 'animation.dart';

class ios_menu extends StatefulWidget {
  const ios_menu({super.key});

  @override
  State<ios_menu> createState() => _ios_menuState();
}

class _ios_menuState extends State<ios_menu> {
  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: Container(
        height: hit,
        width: wid,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
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
                      Gap(wid / 3.2),
                      Text(
                        'Menu',
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "About",
                            style: GoogleFonts.openSans(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Container(
                        height: 36,
                        width: 79,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.primary),
                        child: Center(
                          child: Text(
                            "Menu",
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Wrap(
                    runSpacing: 20,
                    spacing: 12,
                    children: [
                      Container(
                        height: 164,
                        width: 170,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Gap(7),
                            Stack(
                              children: [
                                Container(
                                  height: 109,
                                  width: 155,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/Rectangle 4796.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Positioned(
                                  right: -10,
                                  top: -5,
                                  child: animation_cantroller(),
                                )
                              ],
                            ),
                            const Gap(13),
                            const Center(
                              child: Text(
                                "Pizza",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 164,
                        width: 170,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Gap(7),
                            Stack(
                              children: [
                                Container(
                                  height: 109,
                                  width: 155,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/2.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Positioned(
                                  right: -10,
                                  top: -5,
                                  child: animation_cantroller(),
                                )
                              ],
                            ),
                            const Gap(13),
                            const Center(
                              child: Text(
                                "Burger",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 164,
                        width: 170,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Gap(7),
                            Stack(
                              children: [
                                Container(
                                  height: 109,
                                  width: 155,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/3.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Positioned(
                                  right: -10,
                                  top: -5,
                                  child: animation_cantroller(),
                                )
                              ],
                            ),
                            const Gap(13),
                            const Center(
                              child: Text(
                                "Indian",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 164,
                        width: 170,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Gap(7),
                            Stack(
                              children: [
                                Container(
                                  height: 109,
                                  width: 155,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/4.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Positioned(
                                  right: -10,
                                  top: -5,
                                  child: animation_cantroller(),
                                )
                              ],
                            ),
                            const Gap(13),
                            const Center(
                              child: Text(
                                "Panjabi",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 164,
                        width: 170,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Gap(7),
                            Stack(
                              children: [
                                Container(
                                  height: 109,
                                  width: 155,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/5.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Positioned(
                                  right: -10,
                                  top: -5,
                                  child: animation_cantroller(),
                                )
                              ],
                            ),
                            const Gap(13),
                            const Center(
                              child: Text(
                                "Desserts",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 164,
                        width: 170,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Gap(7),
                            Stack(
                              children: [
                                Container(
                                  height: 109,
                                  width: 155,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/6.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Positioned(
                                  right: -10,
                                  top: -5,
                                  child: animation_cantroller(),
                                )
                              ],
                            ),
                            const Gap(13),
                            const Center(
                              child: Text(
                                "Shake",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 164,
                        width: 170,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Gap(7),
                            Stack(
                              children: [
                                Container(
                                  height: 109,
                                  width: 155,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/7.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Positioned(
                                  right: -10,
                                  top: -5,
                                  child: animation_cantroller(),
                                )
                              ],
                            ),
                            const Gap(13),
                            const Center(
                              child: Text(
                                "Chocolates",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 164,
                        width: 170,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Gap(7),
                            Stack(
                              children: [
                                Container(
                                  height: 109,
                                  width: 155,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/8.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Positioned(
                                  right: -10,
                                  top: -5,
                                  child: animation_cantroller(),
                                )
                              ],
                            ),
                            const Gap(13),
                            const Center(
                              child: Text(
                                "Coldrinks",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

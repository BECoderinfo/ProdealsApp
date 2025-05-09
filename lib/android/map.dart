import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class location extends StatelessWidget {
  const location({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: wid,
        height: hit,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Color(0xffF1F1F1),
            image: DecorationImage(image: AssetImage('assets/images/map.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Gap(10),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      selectionHeightStyle: BoxHeightStyle.tight,
                      controller: controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back)),
                        suffixIcon: SvgPicture.asset('assets/icons/search.svg'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                Expanded(
                  flex: 0,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primary,
                    ),
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child:
                        SvgPicture.asset('assets/icons/location_searching.svg'),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.primary,
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset('assets/icons/filter1.svg'),
              ),
            ),
            const Gap(20),
            Container(
              width: wid / 1.09,
              height: hit / 2.50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.white),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: wid,
                    height: 102,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/cc2.png',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Gap(10),
                  const Text(
                    'Coffee Culture',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, color: AppColor.primary),
                      const Text(
                        ' Khodiyar Nivas, Vesu, Surat',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.gray.withOpacity(0.4)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.directions_car_outlined,
                              size: 16,
                            ),
                            Gap(4),
                            Text('Free'),
                          ],
                        ),
                      ),
                      const Gap(10),
                      Container(
                        padding: const EdgeInsets.all(6),
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.gray.withOpacity(0.4)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.watch_later,
                              size: 16,
                            ),
                            Gap(4),
                            Text('10-15cm'),
                          ],
                        ),
                      ),
                      const Gap(10),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.gray.withOpacity(0.4)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                            ),
                            Gap(4),
                            Text('4.5'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 60,
                          width: wid,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.primary),
                          child: const Center(
                            child: Text(
                              ' More Details',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Container(
                          height: 60,
                          width: wid / 6,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.primary),
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.white),
                          child: Icon(
                            Icons.book_outlined,
                            size: 50,
                            color: AppColor.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}

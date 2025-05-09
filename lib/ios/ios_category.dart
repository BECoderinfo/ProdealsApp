import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class ios_category extends StatelessWidget {
  const ios_category({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Category',
          style: TextStyle(color: AppColor.black300),
        ),
        backgroundColor: AppColor.white,
      ),
      backgroundColor: AppColor.white,
      child: Container(
        height: hit,
        width: wid,
        decoration: BoxDecoration(color: AppColor.white),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: wid - 90,
                  child: CupertinoTextField(
                    prefix: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.search_rounded,
                        color: AppColor.black300,
                      ),
                    ),
                    placeholder: 'Search food...',
                    placeholderStyle: GoogleFonts.openSans(
                      color: AppColor.black300,
                    ),
                    style: GoogleFonts.openSans(
                      color: AppColor.black300,
                    ),
                    controller: search,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            color: AppColor.gray.withOpacity(0.4),
                            offset: const Offset(0, 0)),
                      ],
                      color: AppColor.white.withOpacity(1),
                      // border: Border.all(
                      //   color: AppColor.black300.withOpacity(0.3),
                      // ),
                    ),
                  ),
                ),
                const Gap(8),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/ios_filter');
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.filter_alt_outlined,
                      color: AppColor.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(20),
            Material(
              child: MasonryGridView(
                shrinkWrap: true,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed('/details');
                    },
                    child: Container(
                      height: 160,
                      // padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.gray,
                            blurRadius: 2,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            child: Container(
                              height: 160,
                              width: 130,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/category1.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            bottom: 10,
                            left: 14,
                            child: Text(
                              'Fast food',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/details');
                    },
                    child: Container(
                      height: 160,
                      // padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.gray,
                            blurRadius: 2,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            child: Container(
                              height: 160,
                              width: 130,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/category1.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 14,
                            child: Text(
                              'Fast food',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

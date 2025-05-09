import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class ios_gallary extends StatefulWidget {
  const ios_gallary({Key? key, required Type Key}) : super(key: key);

  @override
  State<ios_gallary> createState() => _ios_gallaryState();
}

class _ios_gallaryState extends State<ios_gallary> {
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
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
                      Gap(wid / 3.3),
                      Text(
                        'Gallery',
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTab("About"),
                      _buildTab("Menu"),
                      _buildTab("Offers"),
                      _buildTab("Gallery", isSelected: true),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.transparent),
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
                                    borderRadius: BorderRadius.circular(10),
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
                  Gap(20),
                  Wrap(
                    runSpacing: 15,
                    spacing: 15,
                    children: [
                      _buildGalleryItem("assets/images/7.png", 361, 241),
                      _buildGalleryItem("assets/images/5.png", 165, 228),
                      _buildGalleryItem(
                          "assets/images/Rectangle 4708.png", 165, 228),
                      _buildGalleryItem("assets/images/3.png", 165, 180),
                      _buildGalleryItem("assets/images/7.png", 165, 180),
                      _buildGalleryItem("assets/images/5.png", 165, 128),
                      _buildGalleryItem("assets/images/6.png", 165, 109),
                      _buildGalleryItem("assets/images/4.png", 165, 183),
                      _buildGalleryItem("assets/images/7.png", 165, 250),
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

  Widget _buildTab(String title, {bool isSelected = false}) {
    return Container(
      height: 36,
      width: 79,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primary),
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? AppColor.primary : Colors.transparent,
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildGalleryItem(String imagePath, double width, double height) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

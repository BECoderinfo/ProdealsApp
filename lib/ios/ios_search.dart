import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_deals1/utils/colors.dart';
import 'package:pro_deals1/utils/images.dart';

class ios_search extends StatelessWidget {
  ios_search({super.key});

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Container(
        height: hit,
        width: wid,
        color: AppColor.white,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(hit / 20),
              Center(
                child: Text(
                  'Search',
                  style: GoogleFonts.openSans(
                    color: AppColor.black300,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const Gap(30),
              Row(
                children: [
                  Container(
                    width: wid - 90,
                    child: CupertinoTextField(
                      prefix: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.search_rounded,
                          color: AppColor.black300,
                        ),
                      ),
                      style: GoogleFonts.openSans(
                        color: AppColor.black300,
                      ),
                      placeholder: 'search',
                      placeholderStyle: GoogleFonts.openSans(
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
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'History record',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      color: AppColor.black300,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Clear all',
                    style: GoogleFonts.openSans(
                      color: AppColor.black300,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Gap(30),
              const Material(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  children: [
                    Chip(
                      label: Text('North indian'),
                    ),
                    Chip(
                      label: Text('shake'),
                    ),
                    Chip(
                      label: Text('Pizza'),
                      // deleteIcon: Icon(Icons.close),
                    ),
                    Chip(
                      label: Text('Desserts'),
                      // deleteIcon: Icon(Icons.close),
                    ),
                    Chip(
                      label: Text('Chocolate'),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              Text(
                'For you',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  color: AppColor.black300,
                  fontSize: 20,
                ),
              ),
              Container(
                height: hit / 2.2,
                width: wid,
                child: MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          images[index]['image'],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

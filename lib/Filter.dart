import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils/colors.dart';

class filter extends StatelessWidget {
  const filter({super.key});

  @override
  Widget build(BuildContext context) {
    bool isselcted = false;
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const Text('Apply Filter'),
        centerTitle: true,
      ),
      body: Container(
        height: hit,
        width: wid,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.sort),
                const Gap(10),
                Text(
                  'Sort by',
                  style: TextStyle(
                    color: AppColor.black300,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Gap(20),
            RadioListTile(
              value: 'Popular',
              groupValue: 'Popular',
              title: const Text('Popular'),
              onChanged: (value) {},
            ),
            RadioListTile(
              value: 'Location',
              groupValue: 'hi',
              title: const Text('Location - Nearest to me'),
              onChanged: (value) {},
            ),
            RadioListTile(
              value: 'Discount',
              groupValue: 'hi',
              title: const Text('Discount - High to low'),
              onChanged: (value) {},
            ),
            RadioListTile(
              value: 'Price',
              groupValue: 'hi',
              title: const Text('Price - Low to high'),
              onChanged: (value) {},
            ),
            RadioListTile(
              value: 'Prices',
              groupValue: 'hi',
              title: const Text('Price - High to low'),
              onChanged: (value) {},
            ),
            const Gap(20),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    child: ExpansionTile(
                      initiallyExpanded: false,
                      title: Text('Categories'),
                      children: [
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Cuisines'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Bakery & Dessert'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = true;
                          },
                          title: Text('Fashion & Design'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Sports & Outdoors'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Beauty & Saloon'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Gift & Card'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Activity'),
                        ),
                      ],
                    ),
                  ),
                  Gap(10),
                  Card(
                    child: ExpansionTile(
                      title: Text('Options'),
                      children: [
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Cuisines'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Bakery & Dessert'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = true;
                          },
                          title: Text('Fashion & Design'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Sports & Outdoors'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Beauty & Saloon'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Gift & Card'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Activity'),
                        ),
                      ],
                    ),
                  ),
                  Gap(10),
                  Card(
                    child: ExpansionTile(
                      title: Text('Distance'),
                      children: [
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Cuisines'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Bakery & Dessert'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = true;
                          },
                          title: Text('Fashion & Design'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Sports & Outdoors'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Beauty & Saloon'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Gift & Card'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Activity'),
                        ),
                      ],
                    ),
                  ),
                  Gap(10),
                  Card(
                    child: ExpansionTile(
                      title: Text('Loation'),
                      children: [
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Cuisines'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Bakery & Dessert'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = true;
                          },
                          title: Text('Fashion & Design'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Sports & Outdoors'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Beauty & Saloon'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Gift & Card'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Activity'),
                        ),
                      ],
                    ),
                  ),
                  Gap(10),
                  Card(
                    child: ExpansionTile(
                      title: Text('Rating'),
                      children: [
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Cuisines'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Bakery & Dessert'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = true;
                          },
                          title: Text('Fashion & Design'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Sports & Outdoors'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Beauty & Saloon'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Gift & Card'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isselcted,
                          onChanged: (value) {
                            isselcted = false;
                          },
                          title: Text('Activity'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            // Container(
            //   height: 70,
            //   width: wid,
            //   decoration: BoxDecoration(
            //     color: Colors.grey.shade200,
            //     borderRadius: BorderRadius.circular(6),
            //   ),
            //   padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            //   child: Row(
            //     children: [
            //       Text(
            //         'Categories',
            //         style: GoogleFonts.openSans(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       const Spacer(),
            //       IconButton(
            //           onPressed: () {},
            //           icon: const Icon(Icons.keyboard_arrow_down))
            //     ],
            //   ),
            // ),
            // const Gap(20),
            // Container(
            //   height: hit / 14,
            //   width: wid,
            //   decoration: BoxDecoration(
            //     color: Colors.grey.shade200,
            //     borderRadius: BorderRadius.circular(6),
            //   ),
            //   padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            //   child: Row(
            //     children: [
            //       Text(
            //         'Options',
            //         style: GoogleFonts.openSans(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       const Spacer(),
            //       IconButton(
            //           onPressed: () {},
            //           icon: const Icon(Icons.keyboard_arrow_down))
            //     ],
            //   ),
            // ),
            // const Gap(20),
            // Container(
            //   height: hit / 14,
            //   width: wid,
            //   decoration: BoxDecoration(
            //     color: Colors.grey.shade200,
            //     borderRadius: BorderRadius.circular(6),
            //   ),
            //   padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            //   child: Row(
            //     children: [
            //       Text(
            //         'Distance',
            //         style: GoogleFonts.openSans(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       const Spacer(),
            //       IconButton(
            //           onPressed: () {},
            //           icon: const Icon(Icons.keyboard_arrow_down))
            //     ],
            //   ),
            // ),
            // const Gap(20),
            // Container(
            //   height: hit / 14,
            //   width: wid,
            //   decoration: BoxDecoration(
            //     color: Colors.grey.shade200,
            //     borderRadius: BorderRadius.circular(6),
            //   ),
            //   padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            //   child: Row(
            //     children: [
            //       Text(
            //         'Loation',
            //         style: GoogleFonts.openSans(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       const Spacer(),
            //       IconButton(
            //           onPressed: () {},
            //           icon: const Icon(Icons.keyboard_arrow_down))
            //     ],
            //   ),
            // ),
            // const Gap(20),
            // Container(
            //   height: hit / 14,
            //   width: wid,
            //   decoration: BoxDecoration(
            //     color: Colors.grey.shade200,
            //     borderRadius: BorderRadius.circular(6),
            //   ),
            //   padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            //   child: Row(
            //     children: [
            //       Text(
            //         'Rating',
            //         style: GoogleFonts.openSans(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       const Spacer(),
            //       IconButton(
            //           onPressed: () {},
            //           icon: const Icon(Icons.keyboard_arrow_down))
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: wid / 2.3,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primary),
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Reset',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: wid / 2.3,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Apply',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTile() {
  return ExpansionTile(title: Text(''));
}

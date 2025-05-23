import 'package:flutter/cupertino.dart';

import '../controller/search/search_controller.dart';
import '../imports.dart';

class IosSearch extends StatelessWidget {
  final SearchControllers controller = Get.put(SearchControllers());
  final TextEditingController search = TextEditingController();

  IosSearch({super.key});

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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Gap(hit / 20),
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
                    'Search',
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
            Row(
              children: [
                Expanded(
                  child: CupertinoTextField(
                    prefix: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.search_rounded,
                        color: AppColor.black300,
                      ),
                    ),
                    style: GoogleFonts.openSans(color: AppColor.black300),
                    placeholder: 'Search',
                    placeholderStyle:
                        GoogleFonts.openSans(color: AppColor.black300),
                    controller: search,
                    onChanged: (value) {
                      controller.searchQuery.value = value;
                    },
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: AppColor.gray.withOpacity(0.4),
                          offset: const Offset(0, 0),
                        ),
                      ],
                      color: AppColor.white,
                    ),
                  ),
                ),
                // const Gap(8),
                // GestureDetector(
                //   onTap: () {
                //     Get.toNamed('/ios_filter');
                //   },
                //   child: Container(
                //     width: 50,
                //     height: 50,
                //     decoration: BoxDecoration(
                //       color: AppColor.primary,
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: const Icon(
                //       Icons.filter_alt_outlined,
                //       color: Colors.white,
                //       size: 28,
                //     ),
                //   ),
                // ),
              ],
            ),
            const Gap(20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        color: AppColor.black300,
                        fontSize: 18,
                      ),
                    ),
                    const Gap(10),
                    Obx(() {
                      return Material(
                        // 👈 FIX: Wrap in Material
                        color: Colors.transparent,
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: controller.filteredCategoryList.map((cat) {
                            final selected =
                                controller.selectedCategory.value ==
                                    (cat.category ?? '');
                            return GestureDetector(
                              onTap: () {
                                controller.selectedCategory.value =
                                    selected ? '' : (cat.category ?? '');
                                controller.filterResults();
                              },
                              child: Chip(
                                backgroundColor: selected
                                    ? AppColor.primary
                                    : AppColor.gray.withOpacity(0.3),
                                label: Text(
                                  cat.category ?? '',
                                  style: GoogleFonts.openSans(
                                    color: selected
                                        ? Colors.white
                                        : AppColor.black300,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }),
                    const Gap(20),
                    Text(
                      'Results',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        color: AppColor.black300,
                        fontSize: 18,
                      ),
                    ),
                    const Gap(10),
                    Obx(() {
                      final businesses = controller.filteredBusinessList;

                      if (businesses.isEmpty) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Center(
                            child: Text(
                              'No results found.',
                              style: GoogleFonts.openSans(
                                color: AppColor.gray,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      }

                      return ListView.separated(
                        padding: EdgeInsets.all(0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const Gap(14),
                        itemCount: businesses.length,
                        itemBuilder: (context, index) {
                          final item = businesses[index];

                          return Center(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed('/restaurant_details', arguments: {
                                  'rId': item.sId ?? "",
                                })?.then((e) {
                                  Get.delete<AndroidBusinessDetailController>();
                                });
                              },
                              child: Container(
                                height: wid / 4.8,
                                width: wid - 34,
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.08),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.memory(
                                          Uint8List.fromList(
                                              item.mainImage!.data!.data!),
                                          fit: BoxFit.cover,
                                          width: wid / 4.6,
                                          height: wid / 5,
                                        ),
                                      ),
                                      const Gap(20),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                item.businessName ?? '',
                                                style: GoogleFonts.openSans(
                                                  color: AppColor.black300,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(
                                              "${item.category ?? 'No Category'} • ${item.address ?? 'No Address'}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: AppColor.black300,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Gap(8),
                                      Container(
                                        width: 1,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                      const Gap(8),
                                      Container(
                                        width: wid / 9,
                                        height: hit,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/Star.svg'),
                                            Text(
                                              double.parse(item.averageRating ??
                                                      "0.0")
                                                  .toStringAsFixed(1),
                                              style: GoogleFonts.openSans(
                                                color: AppColor.black300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
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

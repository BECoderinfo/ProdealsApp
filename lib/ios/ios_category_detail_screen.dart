import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class IOSCategoryDetailScreen extends GetView<CategoryDetailController> {
  const IOSCategoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return GetBuilder<CategoryDetailController>(
      init: CategoryDetailController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: AppColor.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Gap(30),
                // Gap(MediaQuery.of(context).padding.top * 2),
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
                              offset: Offset(0, 0),
                              blurRadius: 2,
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
                        'Category details',
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
                  child: Obx(
                    () => controller.isError.value
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off_rounded,
                                size: 80,
                                color: AppColor.black,
                              ),
                              Gap(20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Something went wrong please try again.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : controller.isLoaded.value
                            ? controller.businessList.isEmpty
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Business not found.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AppColor.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : ListView.builder(
                                    itemCount: controller.businessList.length,
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: InkWell(
                                          onTap: () {
                                            Get.toNamed(
                                                '/and_restaurant_details',
                                                arguments: {
                                                  'rId': controller
                                                          .businessList[index]
                                                          .sId ??
                                                      "",
                                                })?.then(
                                              (e) {
                                                Get.delete<
                                                    AndroidBusinessDetailController>();
                                              },
                                            );
                                          },
                                          child: Container(
                                            height: wid / 5,
                                            width: wid - 34,
                                            decoration: BoxDecoration(
                                              color: AppColor.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColor.gray
                                                      .withOpacity(0.4),
                                                  blurRadius: 1,
                                                  offset: const Offset(0, 1),
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.memory(
                                                        Uint8List.fromList(
                                                          controller
                                                              .businessList[
                                                                  index]
                                                              .mainImage!
                                                              .data!
                                                              .data!,
                                                        ),
                                                        fit: BoxFit.cover,
                                                        width: wid / 5,
                                                        height: wid / 5,
                                                      ),
                                                    ),
                                                  ),
                                                  const Gap(10),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            '${controller.businessList[index].businessName}',
                                                            style: GoogleFonts
                                                                .openSans(
                                                              color: AppColor
                                                                  .black300,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            overflow: TextOverflow
                                                                .ellipsis, // Ensure it does not overflow
                                                          ),
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SvgPicture.asset(
                                                                'assets/icons/location_gray.svg'),
                                                            const Gap(6),
                                                            Expanded(
                                                              child: Text(
                                                                '${controller.businessList[index].address} ${controller.businessList[index].city} ${controller.businessList[index].state}-${controller.businessList[index].pincode}',
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts
                                                                    .openSans(
                                                                  color: AppColor
                                                                      .black300,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Gap(8),
                                                  Container(
                                                    width: 1,
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                  ),
                                                  const Gap(8),
                                                  Container(
                                                    width: wid / 11,
                                                    height: hit,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                            'assets/icons/Star.svg'),
                                                        Text(
                                                          double.parse(controller
                                                                      .businessList[
                                                                          index]
                                                                      .averageRating ??
                                                                  "0.0")
                                                              .toStringAsFixed(
                                                                  1),
                                                          style: GoogleFonts
                                                              .openSans(
                                                            color: AppColor
                                                                .black300,
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
                                  )
                            : CustomCircularIndicator(
                                color: AppColor.primary,
                              ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class ios_redeemed_offers extends GetView<RedeemedOffersController> {
  const ios_redeemed_offers({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RedeemedOffersController>(
      init: RedeemedOffersController(),
      builder: (controller) {
        return CupertinoPageScaffold(
          child: Container(
            color: AppColor.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Gap(MediaQuery.of(context).padding.top * 2),
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
                        'Redeemed Offers',
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
                            ? controller.redeemedOfferList.isEmpty
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Redeemed offer not found.",
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
                                    itemCount:
                                        controller.redeemedOfferList.length,
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    itemBuilder: (context, index) {
                                      return Container(
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
                                        padding: const EdgeInsets.all(6.0),
                                        margin:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  child: (controller
                                                                  .redeemedOfferList[
                                                                      index]
                                                                  .business
                                                                  ?.mainImage
                                                                  ?.data
                                                                  ?.data ??
                                                              [])
                                                          .isImage()
                                                      ? Icon(Icons.error)
                                                      : ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.memory(
                                                            Uint8List.fromList(
                                                              controller
                                                                  .redeemedOfferList[
                                                                      index]
                                                                  .business!
                                                                  .mainImage!
                                                                  .data!
                                                                  .data!,
                                                            ),
                                                            fit: BoxFit.cover,
                                                            width:
                                                                Get.width / 5,
                                                            height:
                                                                Get.width / 5,
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
                                                      Text(
                                                        '${controller.redeemedOfferList[index].business?.businessName ?? ""}',
                                                        style: GoogleFonts
                                                            .openSans(
                                                          color:
                                                              AppColor.black300,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis, // Ensure it does not overflow
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
                                                              '${controller.redeemedOfferList[index].business?.address ?? ""} ${controller.redeemedOfferList[index].business?.city ?? ""} ${controller.redeemedOfferList[index].business?.state ?? ""}-${controller.redeemedOfferList[index].business?.pincode}',
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
                                                  width: Get.width / 11,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/icons/Star.svg'),
                                                      Text(
                                                        '${controller.redeemedOfferList[index].averageRating ?? "0.0"}',
                                                        style: GoogleFonts
                                                            .openSans(
                                                          color:
                                                              AppColor.black300,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Description",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 17,
                                                color: AppColor.black,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "${controller.redeemedOfferList[index].description ?? ''}",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: AppColor.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Gap(8),
                                          ],
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

import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';
import '../widget/ios/offerCard.dart';

class RestaurantDetails extends GetView<AndroidBusinessDetailController> {
  const RestaurantDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<AndroidBusinessDetailController>(
      init: Get.put(AndroidBusinessDetailController()),
      // Ensure single instance
      builder: (detailController) {
        return CupertinoPageScaffold(
          child: Container(
            height: height,
            width: width,
            color: AppColor.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 26),
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
                        'Store',
                        style: TextStyle(
                          color: AppColor.black300,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(10),
                Expanded(
                  child: Obx(
                    () => detailController.isError.value
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off_rounded,
                                size: 80,
                              ),
                              Gap(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Something went wrong please try again.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : detailController.isLoaded.value
                            ? AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: (detailController.selectedIndex.value ==
                                        0)
                                    ? SingleChildScrollView(
                                        key: ValueKey<int>(detailController
                                            .selectedIndex.value),
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            detailController
                                                        .details
                                                        ?.business
                                                        ?.storeImages
                                                        ?.isEmpty ??
                                                    true
                                                ? Gap(0)
                                                : Stack(
                                                    children: [
                                                      Container(
                                                        height: height / 3.8,
                                                        width: width,
                                                        child: CarouselSlider(
                                                          options:
                                                              CarouselOptions(
                                                            viewportFraction:
                                                                1.0,
                                                            enlargeCenterPage:
                                                                false,
                                                            autoPlay: true,
                                                          ),
                                                          items:
                                                              detailController
                                                                  .details
                                                                  ?.business
                                                                  ?.storeImages!
                                                                  .map((item) =>
                                                                      Center(
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          child:
                                                                              Image.memory(
                                                                            Uint8List.fromList(item.data!.data!),
                                                                            key:
                                                                                ValueKey(
                                                                              item.data!.data!,
                                                                            ),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            height:
                                                                                height / 3.8,
                                                                            width:
                                                                                width,
                                                                          ),
                                                                        ),
                                                                      ))
                                                                  .toList(),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 14,
                                                        right: 10,
                                                        child: Container(
                                                          height: 30,
                                                          width: 100,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                AppColor.white,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                          child:
                                                              RatingBar.builder(
                                                            initialRating:
                                                                detailController
                                                                    .ratting
                                                                    .value,
                                                            minRating: 0.5,
                                                            direction:
                                                                Axis.horizontal,
                                                            allowHalfRating:
                                                                true,
                                                            itemCount: 5,
                                                            itemPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        1.0),
                                                            itemBuilder: (context,
                                                                    _) =>
                                                                Icon(Icons.star,
                                                                    color: AppColor
                                                                        .primary),
                                                            onRatingUpdate:
                                                                (rating) {},
                                                            itemSize: 16,
                                                            ignoreGestures:
                                                                true,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                            const Gap(10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () => print(
                                                      "${detailController.details?.business?.storeImages?.length}"),
                                                  child: Text(
                                                    '${detailController.details?.business?.businessName ?? ""}',
                                                    style: GoogleFonts.openSans(
                                                      color: AppColor.black300,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${detailController.ratting.value ?? ""}',
                                                  style: GoogleFonts.openSans(
                                                    color: AppColor.primary,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '${detailController.details?.business?.category ?? ""}',
                                              style: GoogleFonts.openSans(
                                                color: AppColor.gray,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const Gap(30),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // Get.toNamed('/locationios');
                                                  },
                                                  child: detailController
                                                      .buildInfoCard(
                                                    height,
                                                    width,
                                                    Icons.favorite_border,
                                                    'Like',
                                                  ),
                                                ),
                                                detailController.buildInfoCard(
                                                  height,
                                                  width,
                                                  Icons.access_alarm_rounded,
                                                  '${detailController.parseTime(detailController.details?.business?.openTime ?? "")} - ${detailController.parseTime(detailController.details?.business?.closeTime ?? "")}',
                                                ),
                                                detailController.buildInfoCard(
                                                  height,
                                                  width,
                                                  Icons.phone_in_talk,
                                                  '${detailController.details?.business?.contactNumber ?? ""}',
                                                ),
                                              ],
                                            ),
                                            const Gap(10),
                                            Row(
                                              children: [
                                                Container(
                                                  height: height / 20,
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 30,
                                                  ),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(12),
                                                      bottomRight:
                                                          Radius.circular(12),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    '${detailController.getStatus(
                                                      openTimeStr:
                                                          "${detailController.details?.business?.openTime ?? ""}"
                                                              .toUpperCase(),
                                                      closeTimeStr:
                                                          "${detailController.details?.business?.closeTime ?? ""}"
                                                              .toUpperCase(),
                                                    )}',
                                                    style: TextStyle(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Gap(20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                detailController.buildTabButton(
                                                  height,
                                                  width,
                                                  'About',
                                                  0,
                                                ),
                                                detailController.buildTabButton(
                                                  height,
                                                  width,
                                                  'Offers',
                                                  1,
                                                ),
                                                detailController.buildTabButton(
                                                  height,
                                                  width,
                                                  'Gallery',
                                                  2,
                                                ),
                                                detailController.buildTabButton(
                                                  height,
                                                  width,
                                                  'Menu',
                                                  3,
                                                ),
                                              ],
                                            ),
                                            const Gap(20),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Theme(
                                                  data: ThemeData.light(),
                                                  child: ReadMoreText(
                                                    '${detailController.details?.business?.description ?? ""} ',
                                                    trimMode: TrimMode.Line,
                                                    trimLines: 2,
                                                    colorClickableText:
                                                        AppColor.primary,
                                                    trimCollapsedText:
                                                        'Show more',
                                                    trimExpandedText:
                                                        'Show less',
                                                    moreStyle: TextStyle(
                                                      color: AppColor.primary,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    style: TextStyle(
                                                      color: AppColor.gray,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const Gap(10),
                                                Text(
                                                  'Address :',
                                                  style: GoogleFonts.openSans(
                                                    color: AppColor.primary,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const Gap(5),
                                                Text(
                                                  '${detailController.details?.business?.address ?? ""}, ${detailController.details?.business?.city ?? ""}, ${detailController.details?.business?.state ?? ""}, ${detailController.details?.business?.pincode ?? ""}',
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 15,
                                                    color: AppColor.gray,
                                                  ),
                                                ),
                                                const Gap(10),
                                                Text(
                                                  'Open Hours :',
                                                  style: GoogleFonts.openSans(
                                                    color: AppColor.primary,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                detailController
                                                                .details
                                                                ?.business
                                                                ?.offDays ==
                                                            'null' ||
                                                        detailController
                                                                .details
                                                                ?.business
                                                                ?.offDays ==
                                                            null
                                                    ? Text(
                                                        'Everyday, ${detailController.parseTime(detailController.details?.business?.openTime ?? "")} - ${detailController.parseTime(detailController.details?.business?.closeTime ?? "")}',
                                                        style: GoogleFonts
                                                            .openSans(
                                                          fontSize: 15,
                                                          color: AppColor.gray,
                                                        ),
                                                      )
                                                    : ListView.separated(
                                                        shrinkWrap: true,
                                                        padding:
                                                            EdgeInsets.all(0),
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemBuilder: (context,
                                                                index) =>
                                                            detailController
                                                                    .daysList[
                                                                index],
                                                        itemCount:
                                                            detailController
                                                                .daysList
                                                                .length,
                                                        separatorBuilder:
                                                            (context, index) =>
                                                                Gap(5),
                                                      ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    : Column(
                                        key: ValueKey<int>(detailController
                                            .selectedIndex.value),
                                        children: [
                                          const Gap(4),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              detailController.buildTabButton(
                                                height,
                                                width,
                                                'About',
                                                0,
                                              ),
                                              detailController.buildTabButton(
                                                height,
                                                width,
                                                'Offers',
                                                1,
                                              ),
                                              detailController.buildTabButton(
                                                height,
                                                width,
                                                'Gallery',
                                                2,
                                              ),
                                              detailController.buildTabButton(
                                                height,
                                                width,
                                                'Menu',
                                                3,
                                              ),
                                            ],
                                          ),
                                          const Gap(20),
                                          if (detailController
                                                  .selectedIndex.value ==
                                              1)
                                            detailController.isError1.value
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .search_off_rounded,
                                                        size: 80,
                                                      ),
                                                      Gap(10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              "Something went wrong please try again.",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                : detailController
                                                        .offerList.isEmpty
                                                    ? Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        30),
                                                            child: Text(
                                                              "Offers not found",
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : Expanded(
                                                        child: ListView.builder(
                                                          shrinkWrap: true,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return buildOfferCard(
                                                                title: detailController.calculateTimeDifference(
                                                                    createdDateStr: detailController
                                                                            .offerList[
                                                                                index]
                                                                            .createdAt ??
                                                                        "${DateTime.now()}"),
                                                                offer:
                                                                    "${detailController.offerList[index].offerPrice ?? 0}${detailController.offerList[index].offertype == "Amount" ? '₹' : '%'} off",
                                                                description:
                                                                    "${detailController.offerList[index].description ?? ""}",
                                                                discountPrice:
                                                                    "₹ ${detailController.offerList[index].paymentAmount ?? ""}/-",
                                                                originalPrice:
                                                                    "₹ ${detailController.offerList[index].productPrice ?? ""}/-",
                                                                validity:
                                                                    "${detailController.offerList[index].validOn ?? ""}",
                                                                timings:
                                                                    "${detailController.details?.business?.openTime ?? ""}-${detailController.details?.business?.closeTime ?? ""}",
                                                                button: Obx(
                                                                  () => (detailController
                                                                              .deleteCartId
                                                                              .isNotEmpty &&
                                                                          (detailController.offerList[index].sId ==
                                                                              detailController
                                                                                  .deleteCartId.value))
                                                                      ? CustomCircularIndicator(
                                                                          color: AppColor
                                                                              .primary)
                                                                      : detailController
                                                                              .getButtonName(
                                                                          offerId:
                                                                              detailController.offerList[index],
                                                                        )
                                                                          ? GestureDetector(
                                                                              onTap: () {
                                                                                detailController.addToCartItem(
                                                                                  oId: detailController.offerList[index].sId ?? "",
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                                                decoration: BoxDecoration(
                                                                                  border: Border.all(
                                                                                    color: Colors.green,
                                                                                    width: 1,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                ),
                                                                                child: Text(
                                                                                  "Add offer",
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.w700,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          : GestureDetector(
                                                                              onTap: () {
                                                                                detailController.deleteItem(
                                                                                  oId: detailController.offerList[index].sId ?? "",
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                                                decoration: BoxDecoration(
                                                                                  border: Border.all(
                                                                                    color: AppColor.red,
                                                                                    width: 1,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                ),
                                                                                child: Text(
                                                                                  "Remove offer",
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.w700,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                ));
                                                          },
                                                          itemCount:
                                                              detailController
                                                                  .offerList
                                                                  .length,
                                                        ),
                                                      ),
                                          if (detailController
                                                  .selectedIndex.value ==
                                              2)
                                            detailController
                                                        .details
                                                        ?.business
                                                        ?.storeImages
                                                        ?.isEmpty ??
                                                    true
                                                ? Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 30),
                                                    child: Text(
                                                      "Store images not found",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  )
                                                : Expanded(
                                                    child:
                                                        MasonryGridView.builder(
                                                      padding: EdgeInsets.only(
                                                          top: 4),
                                                      shrinkWrap: true,
                                                      gridDelegate:
                                                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                      ),
                                                      itemCount:
                                                          detailController
                                                                  .details
                                                                  ?.business
                                                                  ?.storeImages
                                                                  ?.length ??
                                                              0,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            Get.toNamed(
                                                              '/detail_image_view',
                                                              arguments: {
                                                                'images': detailController
                                                                    .details
                                                                    ?.business
                                                                    ?.storeImages,
                                                                'initialIndex':
                                                                    index,
                                                              },
                                                            );
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child:
                                                                  Image.memory(
                                                                Uint8List.fromList(
                                                                    detailController
                                                                        .details!
                                                                        .business!
                                                                        .storeImages![
                                                                            index]
                                                                        .data!
                                                                        .data!),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                          if (detailController
                                                  .selectedIndex.value ==
                                              3)
                                            detailController.details?.business
                                                        ?.menuImages?.isEmpty ??
                                                    true
                                                ? Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 30),
                                                    child: Text(
                                                      "Menu images not found",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  )
                                                : Expanded(
                                                    child:
                                                        MasonryGridView.builder(
                                                      padding: EdgeInsets.only(
                                                          top: 4),
                                                      shrinkWrap: true,
                                                      gridDelegate:
                                                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                      ),
                                                      itemCount:
                                                          detailController
                                                                  .details
                                                                  ?.business
                                                                  ?.menuImages
                                                                  ?.length ??
                                                              0,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            Get.toNamed(
                                                              '/detail_image_view',
                                                              arguments: {
                                                                'images': detailController
                                                                    .details
                                                                    ?.business
                                                                    ?.menuImages,
                                                                'initialIndex':
                                                                    index,
                                                              },
                                                            );
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child:
                                                                  Image.memory(
                                                                Uint8List.fromList(
                                                                    detailController
                                                                        .details!
                                                                        .business!
                                                                        .menuImages![
                                                                            index]
                                                                        .data!
                                                                        .data!),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                        ],
                                      ),
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

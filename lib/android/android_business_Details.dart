import 'dart:developer';

import 'package:pro_deals1/imports.dart';
import 'package:pro_deals1/widget/ios/offerCard.dart';

class AndroidBusinessDetails extends GetView<AndroidBusinessDetailController> {
  const AndroidBusinessDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<AndroidBusinessDetailController>(
      init: AndroidBusinessDetailController(),
      builder: (detailController) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Shop",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          actions: [
            Obx(
              () => IconButton(
                onPressed: () {
                  controller.favouriteManage();
                },
                icon: Icon(
                  controller.isFavourite.value
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                ),
              ),
            ),
          ],
          backgroundColor: const Color(0xFFD6AA26),
        ),
        backgroundColor: AppColor.white,
        body: Obx(
          () => detailController.isError.value
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
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
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : detailController.isLoaded.value
                  ? AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: (detailController.selectedIndex.value == 0)
                          ? SingleChildScrollView(
                              key: ValueKey<int>(
                                  detailController.selectedIndex.value),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  detailController.details?.business
                                              ?.storeImages?.isEmpty ??
                                          true
                                      ? Gap(0)
                                      : Container(
                                          height: height / 2.6,
                                          width: width,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 0,
                                                child: Container(
                                                  height: height / 3.4,
                                                  width: width,
                                                  child: ClipRRect(
                                                    child: Image.memory(
                                                      Uint8List.fromList(
                                                          detailController
                                                              .details!
                                                              .business!
                                                              .mainImage!
                                                              .data!
                                                              .data!),
                                                      key: ValueKey(
                                                        detailController
                                                            .details!
                                                            .business!
                                                            .mainImage!
                                                            .data!
                                                            .data!,
                                                      ),
                                                      fit: BoxFit.cover,
                                                      height: height / 3.8,
                                                      width: width,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                left: 0,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 0),
                                                  child: Container(
                                                    height: height / 4.4,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 2,
                                                          blurRadius: 2,
                                                          offset: const Offset(
                                                              0,
                                                              2), // changes position of shadow
                                                        ),
                                                      ],
                                                      color: AppColor.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    padding: EdgeInsets.all(10),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  detailController
                                                                      .details!
                                                                      .business!
                                                                      .businessName!,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                const Gap(2),
                                                                Text(
                                                                  "Category: ${detailController.details!.business!.category!}",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const Spacer(),
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: AppColor
                                                                    .primary,
                                                              ),
                                                              child: Text(
                                                                detailController
                                                                    .ratting
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: AppColor
                                                                      .black300,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const Gap(8),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                color: Colors
                                                                    .green,
                                                              ),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(6),
                                                              child: Text(
                                                                "Open Now",
                                                                style:
                                                                    TextStyle(
                                                                  color: AppColor
                                                                      .white,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            const Gap(10),
                                                            Text(
                                                              '${detailController.parseTime(detailController.details?.business?.openTime ?? "")} - ${detailController.parseTime(detailController.details?.business?.closeTime ?? "")}',
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: AppColor
                                                                    .black300,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        const Gap(8),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.location_on,
                                                            ),
                                                            const Gap(10),
                                                            Expanded(
                                                              child: Text(
                                                                detailController
                                                                    .details!
                                                                    .business!
                                                                    .address!,
                                                                style: GoogleFonts
                                                                    .openSans(
                                                                  fontSize: 16,
                                                                  color: AppColor
                                                                      .black300,
                                                                ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const Gap(8),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.call,
                                                            ),
                                                            const Gap(10),
                                                            Text(
                                                              "+91 ${detailController.details!.business!.contactNumber!}",
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                fontSize: 16,
                                                                color: AppColor
                                                                    .black300,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                  const Gap(10),
                                  //----------------
                                  const Gap(20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Row(
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
                                  ),
                                  const Gap(20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ReadMoreText(
                                          '${detailController.details?.business?.description ?? ""}',
                                          trimMode: TrimMode.Line,
                                          trimLines: 2,
                                          colorClickableText: AppColor.black,
                                          trimCollapsedText: 'Show more',
                                          trimExpandedText: 'Show less',
                                          moreStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Address',
                                          style: GoogleFonts.openSans(
                                            color: AppColor.black300,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Gap(5),
                                        Text(
                                          '${detailController.details?.business?.address ?? ""}\n${detailController.details?.business?.city ?? ""}, ${detailController.details?.business?.state ?? ""} ${detailController.details?.business?.pincode ?? ""}',
                                          style: GoogleFonts.openSans(
                                            color: AppColor.black300,
                                          ),
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Open Hours',
                                          style: GoogleFonts.openSans(
                                            color: AppColor.black300,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Gap(5),
                                        detailController.details?.business
                                                        ?.offDays ==
                                                    'null' ||
                                                detailController.details
                                                        ?.business?.offDays ==
                                                    null
                                            ? Text(
                                                'Everyday, ${detailController.parseTime(detailController.details?.business?.openTime ?? "")} - ${detailController.parseTime(detailController.details?.business?.closeTime ?? "")}',
                                                style: GoogleFonts.openSans(
                                                  color: AppColor.black300,
                                                ),
                                              )
                                            : ListView.separated(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) =>
                                                    detailController
                                                        .daysList[index],
                                                itemCount: detailController
                                                    .daysList.length,
                                                separatorBuilder:
                                                    (context, index) => Gap(5),
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                key: ValueKey<int>(
                                    detailController.selectedIndex.value),
                                children: [
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
                                  if (detailController.selectedIndex.value == 1)
                                    detailController.isError1.value
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.search_off_rounded,
                                                size: 80,
                                              ),
                                              Gap(10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Something went wrong please try again.",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : detailController.offerList.isEmpty
                                            ? Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 30),
                                                child: Text(
                                                  "Offers not found",
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              )
                                            : Expanded(
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return buildOfferCard(
                                                      title: detailController
                                                          .calculateTimeDifference(
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
                                                                (detailController
                                                                        .offerList[
                                                                            index]
                                                                        .sId ==
                                                                    detailController
                                                                        .deleteCartId
                                                                        .value))
                                                            ? CustomCircularIndicator(
                                                                color: AppColor
                                                                    .primary)
                                                            : detailController
                                                                    .getButtonName(
                                                                offerId:
                                                                    detailController
                                                                            .offerList[
                                                                        index],
                                                              )
                                                                ? GestureDetector(
                                                                    onTap: () {
                                                                      log(UserDataStorageServices.readData(
                                                                              key: UserStorageDataKeys.isPremium)
                                                                          .toString());
                                                                      if (UserDataStorageServices.readData(
                                                                              key: UserStorageDataKeys.isPremium) ==
                                                                          true) {
                                                                        detailController
                                                                            .addToCartItem(
                                                                          oId: detailController.offerList[index].sId ??
                                                                              "",
                                                                        );
                                                                      } else {
                                                                        showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return Dialog(
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(16),
                                                                              ),
                                                                              child: Container(
                                                                                padding: const EdgeInsets.all(20),
                                                                                width: MediaQuery.of(context).size.width * 0.8,
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: Alignment.topRight,
                                                                                      child: InkWell(
                                                                                        onTap: () => Navigator.pop(context),
                                                                                        child: Icon(Icons.close, size: 20),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      "UPGRADE TO PREMIUM!",
                                                                                      style: TextStyle(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontSize: 18,
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(height: 10),
                                                                                    Text(
                                                                                      "It is a long established fact that a reader will be distracted by the readable content of a page...",
                                                                                      style: TextStyle(color: Colors.grey[700]),
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                    SizedBox(height: 20),
                                                                                    Align(
                                                                                      alignment: Alignment.centerLeft,
                                                                                      child: Column(
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text("Premium Benefits:", style: TextStyle(fontWeight: FontWeight.bold)),
                                                                                          SizedBox(height: 8),
                                                                                          Text("• Access to all premium content"),
                                                                                          Text("• Ad-free browsing experience"),
                                                                                          Text("• Exclusive early access to new features"),
                                                                                          Text("• Priority customer support"),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(height: 20),
                                                                                    ElevatedButton(
                                                                                      style: ElevatedButton.styleFrom(
                                                                                        minimumSize: Size(double.infinity, 48),
                                                                                        backgroundColor: Colors.amber,
                                                                                        foregroundColor: Colors.black,
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                      ),
                                                                                      onPressed: () {
                                                                                        Get.back();
                                                                                        Get.toNamed("/Premium");
                                                                                        // Trigger upgrade logic
                                                                                      },
                                                                                      child: Text("Upgrade Now"),
                                                                                    ),
                                                                                    SizedBox(height: 10),
                                                                                    OutlinedButton(
                                                                                      style: OutlinedButton.styleFrom(
                                                                                        minimumSize: Size(double.infinity, 48),
                                                                                        side: BorderSide(color: Colors.amber),
                                                                                        foregroundColor: Colors.black,
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                      ),
                                                                                      onPressed: () => Navigator.pop(context),
                                                                                      child: Text("Close"),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10,
                                                                          vertical:
                                                                              5),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Colors.green,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        "Add to cart",
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                : GestureDetector(
                                                                    onTap: () {
                                                                      detailController
                                                                          .deleteItem(
                                                                        oId: detailController.offerList[index].sId ??
                                                                            "",
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10,
                                                                          vertical:
                                                                              5),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              AppColor.red,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        "Remove from cart",
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                      ),
                                                    );
                                                  },
                                                  itemCount: detailController
                                                      .offerList.length,
                                                ),
                                              ),
                                  if (detailController.selectedIndex.value == 2)
                                    detailController.details?.business
                                                ?.storeImages?.isEmpty ??
                                            true
                                        ? Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 30),
                                            child: Text(
                                              "Store images not found",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        : Expanded(
                                            child: MasonryGridView.builder(
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                              ),
                                              itemCount: detailController
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
                                                        'images':
                                                            detailController
                                                                .details
                                                                ?.business
                                                                ?.storeImages,
                                                        'initialIndex': index,
                                                      },
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.memory(
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
                                  if (detailController.selectedIndex.value == 3)
                                    detailController.details?.business
                                                ?.menuImages?.isEmpty ??
                                            true
                                        ? Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 30),
                                            child: Text(
                                              "Menu images not found",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        : Expanded(
                                            child: MasonryGridView.builder(
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                              ),
                                              itemCount: detailController
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
                                                        'images':
                                                            detailController
                                                                .details
                                                                ?.business
                                                                ?.menuImages,
                                                        'initialIndex': index,
                                                      },
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.memory(
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
                            ),
                    )
                  : CustomCircularIndicator(
                      color: AppColor.primary,
                    ),
        ),
      ),
    );
  }
}

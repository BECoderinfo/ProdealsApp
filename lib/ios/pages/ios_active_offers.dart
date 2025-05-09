import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';
import '../../widget/cupertino_my_drawer.dart';

class IosActive extends GetView<ActiveOfferController> {
  const IosActive({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<ActiveOfferController>(
        init: ActiveOfferController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Container(
                  height: 40,
                  width: 40,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: ClipOval(
                      child: Image.memory(
                        Uint8List.fromList(UserDataStorageServices.readData(
                                key: UserStorageDataKeys.businessImage)
                            .where((element) =>
                                element is int ||
                                element is String ||
                                element is double)
                            .map<int>((element) {
                          if (element is String) {
                            return int.tryParse(element) ?? 0;
                          } else if (element is double) {
                            return element.toInt();
                          }
                          return element as int;
                        }).toList()),
                        fit: BoxFit.cover,
                        key: ValueKey('memoryImage'),
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/profile_image.png',
                            key: ValueKey('errorImage'),
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const Gap(20),
              ],
            ),
            drawer: C_drawer(height, width),
            body: CupertinoPageScaffold(
              child: Container(
                height: height,
                width: width,
                color: AppColor.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      Text(
                        "ACTIVE OFFERS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.black300,
                        ),
                      ),
                      const Gap(20),
                      CupertinoFormRow(
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.memory(
                                  Uint8List.fromList(
                                    UserDataStorageServices.readData(
                                            key: UserStorageDataKeys
                                                .businessImage)
                                        .where((element) =>
                                            element is int ||
                                            element is String ||
                                            element is double)
                                        .map<int>((element) {
                                      if (element is String) {
                                        return int.tryParse(element) ?? 0;
                                      } else if (element is double) {
                                        return element.toInt();
                                      }
                                      return element as int;
                                    }).toList(),
                                  ),
                                  fit: BoxFit.cover,
                                  key: ValueKey('memoryImage'),
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/profile_image.png',
                                      key: ValueKey('errorImage'),
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          "${UserDataStorageServices.readData(key: UserStorageDataKeys.businessName) ?? ""}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(4),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.grey,
                                        size: 14,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${UserDataStorageServices.readData(key: UserStorageDataKeys.businessAddress) ?? ""}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(4),
                                  Row(
                                    children: [
                                      Text(
                                        "${double.parse("${UserDataStorageServices.readData(key: UserStorageDataKeys.businessRatting) ?? "0"}").toStringAsFixed(1)}",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Gap(5),
                                      RatingBar.builder(
                                        itemBuilder: (context, index) {
                                          return Icon(
                                            Icons.star,
                                            color: Color(0xFFD6AA26),
                                            size: 16,
                                          );
                                        },
                                        onRatingUpdate: (value) {},
                                        ignoreGestures: true,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        updateOnDrag: false,
                                        initialRating: double.parse(
                                            "${UserDataStorageServices.readData(key: UserStorageDataKeys.businessRatting) ?? "0"}"),
                                        itemSize: 16,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(10),
                      Obx(
                        () => Expanded(
                          child: controller.isError.value
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        Gap(20),
                                        Expanded(
                                          child: Text(
                                            "Something went wrong please try again.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Gap(20),
                                      ],
                                    ),
                                  ],
                                )
                              : !controller.isLoaded.value
                                  ? CustomCircularIndicator(
                                      color: AppColor.primary)
                                  : controller.offerList.isEmpty
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Gap(20),
                                                Expanded(
                                                  child: Text(
                                                    "Active offers not found.",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                Gap(20),
                                              ],
                                            ),
                                          ],
                                        )
                                      : ListView.separated(
                                          itemBuilder: (context, index) {
                                            return Card(
                                              elevation: 1,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              color: Colors.white,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 15,
                                                  left: 15,
                                                  right: 15,
                                                  bottom: 10,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          controller.calculateTimeDifference(
                                                              createdDateStr: controller
                                                                      .offerList[
                                                                          index]
                                                                      .createdAt ??
                                                                  "${DateTime.now()}"),
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Container(
                                                          height: 18,
                                                          width: 36,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xFFD6AA26),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "${controller.offerList[index].offerPrice ?? "0"}${controller.offerList[index].offertype == "Amount" ? '₹' : '%'} off",
                                                              style: TextStyle(
                                                                fontSize: 8,
                                                                color: Color(
                                                                    0xFFD6AA26),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Gap(8),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.offerList[index].description ?? ""}",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        Gap(15),
                                                        Column(
                                                          children: [
                                                            Text(
                                                              "₹ ${controller.offerList[index].paymentAmount ?? ""}/-",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            Text(
                                                              "₹ ${controller.offerList[index].productPrice ?? ""}/-",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .grey),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    const Gap(10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "${controller.offerList[index].validOn ?? ""}",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            Text(
                                                              "${UserDataStorageServices.readData(key: UserStorageDataKeys.businessTime) ?? ""}",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ],
                                                        ),
                                                        Obx(
                                                          () => controller
                                                                  .isProcess
                                                                  .value
                                                              ? CustomCircularIndicator(
                                                                  color: AppColor
                                                                      .primary)
                                                              : GestureDetector(
                                                                  onTap: () {
                                                                    controller
                                                                        .isProcess
                                                                        .value;
                                                                    controller
                                                                        .manageOffer(
                                                                      index:
                                                                          index,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .symmetric(
                                                                      horizontal:
                                                                          10,
                                                                      vertical:
                                                                          5,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: AppColor
                                                                          .primary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child: Text(
                                                                      "Disable offer",
                                                                      style:
                                                                          TextStyle(
                                                                        color: AppColor
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) =>
                                              Gap(15),
                                          itemCount:
                                              controller.offerList.length,
                                        ),
                        ),
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

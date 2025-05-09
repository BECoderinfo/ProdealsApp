import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/widget/cupertino_my_drawer.dart';
import '../../imports.dart';

class ios_manageoffer extends GetView<ManageOfferController> {
  const ios_manageoffer({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset(
            'assets/images/profile_image.png',
            width: 60,
            height: 60,
          ),
          Gap(20),
        ],
      ),
      drawer: C_drawer(hit, wid),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.primary,
        onPressed: () {
          Get.toNamed(
            '/add_update_offer',
            arguments: {
              'isEdit': false,
            },
          )?.then(
            (value) {
              if (value ?? false) {
                controller.getAllOffer(
                    bId: UserDataStorageServices.readData(
                          key: UserStorageDataKeys.businessId,
                        ) ??
                        "");
              }
            },
          );
        },
        label: Text(
          "Add offer",
          style: TextStyle(color: AppColor.white),
        ),
        icon: Icon(
          Icons.add_rounded,
          color: AppColor.white,
        ),
      ),
      body: GetBuilder<ManageOfferController>(
          init: ManageOfferController(),
          builder: (offerController) {
            return CupertinoPageScaffold(
              child: Container(
                height: hit,
                width: wid,
                color: AppColor.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      Text(
                        "MANAGE OFFERS",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black300),
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
                        () => offerController.isError.value
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
                            : !offerController.isLoaded.value
                                ? CustomCircularIndicator(
                                    color: AppColor.primary)
                                : offerController.offerList.isEmpty
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
                                                  "Offers not found.",
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
                                        shrinkWrap: true,
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
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        offerController.calculateTimeDifference(
                                                            createdDateStr: offerController
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
                                                                  .circular(3),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "${offerController.offerList[index].offerPrice ?? "0"}${offerController.offerList[index].offertype == "Amount" ? '₹' : '%'} off",
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
                                                          "${offerController.offerList[index].description ?? ""}",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                      Gap(15),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "₹ ${offerController.offerList[index].paymentAmount ?? ""}/-",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          Text(
                                                            "₹ ${offerController.offerList[index].productPrice ?? ""}/-",
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
                                                            "${offerController.offerList[index].validOn ?? ""}",
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
                                                        () => offerController
                                                                .isProcess.value
                                                            ? CustomCircularIndicator(
                                                                color: AppColor
                                                                    .primary)
                                                            : PopupMenuButton(
                                                                offset: Offset(
                                                                    0, 35),
                                                                onSelected:
                                                                    (value) {
                                                                  if (value ==
                                                                      3) {
                                                                    controller
                                                                        .isProcess
                                                                        .value;
                                                                    controller
                                                                        .manageOffer(
                                                                      index:
                                                                          index,
                                                                    );
                                                                  } else if (value ==
                                                                      2) {
                                                                    controller
                                                                        .isProcess
                                                                        .value;
                                                                    controller
                                                                        .deleteOffer(
                                                                      index:
                                                                          index,
                                                                    );
                                                                  } else if (value ==
                                                                      1) {
                                                                    Get.toNamed(
                                                                      '/add_update_offer',
                                                                      arguments: {
                                                                        'isEdit':
                                                                            true,
                                                                        'data':
                                                                            offerController.offerList[index],
                                                                      },
                                                                    )?.then(
                                                                      (value) {
                                                                        if (value ??
                                                                            false) {
                                                                          controller.getAllOffer(
                                                                              bId: UserDataStorageServices.readData(
                                                                                    key: UserStorageDataKeys.businessId,
                                                                                  ) ??
                                                                                  "");
                                                                        }
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                                itemBuilder:
                                                                    (context) {
                                                                  return [
                                                                    PopupMenuItem(
                                                                      value: 1,
                                                                      child: Text(
                                                                          "Update"),
                                                                    ),
                                                                    PopupMenuItem(
                                                                      value: 2,
                                                                      child: Text(
                                                                          "Delete"),
                                                                    ),
                                                                    PopupMenuItem(
                                                                        value:
                                                                            3,
                                                                        child: Text(
                                                                            "${offerController.offerList[index].isActive ?? true ? 'Disable offer' : 'Enable offer'}"))
                                                                  ];
                                                                },
                                                                icon: Icon(Icons
                                                                    .more_vert_rounded),
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
                                            Gap(10),
                                        itemCount:
                                            offerController.offerList.length,
                                      ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

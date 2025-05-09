import 'package:pro_deals1/imports.dart';

class ManageBannerScreen extends GetView<ManageBannerController> {
  const ManageBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return GetBuilder<ManageBannerController>(
      init: ManageBannerController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              BusinessImage.mainStoreImageWidget(),
              const Gap(16),
            ],
            elevation: 0,
          ),
          drawer: drawer(hit, wid),
          floatingActionButton: Obx(
            () => controller.isProcess.value && controller.bId.isEmpty
                ? Gap(10)
                : FloatingActionButton.extended(
                    backgroundColor: AppColor.primary,
                    onPressed: () {
                      controller.selectedBanner.value = null;
                      controller.selectedOffer.value = null;
                      controller.selectedType.value = null;
                      controller.showAddUpdateBannerDialog(
                        ctx: context,
                        title: "Request banner",
                        wid: wid,
                      );
                    },
                    label: Text(
                      "Request banner",
                      style: TextStyle(color: AppColor.white),
                    ),
                    icon: Icon(
                      Icons.add_rounded,
                      color: AppColor.white,
                    ),
                  ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "MANAGE BANNER IMAGES",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Gap(20),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.memory(
                          Uint8List.fromList(
                            UserDataStorageServices.readData(
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
                const Gap(20),
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
                        : !controller.isLoaded.value
                            ? CustomCircularIndicator(color: AppColor.primary)
                            : controller.bannerList.isEmpty
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Gap(20),
                                          Expanded(
                                            child: Text(
                                              "Banner image not found.",
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
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.memory(
                                                  Uint8List.fromList(
                                                    controller.bannerList[index]
                                                        .image!.data!,
                                                  ),
                                                  width: wid,
                                                  height: wid * 0.35,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const Gap(10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Offer description",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    "${controller.bannerList[index].offerId?.description ?? ''}",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              const Gap(10),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Banner type",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          "${controller.getBannerTypeName(type: controller.bannerList[index].type ?? '0')}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Status",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          "${controller.bannerList[index].status ?? ""}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
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
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Offer expiry date",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      Text(
                                                        "${DateFormat('MMM dd, yyyy').format(DateTime.parse(controller.bannerList[index].offerId?.expiryDate ?? "${DateTime.now()}"))}",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                  Obx(
                                                    () => controller.isProcess
                                                                .value &&
                                                            controller.bId
                                                                    .value ==
                                                                controller
                                                                    .bannerList[
                                                                        index]
                                                                    .sId
                                                        ? CustomCircularIndicator(
                                                            color: AppColor
                                                                .primary)
                                                        : PopupMenuButton(
                                                            offset:
                                                                Offset(0, 35),
                                                            onSelected:
                                                                (value) {
                                                              if (value == 2) {
                                                                controller
                                                                    .isProcess
                                                                    .value = true;
                                                                controller
                                                                    .deleteBanner(
                                                                  index: index,
                                                                );
                                                              } else if (value ==
                                                                  1) {
                                                                controller
                                                                    .selectedBanner
                                                                    .value = null;
                                                                controller
                                                                        .selectedOffer
                                                                        .value =
                                                                    controller
                                                                        .offerList
                                                                        .where(
                                                                          (value) =>
                                                                              value.sId ==
                                                                              controller.bannerList[index].offerId?.sId,
                                                                        )
                                                                        .first;
                                                                controller
                                                                        .selectedType
                                                                        .value =
                                                                    controller.getBannerTypeName(
                                                                        type: controller.bannerList[index].type ??
                                                                            '');
                                                                controller
                                                                    .showAddUpdateBannerDialog(
                                                                  ctx: context,
                                                                  index: index,
                                                                  title:
                                                                      "Request banner",
                                                                  wid: wid,
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
                                        Gap(15),
                                    itemCount: controller.bannerList.length,
                                  ),
                  ),
                ),
                const Gap(50),
              ],
            ),
          ),
        );
      },
    );
  }
}

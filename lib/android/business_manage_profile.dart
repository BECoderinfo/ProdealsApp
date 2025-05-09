import 'package:pro_deals1/imports.dart';

class BusinessManageProfile extends GetView<BusinessManageProfileController> {
  const BusinessManageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final BusinessManageProfileController manageProfileController =
        Get.put(BusinessManageProfileController());
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          BusinessImage.mainStoreImageWidget(),
          const Gap(16),
        ],
        title: const Text(
          "MANAGE PROFILE",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      drawer: drawer(hit, wid),
      floatingActionButton: Theme(
        data: ThemeData(
          useMaterial3: false,
        ),
        child: FloatingActionButton(
          onPressed: () {
            data = manageProfileController.details?.business;
            Get.toNamed(
              '/edit_business_profile',
            )?.then(
              (value) {
                manageProfileController.getBusinessData(
                  bId: UserDataStorageServices.readData(
                        key: UserStorageDataKeys.businessId,
                      ) ??
                      "",
                );
              },
            );
          },
          backgroundColor: AppColor.primary,
          child: Icon(Icons.edit),
        ),
      ),
      body: Obx(
        () => manageProfileController.isError.value
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
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Gap(20),
                    ],
                  ),
                ],
              )
            : !manageProfileController.isLoaded.value
                ? CustomCircularIndicator(color: AppColor.primary)
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          controller: manageProfileController.s,
                          scrollDirection: Axis.horizontal,
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 500),
                            child: Row(
                              children: [
                                manageProfileController.tabMenu(
                                  index: 0,
                                  name: "Personal information",
                                ),
                                Gap(10),
                                manageProfileController.tabMenu(
                                  index: 1,
                                  name: "Business address",
                                ),
                                Gap(10),
                                manageProfileController.tabMenu(
                                  index: 2,
                                  name: "Profession profile",
                                ),
                                Gap(10),
                                manageProfileController.tabMenu(
                                  index: 3,
                                  name: "Store images",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: PageView(
                            controller: manageProfileController.p,
                            onPageChanged: (index) {
                              if (manageProfileController.isTapped.value)
                                return;
                              if (index == 0 || index == 1) {
                                manageProfileController.s
                                    .animateTo(
                                  0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                )
                                    .then(
                                  (value) {
                                    manageProfileController
                                        .selectedIndex.value = index;
                                  },
                                );
                              } else {
                                manageProfileController.s
                                    .animateTo(
                                  manageProfileController
                                      .s.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                )
                                    .then(
                                  (value) {
                                    manageProfileController
                                        .selectedIndex.value = index;
                                  },
                                );
                              }
                            },
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gap(15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipOval(
                                          child: (controller
                                                          .details
                                                          ?.business
                                                          ?.mainImage
                                                          ?.data
                                                          ?.data ??
                                                      [])
                                                  .isImage()
                                              ? Image.asset(
                                                  'assets/images/profile_image.png',
                                                  key: ValueKey('errorImage'),
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.memory(
                                                  Uint8List.fromList(
                                                    controller
                                                        .details!
                                                        .business!
                                                        .mainImage!
                                                        .data!
                                                        .data!,
                                                  ),
                                                  height: 120,
                                                  width: 120,
                                                  fit: BoxFit.cover,
                                                  key: ValueKey('memoryImage'),
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Image.asset(
                                                      'assets/images/profile_image.png',
                                                      key: ValueKey(
                                                          'errorImage'),
                                                      fit: BoxFit.cover,
                                                    );
                                                  },
                                                ),
                                        )
                                      ],
                                    ),
                                    manageProfileController.summryWidget(
                                      title: "Business name",
                                      value:
                                          "${manageProfileController.details?.business?.businessName ?? ""}",
                                    ),
                                    manageProfileController.summryWidget(
                                      title: "Business phone",
                                      value:
                                          "${manageProfileController.details?.business?.contactNumber ?? ""}",
                                    ),
                                    manageProfileController.summryWidget(
                                      title: "Business category",
                                      value:
                                          "${manageProfileController.details?.business?.category ?? ""}",
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    manageProfileController.summryWidget(
                                      title: "Business Address",
                                      value:
                                          "${manageProfileController.details?.business?.address ?? ""}",
                                    ),
                                    manageProfileController.summryWidget(
                                      title: "City",
                                      value:
                                          "${manageProfileController.details?.business?.city ?? ""}",
                                    ),
                                    manageProfileController.summryWidget(
                                      title: "State",
                                      value:
                                          "${manageProfileController.details?.business?.state ?? ""}",
                                    ),
                                    manageProfileController.summryWidget(
                                      title: "Pincode",
                                      value:
                                          "${manageProfileController.details?.business?.pincode ?? ""}",
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    manageProfileController.summryWidget(
                                      title: "Area in SQFT",
                                      value:
                                          "${manageProfileController.details?.business?.areaSqures ?? ""}",
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: manageProfileController
                                              .summryWidget(
                                            title: "Open time",
                                            value:
                                                "${manageProfileController.details?.business?.openTime ?? ""}",
                                          ),
                                        ),
                                        Expanded(
                                          child: manageProfileController
                                              .summryWidget(
                                            title: "Close time",
                                            value:
                                                "${manageProfileController.details?.business?.closeTime ?? ""}",
                                          ),
                                        ),
                                      ],
                                    ),
                                    manageProfileController.details?.business
                                                    ?.offDays ==
                                                null ||
                                            manageProfileController.details
                                                    ?.business?.offDays ==
                                                ""
                                        ? Gap(0)
                                        : manageProfileController.summryWidget(
                                            title: "Close days",
                                            value:
                                                "${manageProfileController.details?.business?.offDays ?? ""}",
                                          ),
                                    manageProfileController.summryWidget(
                                      title: "Description",
                                      value:
                                          "${manageProfileController.details?.business?.description ?? ""}",
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gap(15),
                                    manageProfileController.details?.business
                                                ?.storeImages?.isEmpty ??
                                            true
                                        ? Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 35,
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Store images not found.",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          )
                                        : Gap(0),
                                    Wrap(
                                      children: [
                                        for (int i = 0;
                                            i <
                                                (manageProfileController
                                                        .details
                                                        ?.business
                                                        ?.storeImages
                                                        ?.length ??
                                                    0);
                                            i++)
                                          GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                '/detail_image_view',
                                                arguments: {
                                                  'images':
                                                      manageProfileController
                                                          .details
                                                          ?.business
                                                          ?.storeImages,
                                                  'initialIndex': i,
                                                },
                                              );
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                bottom: 10,
                                                right:
                                                    (i + 1) % 3 == 0 ? 0 : 10,
                                              ),
                                              height: (Get.width - 52) / 3,
                                              width: (Get.width - 52) / 3,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.memory(
                                                  Uint8List.fromList(
                                                      manageProfileController
                                                          .details!
                                                          .business!
                                                          .storeImages![i]
                                                          .data!
                                                          .data!),
                                                  fit: BoxFit.cover,
                                                  key: ValueKey('memoryImage'),
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Icon(
                                                      Icons.error,
                                                      size: 20,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}

import 'package:pro_deals1/imports.dart';

import '../widget/android_drawer.dart';

class home_page extends GetView<HomePageController> {
  const home_page({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (hController) {
        return Scaffold(
          appBar: AppBar(
            title: GestureDetector(
              onTap: () {
                hController.openCityListSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Text('${hController.cityName.value}'),
                  ),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
            backgroundColor: AppColor.primary,
            centerTitle: true,
            actions: [
              Gap(20),
            ],
          ),
          drawer: drawer1(hit, wid),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => hController.isErrorInBannerLoading.value
                      ? Gap(0)
                      : hController.isBannerLoaded.value
                          ? hController.slider1BannerList.isEmpty
                              ? Gap(0)
                              : AnimatedBuilder(
                                  animation: hController.slider1Index,
                                  builder: (context, child) {
                                    return Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        CarouselSlider(
                                          options: CarouselOptions(
                                            viewportFraction: 1.0,
                                            enlargeCenterPage: false,
                                            autoPlay: true,
                                            onPageChanged: (index, reason) {
                                              hController.slider1Index.value =
                                                  index;
                                            },
                                          ),
                                          items: hController.slider1BannerList
                                              .map((item) => Container(
                                                    child: Center(
                                                        child: Image.memory(
                                                      Uint8List.fromList(
                                                          item.image!.data!),
                                                      key: ValueKey(
                                                        item.image!.data!,
                                                      ),
                                                      fit: BoxFit.fill,
                                                      height: hit / 3.4,
                                                    )),
                                                  ))
                                              .toList(),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: hController
                                                .slider1BannerList
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                              return GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  width: 10.0,
                                                  height: 10.0,
                                                  margin: EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 4.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: hController
                                                                .slider1Index
                                                                .value ==
                                                            entry.key
                                                        ? AppColor.primary
                                                        : Colors.grey,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                              child: CustomCircularIndicator(
                                color: AppColor.primary,
                              ),
                            ),
                ),
                const Gap(20),
                Obx(
                  () => hController.categoryList.isEmpty
                      ? Gap(0)
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Category',
                                style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // InkWell(
                              //   onTap: () {
                              //     Get.toNamed('/Categories');
                              //   },
                              //   child: Text(
                              //     'See All',
                              //     style: GoogleFonts.openSans(
                              //       fontSize: 14,
                              //       color: AppColor.primary,
                              //       // fontWeight: FontWeight.bold,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                ),
                Obx(
                  () =>
                      hController.categoryList.isEmpty ? Gap(0) : const Gap(20),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: hit / 6 + 10,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.none,
                          // 👈 prevents the clipping of shadow
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  '/category_detail_screen',
                                  arguments: hController
                                          .categoryList[index].category ??
                                      "",
                                );
                              },
                              child: Container(
                                height: hit / 6,
                                width: wid / 3.6,
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '${hController.categoryList[index].category ?? ""}',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.openSans(
                                                color: Colors.primaries[index],
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            height: (hit / 6) / 2,
                                            width: wid / 3.6,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                              ),
                                              color: AppColor.white,
                                            ),
                                            child: Image.memory(
                                              Uint8List.fromList(hController
                                                  .categoryList[index]
                                                  .image!
                                                  .data!),
                                              fit: BoxFit.cover,
                                            ),
                                            clipBehavior: Clip.antiAlias,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: (hit / 6) / 3.4,
                                      width: wid / 3.6,
                                      decoration: BoxDecoration(
                                        color: Colors.primaries[index],
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Container(
                                      height: (hit / 6) / 3.9,
                                      width: wid / 3.6,
                                      alignment: Alignment.center,
                                      child: ClipOval(
                                        child: Image.memory(
                                          Uint8List.fromList(
                                            hController.categoryList[index]
                                                .icon!.data!,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      decoration: const BoxDecoration(
                                        // color: Color(0xff477D32),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Gap(16),
                          itemCount: hController.categoryList.length),
                    ),
                  ),
                ),
                const Gap(20),
                Obx(
                  () => hController.foodTypeList.isEmpty
                      ? Gap(0)
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Food types',
                                style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
                Obx(
                  () =>
                      hController.foodTypeList.isEmpty ? Gap(0) : const Gap(20),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Obx(
                    () => hController.isErrorInFoodTypeLoading.value
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
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
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : hController.isFoodTypeLoaded.value
                            ? hController.foodTypeList.isEmpty
                                ? Gap(0)
                                : Container(
                                    height: 100,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Expanded(
                                              child: ClipOval(
                                                child: Image.memory(
                                                  Uint8List.fromList(hController
                                                      .foodTypeList[index]
                                                      .image!
                                                      .data!),
                                                  height: 80,
                                                  width: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Gap(5),
                                            Container(
                                              width: 100,
                                              child: Text(
                                                "${hController.foodTypeList[index].foodType ?? ""}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.openSans(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          Gap(16),
                                      itemCount:
                                          hController.foodTypeList.length,
                                    ),
                                  )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                ),
                                child: CustomCircularIndicator(
                                  color: AppColor.primary,
                                ),
                              ),
                  ),
                ),
                Obx(
                  () => hController.isErrorInBannerLoading.value
                      ? Gap(0)
                      : hController.isBannerLoaded.value
                          ? hController.slider2BannerList.isEmpty
                              ? Gap(0)
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      viewportFraction: 1,
                                      enlargeCenterPage: false,
                                      autoPlay: true,
                                    ),
                                    items: hController.slider2BannerList
                                        .map(
                                          (item) => Center(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.memory(
                                                Uint8List.fromList(
                                                    item.image!.data!),
                                                key: ValueKey(
                                                  item.image!.data!,
                                                ),
                                                fit: BoxFit.cover,
                                                height: 140,
                                                width: wid - 50,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                )
                          : Gap(0),
                ),
                const Gap(20),
                Obx(
                  () => hController.businessList.isEmpty
                      ? Gap(0)
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Popular Business',
                                style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Text(
                              //   'See All',
                              //   style: GoogleFonts.openSans(
                              //     fontSize: 14,
                              //     color: AppColor.primary,
                              //     // fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                ),
                Obx(
                  () =>
                      hController.businessList.isEmpty ? Gap(0) : const Gap(20),
                ),
                Obx(
                  () => hController.isErrorInBusinessLoading.value
                      ? Padding(
                          padding: const EdgeInsets.all(20.0),
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
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : hController.isBusinessLoaded.value
                          ? hController.businessList.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20.0,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Businesses not found.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: ListView.separated(
                                    itemCount: hController.businessList.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.toNamed('/and_restaurant_details',
                                              arguments: {
                                                'rId': hController
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
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xfff9f9f9),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColor.gray,
                                                blurRadius: 2,
                                                offset: const Offset(0.5, 0.5),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 8),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 4,
                                                  child: Container(
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      color: AppColor.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    child: Image.memory(
                                                      Uint8List.fromList(
                                                        hController
                                                            .businessList[index]
                                                            .mainImage!
                                                            .data!
                                                            .data!,
                                                      ),
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Gap(10),
                                                Expanded(
                                                  flex: 7,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        hController
                                                                .businessList[
                                                                    index]
                                                                .businessName ??
                                                            "",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${hController.businessList[index].address}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      Text(
                                                        "⭐ ${hController.businessList[index].averageRating!.toStringAsFixed(1)}",
                                                        style: TextStyle(
                                                          color:
                                                              AppColor.primary,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        Gap(10),

                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    // scrollDirection: Axis.horizontal,
                                  ),
                                )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                              child: CustomCircularIndicator(
                                color: AppColor.primary,
                              ),
                            ),
                ),
                const Gap(10),
                Obx(
                  () => hController.isErrorInBannerLoading.value
                      ? Gap(0)
                      : hController.isBannerLoaded.value
                          ? hController.slider3BannerList.isEmpty
                              ? Gap(0)
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      viewportFraction: 1.0,
                                      autoPlay: true,
                                    ),
                                    items: hController.slider3BannerList
                                        .map(
                                          (item) => Center(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.memory(
                                                Uint8List.fromList(
                                                    item.image!.data!),
                                                key: ValueKey(
                                                  item.image!.data!,
                                                ),
                                                fit: BoxFit.cover,
                                                height: 140,
                                                width: wid - 50,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                )
                          : Gap(0),
                ),
              ],
            ),
          ),
          floatingActionButton: (UserDataStorageServices.readData(
                      key: UserStorageDataKeys.isPremium) !=
                  true)
              ? Theme(
                  data: ThemeData(
                    useMaterial3: false,
                  ),
                  child: FloatingActionButton(
                    onPressed: () {
                      Get.toNamed("/Premium");
                    },
                    backgroundColor: AppColor.primary,
                    child: SvgPicture.asset('assets/icons/Vector.svg'),
                  ),
                )
              : Gap(0),
        );
      },
    );
  }
}

extension on String {
  toStringAsFixed(int i) {
    return double.parse(this).toStringAsFixed(i);
  }
}

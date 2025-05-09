import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:pro_deals1/widget/cupertino_drawer.dart';
import 'package:pro_deals1/imports.dart';

class ios_home extends GetView<HomePageController> {
  const ios_home({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (hController) {
        return Scaffold(
          key: hController.scaffoldKey,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                hController.scaffoldKey.currentState!.openEndDrawer();
              },
            ),
            title: GestureDetector(
              onTap: () {
                hController.openCityListSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/location.svg'),
                  Obx(
                    () => Text(
                      '${hController.cityName.value}',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColor.black300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () {
                  Get.toNamed('/ios_cart');
                },
                child: Icon(CupertinoIcons.cart),
              ),
              Gap(20),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.antiAlias,
                child: UserDataStorageServices.checkIfExist(
                        key: UserStorageDataKeys.imageData)
                    ? Image.memory(
                        Uint8List.fromList(UserDataStorageServices.readData(
                                key: UserStorageDataKeys.imageData)
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
                      )
                    : Image.asset('assets/images/profile_image.png'),
              ),
              Gap(20),
            ],
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          endDrawer: cupertino_drawer(hit, wid),
          drawerDragStartBehavior: DragStartBehavior.down,
          body: CupertinoPageScaffold(
            backgroundColor: AppColor.white,
            child: Container(
              height: hit,
              width: wid,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Let’s eat',
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: AppColor.black300,
                            ),
                          ),
                          Text(
                            'Nutritious food.',
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColor.black300,
                            ),
                          ),
                          Obx(() => hController.slider1BannerList.isEmpty
                              ? const Gap(0)
                              : const Gap(30)),
                          Obx(
                            () => hController.slider1BannerList.isEmpty
                                ? Gap(0)
                                : Container(
                                    height: 151,
                                    width: wid,
                                    child: Obx(
                                      () =>
                                          hController
                                                  .isErrorInBannerLoading.value
                                              ? Gap(0)
                                              : hController.isBannerLoaded.value
                                                  ? hController
                                                          .slider1BannerList
                                                          .isEmpty
                                                      ? Gap(0)
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      16.0),
                                                          child:
                                                              AnimatedBuilder(
                                                            animation: hController
                                                                .slider1Index,
                                                            builder: (context,
                                                                child) {
                                                              return Stack(
                                                                alignment: Alignment
                                                                    .bottomCenter,
                                                                children: [
                                                                  CarouselSlider(
                                                                    options:
                                                                        CarouselOptions(
                                                                      viewportFraction:
                                                                          1.0,
                                                                      enlargeCenterPage:
                                                                          false,
                                                                      autoPlay:
                                                                          true,
                                                                      onPageChanged:
                                                                          (index,
                                                                              reason) {
                                                                        hController
                                                                            .slider1Index
                                                                            .value = index;
                                                                      },
                                                                    ),
                                                                    items: hController
                                                                        .slider1BannerList
                                                                        .map((item) =>
                                                                            Container(
                                                                              child: Center(
                                                                                  child: Image.memory(
                                                                                Uint8List.fromList(item.image!.data!),
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
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: hController
                                                                          .slider1BannerList
                                                                          .asMap()
                                                                          .entries
                                                                          .map(
                                                                              (entry) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () {},
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            height:
                                                                                10.0,
                                                                            margin:
                                                                                EdgeInsets.symmetric(
                                                                              vertical: 10.0,
                                                                              horizontal: 4.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                              color: hController.slider1Index.value == entry.key ? AppColor.primary : Colors.grey,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }).toList(),
                                                                    ),
                                                                  )
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        )
                                                  : Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 20.0,
                                                      ),
                                                      child:
                                                          CustomCircularIndicator(
                                                        color: AppColor.primary,
                                                      ),
                                                    ),
                                    ),
                                  ),
                          ),
                          const Gap(30),
                          Obx(
                            () => hController.categoryList.isEmpty
                                ? Gap(0)
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Categories',
                                        style: GoogleFonts.openSans(
                                          color: AppColor.black300,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                          Obx(
                            () => hController.categoryList.isEmpty
                                ? Gap(0)
                                : const Gap(5),
                          ),
                          Obx(
                            () => SizedBox(
                              height: 40,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: hController.categoryList.length,
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
                                    child: Chip(
                                      label: Text(
                                          '${hController.categoryList[index].category ?? ""}'),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => Gap(6),
                              ),
                            ),
                          ),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Restaurants',
                                style: GoogleFonts.openSans(
                                  color: AppColor.black300,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Obx(
                            () => hController.businessList.isEmpty
                                ? Gap(0)
                                : const Gap(10),
                          ),
                          // todo: Top Restaurants.
                          Obx(
                            () => hController.isErrorInBusinessLoading.value
                                ? Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
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
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Businesses not found.",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            separatorBuilder:
                                                (context, index) => Gap(10),
                                            itemCount:
                                                hController.businessList.length,
                                            itemBuilder: (context, index) {
                                              return Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        '/restaurant_details',
                                                        arguments: {
                                                          'rId': hController
                                                                  .businessList[
                                                                      index]
                                                                  .sId ??
                                                              "",
                                                        })?.then((e) {
                                                      Get.delete<
                                                          AndroidBusinessDetailController>();
                                                    });
                                                  },
                                                  child: Container(
                                                    height: wid / 5,
                                                    width: wid - 34,
                                                    decoration: BoxDecoration(
                                                      color: AppColor.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: AppColor.gray
                                                              .withOpacity(0.4),
                                                          blurRadius: 1,
                                                          offset: const Offset(
                                                              0, 1),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              6.0),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child:
                                                                  Image.memory(
                                                                Uint8List
                                                                    .fromList(
                                                                  hController
                                                                      .businessList[
                                                                          index]
                                                                      .mainImage!
                                                                      .data!
                                                                      .data!,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
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
                                                                    '${hController.businessList[index].businessName}',
                                                                    style: GoogleFonts
                                                                        .openSans(
                                                                      color: AppColor
                                                                          .black300,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis, // Ensure it does not overflow
                                                                  ),
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                            'assets/icons/location_gray.svg'),
                                                                    const Gap(
                                                                        6),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        '${hController.businessList[index].address} ${hController.businessList[index].city} ${hController.businessList[index].state}-${hController.businessList[index].pincode}',
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: GoogleFonts
                                                                            .openSans(
                                                                          color:
                                                                              AppColor.black300,
                                                                          fontSize:
                                                                              12,
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
                                                                .withOpacity(
                                                                    0.5),
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
                                            })
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomShape extends StatelessWidget {
  const CustomShape({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(125, 151),
      painter: MyPainter(),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFF21272C);
    Path path = Path()
      ..moveTo(79, 0)
      ..lineTo(109, 0)
      ..cubicTo(116.542, 0, 120.314, 0, 122.657, 2.34315)
      ..cubicTo(125, 4.68629, 125, 8.45753, 125, 16)
      ..lineTo(125, 135)
      ..cubicTo(125, 142.542, 125, 146.314, 122.657, 148.657)
      ..cubicTo(120.314, 151, 116.542, 151, 109, 151)
      ..lineTo(0, 151)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';
import '../../widget/cupertino_my_drawer.dart';

class order extends GetView<TotalOrderController> {
  order({super.key});

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hit = MediaQuery.of(context).size.height;
    return GetBuilder<TotalOrderController>(
        init: TotalOrderController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                BusinessImage.mainStoreImageWidget(),
                const Gap(20),
              ],
            ),
            drawer: C_drawer(hit, wid),
            body: CupertinoPageScaffold(
              backgroundColor: const Color(0xfff9f9f9),
              child: Container(
                height: hit,
                width: wid,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
                    Text(
                      'TOTAL ORDER',
                      style: GoogleFonts.openSans(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const Gap(20),
                    Obx(
                      () => controller.isLoaded.value
                          ? Container(
                              width: wid / 2.4,
                              height: wid / 2.4,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        blurStyle: BlurStyle.normal,
                                        blurRadius: 0,
                                        spreadRadius: 0)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: AppColor.color2,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurStyle: BlurStyle.normal,
                                              blurRadius: 0,
                                              spreadRadius: 0,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: const DecorationImage(
                                            image:
                                                AssetImage(AppImages.receipt),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              AppImages.cart,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Gap(20),
                                  Text(
                                    '${controller.backUpList.length}',
                                    style: GoogleFonts.openSans(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  Text(
                                    'Total Orders',
                                    style: GoogleFonts.openSans(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Gap(0),
                    ),
                    const Gap(20),
                    Text(
                      'RECENT ORDERS',
                      style: GoogleFonts.openSans(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const Gap(20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (controller.page.value == 0) return;
                                        controller.page.value = 0;
                                        controller.orderList.clear();
                                        controller.orderList.value =
                                            List.from(controller.backUpList);
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: (controller.page.value == 0)
                                              ? AppColor.primary
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'All',
                                            style: TextStyle(
                                              color:
                                                  (controller.page.value == 0)
                                                      ? AppColor.white
                                                      : AppColor.primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (controller.page.value == 1) return;
                                        controller.page.value = 1;
                                        controller.orderList.clear();
                                        for (var e in controller.backUpList) {
                                          if (e.orderStatus == 'Pending' &&
                                              e.status == 'Pending') {
                                            controller.orderList.add(e);
                                          }
                                        }
                                      },
                                      child: Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: (controller.page.value == 1)
                                                ? AppColor.primary
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Pending',
                                              style: TextStyle(
                                                color:
                                                    (controller.page.value == 1)
                                                        ? AppColor.white
                                                        : AppColor.primary,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                  const Gap(10),
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (controller.page.value == 2) return;
                                        controller.page.value = 2;
                                        controller.orderList.clear();
                                        for (var e in controller.backUpList) {
                                          if (e.orderStatus == 'Accepted' &&
                                              e.status == 'Processing') {
                                            controller.orderList.add(e);
                                          }
                                        }
                                      },
                                      child: Container(
                                          width: 130,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: (controller.page.value == 2)
                                                ? AppColor.primary
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Accepted',
                                              style: TextStyle(
                                                color:
                                                    (controller.page.value == 2)
                                                        ? AppColor.white
                                                        : AppColor.primary,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                  const Gap(10),
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        if (controller.page.value == 3) return;
                                        controller.page.value = 3;
                                        controller.orderList.clear();
                                        for (var e in controller.backUpList) {
                                          if (e.status == 'Completed') {
                                            controller.orderList.add(e);
                                          }
                                        }
                                      },
                                      child: Container(
                                        width: 130,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: (controller.page.value == 3)
                                              ? AppColor.primary
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Completed',
                                            style: TextStyle(
                                              color:
                                                  (controller.page.value == 3)
                                                      ? AppColor.white
                                                      : AppColor.primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(5),
                                ],
                              ),
                            ),
                            const Gap(30),
                            Obx(
                              () => controller.isError.value
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.search_off_rounded,
                                          size: 80,
                                          color: Colors.black,
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
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
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
                                      : controller.orderList.isEmpty
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
                                                        controller.page.value ==
                                                                1
                                                            ? "Pending orders not found."
                                                            : controller.page
                                                                        .value ==
                                                                    2
                                                                ? "Accepted orders not found."
                                                                : controller.page
                                                                            .value ==
                                                                        3
                                                                    ? "Completed orders not found."
                                                                    : "Orders not found.",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                    Gap(20),
                                                  ],
                                                ),
                                              ],
                                            )
                                          : ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              separatorBuilder:
                                                  (context, index) {
                                                return Gap(20);
                                              },
                                              itemCount:
                                                  controller.orderList.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                      '/business_order_detail',
                                                      arguments: controller
                                                              .orderList[index]
                                                              .sId ??
                                                          "",
                                                    )?.then(
                                                      (value) {
                                                        if (value ?? false) {
                                                          controller
                                                              .getAllOrder();
                                                        }
                                                      },
                                                    );
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 12.5),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColor.white,
                                                          border: Border.all(
                                                            color: controller
                                                                .getStatusName(
                                                                    index:
                                                                        index)
                                                                .last,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurStyle:
                                                                  BlurStyle
                                                                      .normal,
                                                              blurRadius: 0,
                                                              spreadRadius: 0,
                                                            )
                                                          ],
                                                        ),
                                                        padding:
                                                            EdgeInsets.only(
                                                          right: 12,
                                                          left: 12,
                                                          bottom: 12,
                                                          top: 22,
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  height: 75,
                                                                  width: 75,
                                                                  child: !(controller.orderList[index].userId?.image?.data ??
                                                                              [])
                                                                          .isImage()
                                                                      ? ClipOval(
                                                                          child:
                                                                              Image.memory(
                                                                            Uint8List.fromList(
                                                                              controller.orderList[index].userId!.image!.data!,
                                                                            ),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        )
                                                                      : Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color: controller
                                                                                .getStatusName(
                                                                                  index: index,
                                                                                )
                                                                                .last
                                                                                .withOpacity(0.15),
                                                                          ),
                                                                          child:
                                                                              Icon(
                                                                            Icons.person_rounded,
                                                                            size:
                                                                                35,
                                                                            color: controller
                                                                                .getStatusName(
                                                                                  index: index,
                                                                                )
                                                                                .last,
                                                                          ),
                                                                        ),
                                                                ),
                                                                Gap(10),
                                                                Expanded(
                                                                    child:
                                                                        Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      "${controller.orderList[index].userId?.userName ?? ""}",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            15,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "${controller.orderList[index].userId?.email ?? ""}",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "${DateFormat('MMM dd, yyyy | hh:mm a').format(DateTime.parse(controller.orderList[index].createdAt ?? "${DateTime.now()}").toLocal())}",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ],
                                                                ))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 15,
                                                        child: Container(
                                                          color: AppColor.white,
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            15,
                                                                        vertical:
                                                                            3),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: controller
                                                                      .getStatusName(
                                                                        index:
                                                                            index,
                                                                      )
                                                                      .last
                                                                      .withOpacity(0.15),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    5,
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  "${controller.getStatusName(index: index).first}",
                                                                  style:
                                                                      TextStyle(
                                                                    color: controller
                                                                        .getStatusName(
                                                                            index:
                                                                                index)
                                                                        .last,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                              padding: EdgeInsets.zero,
                                            ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

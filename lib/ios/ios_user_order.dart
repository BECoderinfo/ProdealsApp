import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class iosUserOrderHistoryScreen extends GetView<UserOrderHistoryController> {
  const iosUserOrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return GetBuilder<UserOrderHistoryController>(
      init: UserOrderHistoryController(),
      builder: (controller) {
        return CupertinoPageScaffold(
          child: Container(
            height: hit,
            width: wid,
            color: AppColor.white,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                const Gap(30),
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
                              offset: const Offset(0, 0),
                              blurRadius: 2,
                              spreadRadius: 0,
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
                        'Order History',
                        style: TextStyle(
                          color: AppColor.black300,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Obx(
                      () => controller.isError.value
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
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Gap(20),
                                  ],
                                ),
                              ],
                            )
                          : !controller.isLoaded.value
                              ? CustomCircularIndicator(color: AppColor.primary)
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
                                                "Orders not found.",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Gap(20),
                                          ],
                                        ),
                                      ],
                                    )
                                  : ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return Gap(20);
                                      },
                                      itemCount: controller.orderList.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                              '/user_order_detail',
                                              arguments: controller
                                                      .orderList[index].sId ??
                                                  "",
                                            )?.then(
                                              (value) {
                                                if (value ?? false) {
                                                  controller.getAllOrder();
                                                }
                                              },
                                            );
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 12.5),
                                                decoration: BoxDecoration(
                                                  color: AppColor.black300,
                                                  border: Border.all(
                                                    color: controller
                                                        .getStatusName(
                                                            index: index)
                                                        .last,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurStyle:
                                                          BlurStyle.normal,
                                                      blurRadius: 0,
                                                      spreadRadius: 0,
                                                    )
                                                  ],
                                                ),
                                                padding: EdgeInsets.only(
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
                                                          child: !(controller
                                                                          .orderList[
                                                                              index]
                                                                          .businessId
                                                                          ?.mainImage
                                                                          ?.data
                                                                          ?.data ??
                                                                      [])
                                                                  .isImage()
                                                              ? ClipOval(
                                                                  child: Image
                                                                      .memory(
                                                                    Uint8List
                                                                        .fromList(
                                                                      controller
                                                                          .orderList[
                                                                              index]
                                                                          .businessId!
                                                                          .mainImage!
                                                                          .data!
                                                                          .data!,
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                )
                                                              : Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: controller
                                                                        .getStatusName(
                                                                          index:
                                                                              index,
                                                                        )
                                                                        .last
                                                                        .withOpacity(0.15),
                                                                  ),
                                                                  child: Icon(
                                                                    Icons
                                                                        .error_rounded,
                                                                    size: 35,
                                                                    color: controller
                                                                        .getStatusName(
                                                                          index:
                                                                              index,
                                                                        )
                                                                        .last,
                                                                  ),
                                                                ),
                                                        ),
                                                        Gap(10),
                                                        Expanded(
                                                            child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "${controller.orderList[index].businessId?.businessName ?? ""}",
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            Text(
                                                              "${controller.orderList[index].businessId?.contactNumber ?? ""}",
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                              ),
                                                            ),
                                                            Text(
                                                              "${DateFormat('MMM dd, yyyy | hh:mm a').format(DateTime.parse(controller.orderList[index].createdAt ?? "${DateTime.now()}").toLocal())}",
                                                              maxLines: 1,
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
                                                                horizontal: 15,
                                                                vertical: 3),
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: controller
                                                              .getStatusName(
                                                                index: index,
                                                              )
                                                              .last
                                                              .withOpacity(
                                                                  0.15),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5,
                                                          ),
                                                        ),
                                                        child: Text(
                                                          "${controller.getStatusName(index: index).first}",
                                                          style: TextStyle(
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                    ),
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

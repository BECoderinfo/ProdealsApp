import 'package:pro_deals1/imports.dart';

class UserOrderDetailScreen extends GetView<UserOrderDetailController> {
  UserOrderDetailScreen({super.key});

  UserOrderDetailController controller =
      Get.put(UserOrderDetailController(oId: Get.arguments));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.back(result: controller.isChange.value);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Order details",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back(result: controller.isChange.value);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          backgroundColor: const Color(0xFFD6AA26),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => controller.isLoaded.value
                  ? controller.isProcess.value
                      ? CustomCircularIndicator(color: AppColor.primary)
                      : Padding(
                          padding: EdgeInsets.only(
                            bottom: 15 + MediaQuery.of(context).padding.top,
                            left: 15,
                            right: 15,
                            top: 10,
                          ),
                          child: controller.getButton(),
                        )
                  : Gap(0),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
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
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Gap(20),
                        ],
                      ),
                    ],
                  )
                : !controller.isLoaded.value
                    ? CustomCircularIndicator(color: AppColor.primary)
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Obx(
                                () => Row(
                                  children: [
                                    Container(
                                      height: 65,
                                      width: 65,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: (controller
                                                            .orderDetails
                                                            ?.businessId
                                                            ?.mainImage
                                                            ?.data
                                                            ?.data ??
                                                        [])
                                                    .isImage()
                                                ? Colors.transparent
                                                : AppColor.primary,
                                            width: 2,
                                          )),
                                      child: !(controller
                                                      .orderDetails
                                                      ?.businessId
                                                      ?.mainImage
                                                      ?.data
                                                      ?.data ??
                                                  [])
                                              .isImage()
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.memory(
                                                Uint8List.fromList(
                                                  controller
                                                      .orderDetails!
                                                      .businessId!
                                                      .mainImage!
                                                      .data!
                                                      .data!,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: controller
                                                    .getStatusName()
                                                    .last
                                                    .withOpacity(0.15),
                                              ),
                                              child: Icon(
                                                Icons.person_rounded,
                                                size: 35,
                                                color: controller
                                                    .getStatusName()
                                                    .last,
                                              ),
                                            ),
                                    ),
                                    Gap(10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${controller.orderDetails?.businessId?.businessName ?? ""}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            "${controller.orderDetails?.businessId?.contactNumber ?? ""}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            "${DateFormat('MMM dd, yyyy | hh:mm a').format(DateTime.parse(controller.orderDetails?.createdAt ?? "${DateTime.now()}").toLocal())}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(10),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: controller
                                            .getStatusName()
                                            .last
                                            .withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                      ),
                                      child: Text(
                                        "${controller.oStatus.value}",
                                        style: TextStyle(
                                          height: 0.75,
                                          color:
                                              controller.getStatusName().last,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Gap(16),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Address details",
                                    style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Divider(
                                    color: AppColor.dividerColor,
                                  ),
                                  Text(
                                    "${controller.orderDetails?.businessId?.address ?? ""}, ${controller.orderDetails?.businessId?.state ?? ""}, ${controller.orderDetails?.businessId?.pincode ?? ""}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(16),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Offer details",
                                    style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Divider(
                                    color: AppColor.dividerColor,
                                  ),
                                  Column(
                                    children: [
                                      for (int i = 0;
                                          i <
                                              (controller.orderDetails?.offerId
                                                      ?.length ??
                                                  0);
                                          i++)
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Description",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      height: 0.85,
                                                    ),
                                                  ),
                                                  Gap(2),
                                                  Text(
                                                    "${controller.orderDetails?.offerId?[i].description ?? ""}",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  Gap(4),
                                                ],
                                              ),
                                            ),
                                            Gap(10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Quantity",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    height: 0.85,
                                                  ),
                                                ),
                                                Gap(2),
                                                Text(
                                                  "${controller.orderDetails!.quantity![i]}",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Gap(4),
                                              ],
                                            )
                                          ],
                                        )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Gap(16),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order value",
                                    style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Divider(
                                    color: AppColor.dividerColor,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Subtotal",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Gap(10),
                                      Text(
                                        "₹ ${controller.getSubTotal()}",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(8),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Offer discount",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Gap(10),
                                      Text(
                                        "- ₹ ${controller.getOfferDiscount()}",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: AppColor.acceptStatusColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  (controller.orderDetails?.promocode ?? "")
                                          .isEmpty
                                      ? Gap(0)
                                      : Gap(8),
                                  (controller.orderDetails?.promocode ?? "")
                                          .isEmpty
                                      ? Gap(0)
                                      : Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Promo discount(${controller.orderDetails?.promocode ?? ""})",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Gap(10),
                                            Text(
                                              "- ₹ ${controller.orderDetails?.discount}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColor
                                                      .acceptStatusColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                  Divider(
                                    color: AppColor.dividerColor,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Total",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Gap(10),
                                      Text(
                                        "₹ ${controller.orderDetails?.totalPrice}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Gap(16),
                            Obx(
                              () => (controller.oStatus.value == "Completed")
                                  ? GestureDetector(
                                      onTap: () {
                                        showRatingDialog(context: context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.all(12),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Rate us?",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Spacer(),
                                            RatingBar.builder(
                                              initialRating:
                                                  controller.rate.value,
                                              minRating: 0,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 30.0,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (double value) {
                                                controller.rate.value = value;
                                                showRatingDialog(
                                                    context: context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Gap(0),
                            ),
                          ],
                        ),
                      ),
          ),
        ),
      ),
    );
  }

  void showRatingDialog({required BuildContext context}) {
    final controller = Get.find<UserOrderDetailController>();
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Rate us?",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const Gap(16),
              Obx(
                () => RatingBar.builder(
                  initialRating: controller.rate.value,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30.0,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (double value) {
                    controller.rate.value = value;
                  },
                ),
              ),
              const Gap(16),
              TextField(
                controller: controller.comment,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: "Write your review here",
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(16),
              Obx(
                () => MyButton(
                  onTap: (controller.isRate.value)
                      ? null
                      : () {
                          Get.back();
                          controller.rateUs();
                        },
                  btnName: "Submit",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

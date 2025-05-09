import 'package:pro_deals1/imports.dart';

class RedeemedOffers extends GetView<RedeemedOffersController> {
  const RedeemedOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RedeemedOffersController>(
      init: RedeemedOffersController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Redeemed Offers',
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            backgroundColor: const Color(0xFFD6AA26),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Obx(
              () => controller.isError.value
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 80,
                        ),
                        Gap(20),
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
                    )
                  : controller.isLoaded.value
                      ? controller.redeemedOfferList.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "You have not redeemed any offers yet.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : ListView.builder(
                              itemCount: controller.redeemedOfferList.length,
                              padding: EdgeInsets.symmetric(vertical: 8),
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColor.gray,
                                        blurRadius: 2,
                                        offset: const Offset(1, 1),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          controller
                                                      .redeemedOfferList[index]
                                                      .business
                                                      ?.mainImage
                                                      ?.data
                                                      ?.data ==
                                                  null
                                              ? Gap(0)
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                  ),
                                                  child: Image.memory(
                                                    Uint8List.fromList(
                                                      controller
                                                          .redeemedOfferList[
                                                              index]
                                                          .business!
                                                          .mainImage!
                                                          .data!
                                                          .data!,
                                                    ),
                                                    width: 85,
                                                    height: 85,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                          Gap(10),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 10,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${controller.redeemedOfferList[index].business?.businessName ?? ""}",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  Gap(5),
                                                  Text(
                                                    "${controller.redeemedOfferList[index].business?.address ?? ""}, ${controller.redeemedOfferList[index].business?.city ?? ""}, ${controller.redeemedOfferList[index].business?.state ?? ""}-${controller.redeemedOfferList[index].business?.pincode ?? ""}",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Gap(5),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Gap(10),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Gap(10),
                                          Text(
                                            "Description",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Gap(10),
                                          Expanded(
                                            child: Text(
                                              "${controller.redeemedOfferList[index].description ?? ''}",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(8),
                                    ],
                                  ),
                                );
                              },
                            )
                      : CustomCircularIndicator(
                          color: AppColor.primary,
                        ),
            ),
          ),
        );
      },
    );
  }
}

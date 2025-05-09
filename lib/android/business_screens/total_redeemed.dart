import 'package:pro_deals1/imports.dart';

class total_redeemed extends GetView<TotalRedeemedController> {
  const total_redeemed({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return GetBuilder<TotalRedeemedController>(
      init: TotalRedeemedController(),
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "TOTAL REDEEMED",
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
                            : controller.offerList.isEmpty
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
                                              "Active offers not found.",
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
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final offer = controller.offerList[index];

                                      double originalPrice = double.tryParse(
                                              offer.productPrice!) ??
                                          0;
                                      double discount =
                                          double.tryParse(offer.offerPrice!) ??
                                              0;
                                      double finalPrice = originalPrice;

                                      if (offer.offertype!.toLowerCase() ==
                                          "amount") {
                                        finalPrice = originalPrice - discount;
                                      } else if (offer.offertype!
                                              .toLowerCase() ==
                                          "percentage") {
                                        finalPrice = originalPrice -
                                            (originalPrice * discount / 100);
                                      }

                                      return Card(
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              /// Top row with time and status
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    controller
                                                        .calculateTimeDifference(
                                                      createdDateStr:
                                                          offer.createdAt ??
                                                              DateTime.now()
                                                                  .toString(),
                                                    ),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 4),
                                                    decoration: BoxDecoration(
                                                      color: offer.isActive ==
                                                              true
                                                          ? Colors.green[100]
                                                          : Colors.red[100],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Text(
                                                      offer.isActive == true
                                                          ? "Active"
                                                          : "Inactive",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: offer.isActive ==
                                                                true
                                                            ? Colors.green
                                                            : Colors.red,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),

                                              /// Offer type and description
                                              Text(
                                                offer.offertype
                                                        ?.toUpperCase() ??
                                                    "OFFER",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColor.primary,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                offer.description ?? "",
                                                style: const TextStyle(
                                                    fontSize: 15),
                                              ),
                                              const SizedBox(height: 12),

                                              /// Price info if available
                                              if (offer.productPrice != null &&
                                                  offer.offerPrice != null)
                                                Row(
                                                  children: [
                                                    Text(
                                                      "₹${offer.productPrice}",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        color: Colors.redAccent,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      "₹${finalPrice}",
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                              const SizedBox(height: 12),

                                              /// Usage info
                                              Row(
                                                children: [
                                                  const Icon(
                                                      Icons.people_alt_outlined,
                                                      size: 20,
                                                      color: Colors.blueGrey),
                                                  const SizedBox(width: 6),
                                                  Text(
                                                    "Used by ${offer.usedBy?.length ?? 0} users",
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              /// Optional: Expiry info
                                              if (offer.expiryDate != null) ...[
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.timer_outlined,
                                                        size: 20,
                                                        color: Colors.orange),
                                                    const SizedBox(width: 6),
                                                    Text(
                                                      "Expires on ${DateFormat('dd-MM-yyyy').format(DateTime.parse(offer.expiryDate!))}",
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 15),
                                    itemCount: controller.offerList.length,
                                  ),
                  ),
                ),
                const Gap(20),
              ],
            ),
          ),
        );
      },
    );
  }
}

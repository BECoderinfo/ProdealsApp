import 'package:pro_deals1/imports.dart';
import 'package:pro_deals1/widget/separator.dart';

class Coupons extends GetView<CouponsController> {
  const Coupons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MY Coupons"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: GetBuilder<CouponsController>(
        init: CouponsController(),
        builder: (couponsController) {
          return Obx(
            () => couponsController.isError.value
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
                : !couponsController.isLoaded.value
                    ? CustomCircularIndicator(color: AppColor.primary)
                    : couponsController.promoList.isEmpty
                        ? Center(
                            child: Text(
                              "Coupons not found",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    enableInfiniteScroll: false,
                                    height: 315,
                                    scrollDirection: Axis.horizontal,
                                    onPageChanged: (index, reason) {
                                      couponsController.index.value = index;
                                    },
                                  ),
                                  items: [
                                    for (int i = 0;
                                        i < couponsController.promoList.length;
                                        i++)
                                      Stack(
                                        children: [
                                          Container(
                                            height: 315,
                                            width: 238,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: [
                                                Colors.teal[200],
                                                Colors.purple[200],
                                              ][i % 2 == 0 ? 0 : 1],
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 3,
                                                  offset: Offset(0, 3),
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 45,
                                                      vertical: 35),
                                                  child: Opacity(
                                                    opacity: 0.2,
                                                    child: Text(
                                                      "${couponsController.promoList[i].discount ?? ""}",
                                                      style: TextStyle(
                                                        fontSize: 120,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const Gap(20),
                                                    const Text(
                                                      "",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    const Gap(25),
                                                    Text(
                                                      "${couponsController.promoList[i].discount ?? ""}${couponsController.promoList[i].discountType == "Amount" ? '₹' : '%'}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 70),
                                                    ),
                                                    const Text(
                                                      "OFF",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const Gap(15),
                                                    const MySeparator(
                                                      color: Colors.teal,
                                                    ),
                                                    const Gap(25),
                                                    GestureDetector(
                                                      onTap: () {
                                                        if (couponsController
                                                                .total.value >
                                                            (int.tryParse(couponsController
                                                                        .promoList[
                                                                            i]
                                                                        .neededAmount ??
                                                                    "0") ??
                                                                double.parse(couponsController
                                                                        .promoList[
                                                                            i]
                                                                        .neededAmount ??
                                                                    "0"))) {
                                                          ShowToast.toast(
                                                            msg:
                                                                "Coupon redeemed successfully!",
                                                          );
                                                          Get.back(
                                                            result: {
                                                              'promoCode':
                                                                  couponsController
                                                                      .promoList[i],
                                                            },
                                                          );
                                                        } else {
                                                          ShowToast.toast(
                                                            msg:
                                                                "You can't use this coupon. Order value is less than the minimum required.",
                                                          );
                                                        }
                                                      },
                                                      child: Container(
                                                        height: 35,
                                                        width: 130,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: const Center(
                                                            child: Text(
                                                          "Redeem",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            right: -10,
                                            bottom: 75,
                                            child: SvgPicture.asset(
                                                "assets/images/svg/Ellipse 212.svg"),
                                          ),
                                          Positioned(
                                            left: -10,
                                            bottom: 75,
                                            child: SvgPicture.asset(
                                                "assets/images/svg/Ellipse 212.svg"),
                                          ),
                                        ],
                                      )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: AnimatedSwitcher(
                                      duration: Duration(seconds: 1),
                                      transitionBuilder: (Widget child,
                                          Animation<double> animation) {
                                        return FadeTransition(
                                            opacity: animation, child: child);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${couponsController.promoList[couponsController.index.value].description ?? ""}",
                                            style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            "Promocode: ${couponsController.promoList[couponsController.index.value].promocode ?? ""}",
                                            style: GoogleFonts.openSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Minimum order value: ${couponsController.promoList[couponsController.index.value].neededAmount ?? ""}",
                                            style: GoogleFonts.openSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Exp: ${DateFormat('dd MMM, yyyy').format(DateTime.parse(couponsController.promoList[couponsController.index.value].expiryDate ?? "${DateTime.now()}"))}",
                                            style: GoogleFonts.openSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
          );
        },
      ),
    );
  }
}

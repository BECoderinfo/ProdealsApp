import 'package:pro_deals1/imports.dart';

class premium_page extends GetView<PremiumPageController> {
  const premium_page({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    final PremiumPageController pController = Get.put(PremiumPageController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text(
          'CHOOSE YOUR PLAN',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => pController.isError.value
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
              : pController.isPlanDataLoaded.value
                  ? pController.plansList.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Plans not found.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        )
                      : ListView.separated(
                          separatorBuilder: (context, index) => Gap(20),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Get.toNamed('/PremiumDetails',
                                  arguments: pController.plansList[index]),
                              child: Container(
                                height: hit / 4,
                                width: wid,
                                decoration: BoxDecoration(
                                  color: AppColor.black300,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(hit / 10),
                                    bottomRight: Radius.circular(hit / 10),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                        width: wid / 2.3,
                                        height: hit / 8,
                                        decoration: BoxDecoration(
                                          color: AppColor.primary,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(hit / 10),
                                            bottomRight:
                                                Radius.circular(hit / 10),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${pController.plansList[index].planName ?? ""}',
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.white,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    '₹ ${pController.plansList[index].planPrice}/',
                                                style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${controller.plansList[index].planCount == 1 ? "" : " ${controller.plansList[index].planCount} "}${pController.plansList[index].planDuration ?? ""}',
                                                style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, right: 20),
                                        child: Column(
                                          children: [
                                            for (int i = 0;
                                                i <
                                                    (pController
                                                            .plansList[index]
                                                            .planDescription
                                                            ?.length ??
                                                        0);
                                                i++)
                                              Container(
                                                width: wid / 2.5,
                                                child: Row(
                                                  children: [
                                                    Transform.rotate(
                                                      angle: 40,
                                                      child: Icon(
                                                        Icons
                                                            .add_circle_outline,
                                                        color: AppColor.primary,
                                                        size: 16,
                                                      ),
                                                    ),
                                                    Gap(5),
                                                    Expanded(
                                                      child: Text(
                                                        '${pController.plansList[index].planDescription?[i] ?? ""}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColor.white,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 12.0, right: 20),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed('/PremiumDetails',
                                                arguments: pController
                                                    .plansList[index]);
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                'View Details',
                                                style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.primary,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              IconButton(
                                                padding: EdgeInsets.all(0),
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: AppColor.primary,
                                                  size: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: pController.plansList.length,
                        )
                  : CustomCircularIndicator(
                      color: AppColor.primary,
                    ),
        ),
      ),
    );
  }
}

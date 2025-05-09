import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class ios_support extends GetView<SupportController> {
  const ios_support({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return GetBuilder<SupportController>(
        init: SupportController(),
        builder: (controller) {
          return CupertinoPageScaffold(
            backgroundColor: const Color(0xfff9f9f9),
            child: Container(
              width: wid,
              height: hit,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Gap(40),
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
                          'Support Center',
                          style: TextStyle(
                            color: AppColor.black300,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Expanded(
                    child: Container(
                      width: wid,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                        Gap(20),
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
                                    )
                                  : controller.isLoaded.value
                                      ? controller.faqList.isEmpty &&
                                              controller.myQuestionList.isEmpty
                                          ? Container(
                                              height: hit * 0.3,
                                              alignment: Alignment.center,
                                              child: Text(
                                                "FAQ not found",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            )
                                          : Column(
                                              children: [
                                                controller
                                                        .myQuestionList.isEmpty
                                                    ? Gap(0)
                                                    : Row(
                                                        children: [
                                                          Container(
                                                            height: 40,
                                                            width: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: AppColor
                                                                  .white,
                                                              image:
                                                                  const DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/images/Question.png'),
                                                              ),
                                                            ),
                                                          ),
                                                          const Gap(20),
                                                          Text(
                                                            'My question',
                                                            style: GoogleFonts
                                                                .openSans(
                                                                    color: AppColor
                                                                        .black300),
                                                          ),
                                                        ],
                                                      ),
                                                controller
                                                        .myQuestionList.isEmpty
                                                    ? Gap(0)
                                                    : ListView.builder(
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Card(
                                                            color:
                                                                AppColor.white,
                                                            child:
                                                                ExpansionTile(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              title: Text(
                                                                '${controller.myQuestionList[index].quotation ?? ''}',
                                                                style:
                                                                    TextStyle(
                                                                  color: AppColor
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              children: [
                                                                ListTile(
                                                                  title: Text(
                                                                    '${controller.myQuestionList[index].answer ?? ''}',
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppColor
                                                                          .black,
                                                                      fontSize:
                                                                          15,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                        itemCount: controller
                                                            .myQuestionList
                                                            .length,
                                                        shrinkWrap: true,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                      ),
                                                controller
                                                        .myQuestionList.isEmpty
                                                    ? Gap(0)
                                                    : Gap(10),
                                                controller.faqList.isEmpty
                                                    ? Gap(0)
                                                    : Row(
                                                        children: [
                                                          Container(
                                                            height: 40,
                                                            width: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: AppColor
                                                                  .white,
                                                              image:
                                                                  const DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/images/Question.png'),
                                                              ),
                                                            ),
                                                          ),
                                                          const Gap(20),
                                                          Text(
                                                            'Frequently asked Questions',
                                                            style: GoogleFonts
                                                                .openSans(
                                                                    color: AppColor
                                                                        .black300),
                                                          ),
                                                        ],
                                                      ),
                                                ListView.builder(
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Card(
                                                      color: AppColor.white,
                                                      child: ExpansionTile(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        title: Text(
                                                          '${controller.faqList[index].quotation ?? ''}',
                                                          style: TextStyle(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        children: [
                                                          ListTile(
                                                            title: Text(
                                                              '${controller.faqList[index].answer ?? 'Still owner tell the answer.'}',
                                                              style: TextStyle(
                                                                color: AppColor
                                                                    .black,
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  itemCount:
                                                      controller.faqList.length,
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                ),
                                                const Gap(10),
                                              ],
                                            )
                                      : CustomCircularIndicator(
                                          color: AppColor.primary,
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
        });
  }
}

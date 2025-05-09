import 'package:pro_deals1/imports.dart';

class support extends GetView<SupportController> {
  const support({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return GetBuilder<SupportController>(
      init: SupportController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Support Center"),
            centerTitle: true,
            backgroundColor: AppColor.primary,
          ),
          floatingActionButton: Obx(
            () => controller.isProcess.value
                ? FloatingActionButton(
                    onPressed: () {},
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    child: CustomCircularIndicator(
                      color: AppColor.primary,
                    ),
                  )
                : FloatingActionButton.extended(
                    backgroundColor: AppColor.primary,
                    onPressed: () {
                      controller.askQuestionDialog(ctx: context);
                    },
                    label: Text(
                      "Ask question",
                      style: TextStyle(color: AppColor.white),
                    ),
                    icon: Icon(
                      Icons.add_rounded,
                      color: AppColor.white,
                    ),
                  ),
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
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
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    controller.myQuestionList.isEmpty
                                        ? Gap(0)
                                        : ListTile(
                                            leading: CircleAvatar(
                                              radius: 30,
                                              child: Icon(Icons.question_mark),
                                            ),
                                            dense: true,
                                            title: Text(
                                              'My question',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                    controller.myQuestionList.isEmpty
                                        ? Gap(0)
                                        : Gap(10),
                                    controller.myQuestionList.isEmpty
                                        ? Gap(0)
                                        : ListView.builder(
                                            itemBuilder: (context, index) {
                                              return Card(
                                                color: AppColor.white,
                                                child: ExpansionTile(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  title: Text(
                                                    '${controller.myQuestionList[index].quotation ?? ''}',
                                                    style: TextStyle(
                                                      color: AppColor.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  children: [
                                                    ListTile(
                                                      title: Text(
                                                        '${controller.myQuestionList[index].answer ?? ''}',
                                                        style: TextStyle(
                                                          color: AppColor.black,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                            itemCount: controller
                                                .myQuestionList.length,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                          ),
                                    controller.myQuestionList.isEmpty
                                        ? Gap(0)
                                        : Gap(10),
                                    controller.faqList.isEmpty
                                        ? Gap(0)
                                        : ListTile(
                                            leading: CircleAvatar(
                                              radius: 30,
                                              child: Icon(Icons.question_mark),
                                            ),
                                            dense: true,
                                            title: Text(
                                              'Frequently asked Questions',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                    controller.faqList.isEmpty
                                        ? Gap(0)
                                        : Gap(10),
                                    ListView.builder(
                                      itemBuilder: (context, index) {
                                        return Card(
                                          color: AppColor.white,
                                          child: ExpansionTile(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            title: Text(
                                              '${controller.faqList[index].quotation ?? ''}',
                                              style: TextStyle(
                                                color: AppColor.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  '${controller.faqList[index].answer ?? 'Still owner tell the answer.'}',
                                                  style: TextStyle(
                                                    color: AppColor.black,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                      itemCount: controller.faqList.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                    ),
                                    const Gap(10),
                                  ],
                                ),
                              )
                        : CustomCircularIndicator(
                            color: AppColor.primary,
                          ),
              )),
        );
      },
    );
  }
}

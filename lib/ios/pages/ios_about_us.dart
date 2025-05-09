import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class ios_about_us extends GetView<SettingScreenController> {
  const ios_about_us({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingScreenController settingScreenController =
        Get.put(SettingScreenController());
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: Container(
        height: hit,
        width: wid,
        color: AppColor.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoFormRow(
                padding: EdgeInsets.only(
                  top: 25 + MediaQuery.of(context).padding.top,
                  bottom: 15,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Gap(wid / 4),
                    Text(
                      'About Us',
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(
                  () => settingScreenController.content.isEmpty
                      ? CustomCircularIndicator(color: AppColor.primary)
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              Html(
                                data: settingScreenController.content.value,
                                style: {
                                  'b': Style(
                                    fontSize: FontSize(25),
                                    color: Colors.black,
                                  ),
                                  '*': Style(
                                    color: Colors.black,
                                  ),
                                },
                              ),
                            ],
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

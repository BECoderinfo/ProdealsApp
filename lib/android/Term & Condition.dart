import 'package:pro_deals1/imports.dart';

class Term_condition extends GetView<SettingScreenController> {
  const Term_condition({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingScreenController settingScreenController =
        Get.put(SettingScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Term & Condition",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: Obx(
        () => settingScreenController.content.isEmpty
            ? CustomCircularIndicator(color: AppColor.primary)
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Html(
                    data: settingScreenController.content.value,
                    style: {
                      'b': Style(
                        fontSize: FontSize(25),
                      ),
                    },
                  ),
                ),
              ),
      ),
    );
  }
}

import 'package:pro_deals1/imports.dart';

class Privacy_Policy extends GetView<SettingScreenController> {
  const Privacy_Policy({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingScreenController screenController =
        Get.put(SettingScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Policy",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: Obx(
        () => screenController.content.isEmpty
            ? CustomCircularIndicator(color: AppColor.primary)
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Html(
                    data: screenController.content.value,
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

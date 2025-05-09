import 'package:pro_deals1/imports.dart';

class About_Us extends GetView<SettingScreenController> {
  const About_Us({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingScreenController settingScreenController =
        Get.put(SettingScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Us",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: const Color(0xFFD6AA26),
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

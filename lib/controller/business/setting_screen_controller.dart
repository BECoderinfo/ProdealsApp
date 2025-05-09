import 'package:flutter/services.dart';
import 'package:pro_deals1/imports.dart';

class SettingScreenController extends GetxController {
  final data = Get.arguments;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    rootBundle
        .loadString(data['fileName'] ?? "${MyVariables.aboutUsFile}")
        .then(
      (value) {
        content.value = value;
        update();
      },
    );
  }

  RxString content = "".obs;
}

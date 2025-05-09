import 'package:pro_deals1/imports.dart';

class ShowToast {
  static Future<bool?> toast({required String msg}) async {
    return await Fluttertoast.showToast(msg: msg);
  }

  static void errorSnackbar({
    required String title,
    required String msg,
  }) {
    Get.snackbar(
      "${title}",
      "${msg}",
      margin: EdgeInsets.all(10),
      backgroundColor: AppColor.red,
      colorText: AppColor.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

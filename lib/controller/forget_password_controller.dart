import 'package:pro_deals1/imports.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController controller = TextEditingController();

  sendOtp() async {
    try {
      final response = await ApiService.postApi(
        Apis.userForgetPassword(email: controller.text),
      );

      if (response != null) {
        print("${response}");
        ShowToast.toast(msg: response['message']);
        isProcess.value = false;
        Get.toNamed('/otp_verification', arguments: {
          'reset': true,
          'code': "${response['otp']}",
          'email': controller.text,
        });
      } else {
        isProcess.value = false;
      }
    } catch (error) {
      isProcess.value = false;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  RxBool isProcess = false.obs;
  RxString emailError = "".obs;
}

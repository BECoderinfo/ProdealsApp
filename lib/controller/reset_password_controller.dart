import 'package:pro_deals1/imports.dart';

class ResetPasswordController extends GetxController {
  final data = Get.arguments;

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  RxBool isPasswordShow = false.obs;
  RxBool isProcess = false.obs;

  RxString passwordError = "".obs;
  RxString cPasswordError = "".obs;

  resetPassword() async {
    try {
      final response = await ApiService.putApi(
        Apis.userResetPassword,
        body: {
          "email": data['email'],
          "newPassword": password.text,
          "confirmPassword": confirmPassword.text,
        },
      );

      if (response != null) {
        if (UserDataStorageServices.readData(
                key: UserStorageDataKeys.loggedIn) ??
            false) {
          ShowToast.toast(msg: response['message']);
          Get.back();
          Get.back();
        } else {
          loginUser(
            email: data['email'],
            password: password.text,
            onDone: () {
              ShowToast.toast(msg: response['message']);
              isProcess.value = false;
            },
          );
        }
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
}

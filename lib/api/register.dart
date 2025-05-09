import 'package:pro_deals1/imports.dart';
import 'package:pro_deals1/model_class/user_register_model.dart';

Future<void> registerUser({
  required String userName,
  required String email,
  required String phone,
  required String password,
  required void Function() onDone,
}) async {
  try {
    final response = await ApiService.postApi(
      Apis.registerUser,
      body: {
        'userName': userName,
        'email': email,
        'phone': phone,
        'password': password,
      },
    );

    if (response != null) {
      onDone();
      UserRegisterData rData = UserRegisterData.fromJson(response);
      ShowToast.toast(msg: rData.message ?? "Otp successfully sent.");
      Get.toNamed('/otp_verification', arguments: {
        'code': rData.otp ?? "",
        'username': userName.toString(),
        'phone': phone.toString(),
        'password': password.toString(),
        'email': email.toString(),
        'expireTime': rData.user?.otpExpires ?? DateTime.now().toString(),
        'reset': false,
      });
    } else {
      onDone();
    }
  } catch (error) {
    onDone();
    ShowToast.errorSnackbar(
      title: "Error",
      msg: "$error",
    );
  }
}

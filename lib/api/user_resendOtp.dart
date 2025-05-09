import 'package:pro_deals1/imports.dart';

Future<bool?> resendOtp({
  required String email,
  required void Function() onDone,
}) async {
  try {
    final response = await ApiService.postApi(
      Apis.userResendOtp(email: email),
    );

    if (response != null) {
      ShowToast.toast(msg: response['message']);
      onDone();
      return true;
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

Future<bool?> verifyOtp({
  required String email,
  required String otp,
  required void Function() onDone,
}) async {
  try {
    final response = await ApiService.postApi(
      Apis.userVerifyOtp,
      body: {
        "email": email,
        "otp": otp,
      },
    );

    if (response != null) {
      ShowToast.toast(msg: response['message']);
      return true;
    } else {
      onDone();
    }
  } catch (error) {
    onDone();
    ShowToast.errorSnackbar(
      title: "Error logging in",
      msg: "$error",
    );
  }
}

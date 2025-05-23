import 'package:pro_deals1/imports.dart';

class LoginController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  final formkey = GlobalKey<FormState>();

  RxBool showPass = true.obs;
  RxBool isProcess = false.obs; // Add processing state

  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Method for Google login
  loginWithGoogle({required BuildContext ctx}) async {
    isProcess.value = true;

    try {
      final value = await googleSignIn.signIn();

      if (value != null) {
        await callApi(
          name: value.displayName ?? "",
          email: value.email,
          image: value.photoUrl ?? "",
        );
      } else {
        isProcess.value = false;
        showErrorDialog(
            ctx: ctx, error: 'Something went wrong, please try again.');
      }
    } catch (e) {
      isProcess.value = false;
      showErrorDialog(ctx: ctx, error: e.toString());
    }
  }

  // Show error dialog
  showErrorDialog({required BuildContext ctx, required String error}) {
    showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text('Error'),
          content: Text(error, maxLines: 3),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () => Get.back(),
              child: Text("Ok", style: TextStyle(color: AppColor.black)),
            )
          ],
        );
      },
    );
  }

  // API call for login
  callApi(
      {required String name,
      required String email,
      required String image}) async {
    try {
      final response = await ApiService.postApi(Apis.socialLogin, body: {
        "userName": name,
        "email": email,
        "profileImage": image,
        "type": Platform.isAndroid ? 2 : 3,
      });

      if (response != null) {
        await callApiUserSecure(
            usertoken: response['usertoken'], msg: response['message']);
      } else {
        isProcess.value = false;
      }
    } catch (error) {
      isProcess.value = false;
      ShowToast.errorSnackbar(title: "Error", msg: "$error");
    }
  }

  // API call to secure user info
  callApiUserSecure({required String usertoken, required String? msg}) async {
    isProcess.value = true; // Show loading

    try {
      final userdata = await ApiService.getApi(Apis.sequreUser,
          headers: {'token': usertoken});
      await saveUserData(userdata, usertoken); // Save user data

      ShowToast.toast(msg: msg ?? "Login success.");
      navigateToNextPage(userdata); // Navigate after data is saved
    } catch (e) {
      isProcess.value = false;
      ShowToast.errorSnackbar(title: "Error", msg: "$e");
    }
  }

  // Save user data locally
  saveUserData(Map<String, dynamic> userdata, String usertoken) async {
    await UserDataStorageServices.writeData(
        key: UserStorageDataKeys.loggedIn, data: true);
    await UserDataStorageServices.writeData(
        key: UserStorageDataKeys.userData, data: jsonEncode(userdata));
    await UserDataStorageServices.writeData(
        key: UserStorageDataKeys.token, data: usertoken);

    if (userdata['data']['image'] != null) {
      await UserDataStorageServices.writeData(
          key: UserStorageDataKeys.imageData,
          data: userdata['data']['image']['data']);
    } else if (userdata['data']['profileImage'] != null) {
      await UserDataStorageServices.writeData(
          key: UserStorageDataKeys.imageUrl,
          data: userdata['data']['profileImage']);
    }
  }

  // Navigate to the next screen based on business ID or normal user
  navigateToNextPage(Map<String, dynamic> userdata) async {
    if (userdata['data']['businessId'] == null) {
      isProcess.value = false;
      UserDataStorageServices.writeData(
          key: UserStorageDataKeys.cPanel, data: "${panel.user}");
      Navigator.popUntil(Get.context!, (route) => route.isFirst);
      currentPageIndex.value = AppPage.home;
      Get.offNamed('/navigation');
    } else {
      bool b = await getBusinessById(bId: userdata['data']['businessId'] ?? "");
      isProcess.value = false;
      if (b) {
        UserDataStorageServices.writeData(
            key: UserStorageDataKeys.businessId,
            data: userdata['data']['businessId']);
        UserDataStorageServices.writeData(
            key: UserStorageDataKeys.cPanel, data: "${panel.business}");
        Navigator.popUntil(Get.context!, (route) => route.isFirst);
        Get.offNamed('/dashboard');
      } else {
        UserDataStorageServices.writeData(
            key: UserStorageDataKeys.cPanel, data: "${panel.user}");
        Navigator.popUntil(Get.context!, (route) => route.isFirst);
        currentPageIndex.value = AppPage.home;
        Get.offNamed('/navigation');
      }
    }
  }

  // Fetch subscription info by user ID
  void getSub({required String id}) async {
    try {
      var res = await ApiService.getApi(Apis.getSubById(uId: id));

      if (res != null && res['success'] == true) {
        UserDataStorageServices.writeData(
            key: UserStorageDataKeys.isPremium, data: res['isActive'] ?? false);
        UserDataStorageServices.writeData(
            key: UserStorageDataKeys.planId, data: res['planId']);
      }
    } catch (e) {
      ShowToast.errorSnackbar(title: "Error", msg: "$e");
    }
  }
}

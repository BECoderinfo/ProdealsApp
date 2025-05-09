import 'package:pro_deals1/imports.dart';

class LoginController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  final formkey = GlobalKey<FormState>();

  RxBool showPass = true.obs;

  RxBool isProcess = false.obs;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  loginWithGoogle({
    required BuildContext ctx,
  }) async {
    isProcess.value = true; // <-- add this to show loading

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
          ctx: ctx,
          error: 'Something went wrong, please try again.',
        );
      }
    } catch (e) {
      isProcess.value = false;
      showErrorDialog(
        ctx: ctx,
        error: e.toString(),
      );
    }
  }

  showErrorDialog({
    required BuildContext ctx,
    required String error,
  }) {
    showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text('Error'),
          content: Text(
            error,
            maxLines: 3,
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => Get.back(),
              child: Text(
                "Ok",
                style: TextStyle(
                  color: AppColor.black,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  callApi({
    required String name,
    required String email,
    required String image,
  }) async {
    try {
      final response = await ApiService.postApi(Apis.socialLogin, body: {
        "userName": name, // <-- use the actual name
        "email": email, // <-- use the actual email
        "profileImage": image, // <-- use the actual profile image
        "type": Platform.isAndroid ? 2 : 3,
      });

      print("response :: ${response}");

      if (response != null) {
        await callApiUserSecure(
          usertoken: response['usertoken'],
          msg: response['message'],
        );
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

  callApiUserSecure({
    required String usertoken,
    required String? msg,
  }) async {
    final userdata = await ApiService.getApi(
      Apis.sequreUser,
      headers: {
        'token': usertoken,
      },
    );
    UserDataStorageServices.writeData(
      key: UserStorageDataKeys.loggedIn,
      data: true,
    );
    UserDataStorageServices.writeData(
      key: UserStorageDataKeys.userData,
      data: jsonEncode(userdata),
    );
    UserDataStorageServices.writeData(
      key: UserStorageDataKeys.token,
      data: usertoken,
    );
    UserLoginData loginData = UserLoginData.fromJson(userdata);

    id = loginData.data?.sId ?? "";
    UserName = loginData.data?.userName ?? "";
    Email = loginData.data?.email ?? "";
    Phone = loginData.data?.phone ?? "";
    isBusiness = loginData.data?.isBusiness ?? false;

    getSub(id: id);

    UserDataStorageServices.writeData(
      key: UserStorageDataKeys.uId,
      data: loginData.data?.sId ?? "",
    );
    UserDataStorageServices.writeData(
      key: UserStorageDataKeys.name,
      data: loginData.data?.userName ?? "",
    );
    UserDataStorageServices.writeData(
      key: UserStorageDataKeys.phone,
      data: loginData.data?.phone ?? "",
    );
    UserDataStorageServices.writeData(
      key: UserStorageDataKeys.email,
      data: loginData.data?.email ?? "",
    );
    UserDataStorageServices.writeData(
      key: UserStorageDataKeys.isBusiness,
      data: loginData.data?.isBusiness ?? false,
    );

    if (userdata['data']['image'] != null) {
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.imageData,
        data: userdata['data']['image']['data'],
      );
    } else if (userdata['data']['profileImage'] != null) {
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.imageUrl,
        data: userdata['data']['profileImage'] ?? "",
      );
    }

    ShowToast.toast(msg: msg ?? "Login success.");
    if (userdata['data']['businessId'] == null) {
      isProcess.value = false;
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.cPanel,
        data: "${panel.user}",
      );
      Navigator.popUntil(Get.context!, (route) => route.isFirst);
      currentPageIndex.value = 0;
      Get.offNamed('/navigation');
    } else {
      bool b = await getBusinessById(bId: userdata['data']['businessId'] ?? "");
      isProcess.value = false;
      if (b) {
        UserDataStorageServices.writeData(
          key: UserStorageDataKeys.businessId,
          data: userdata['data']['businessId'],
        );
        UserDataStorageServices.writeData(
          key: UserStorageDataKeys.cPanel,
          data: "${panel.business}",
        );

        Navigator.popUntil(Get.context!, (route) => route.isFirst);
        Get.offNamed('/dashboard');
      } else {
        UserDataStorageServices.writeData(
          key: UserStorageDataKeys.cPanel,
          data: "${panel.user}",
        );
        Navigator.popUntil(Get.context!, (route) => route.isFirst);
        currentPageIndex.value = 0;
        Get.offNamed('/navigation');
      }
    }
  }

  void getSub({required String id}) async {
    try {
      var res = await ApiService.getApi(Apis.getSubById(uId: id));

      if (res != null) {
        if (res['success'] == true) {
          UserDataStorageServices.writeData(
            key: UserStorageDataKeys.isPremium,
            data: res['isActive'] ?? false,
          );
          UserDataStorageServices.writeData(
            key: UserStorageDataKeys.planId,
            data: res['planId'],
          );
        }
      }
    } catch (e) {
      ShowToast.errorSnackbar(title: "Error", msg: "$e");
    } finally {}
  }
}

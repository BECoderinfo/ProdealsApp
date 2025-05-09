import 'dart:developer';

import 'package:pro_deals1/imports.dart';

Future<void> loginUser({
  required String email,
  required String password,
  required void Function() onDone,
}) async {
  try {
    final response = await ApiService.postApi(
      Apis.loginUser,
      body: {
        'email': email,
        'password': password,
      },
    );

    log("hello----------");

    if (response != null) {
      final userdata = await ApiService.getApi(
        Apis.sequreUser,
        headers: {
          'token': response['usertoken'],
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
        data: response['usertoken'],
      );
      UserLoginData loginData = UserLoginData.fromJson(userdata);

      id = loginData.data?.sId ?? "";
      UserName = loginData.data?.userName ?? "";
      Email = loginData.data?.email ?? "";
      Phone = loginData.data?.phone ?? "";
      isBusiness = loginData.data?.isBusiness ?? false;

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
      }

      ShowToast.toast(msg: response['message'] ?? "Login success.");
      onDone();
      if (userdata['data']['businessId'] != null &&
          userdata['data']['isBusiness']) {
        bool b =
            await getBusinessById(bId: userdata['data']['businessId'] ?? "");
        if (b) {
          UserDataStorageServices.writeData(
            key: UserStorageDataKeys.businessId,
            data: userdata['data']['businessId'],
          );
          UserDataStorageServices.writeData(
            key: UserStorageDataKeys.cPanel,
            data: "${panel.business}",
          );
          Get.back();
          Get.offNamedUntil(
            '/dashboard',
            (route) => route.isFirst,
          );
        } else {
          UserDataStorageServices.writeData(
            key: UserStorageDataKeys.cPanel,
            data: "${panel.user}",
          );
          Get.back();
          Get.offNamedUntil(
            '/navigation',
            (route) => route.isFirst,
          );
        }
      } else {
        UserDataStorageServices.writeData(
          key: UserStorageDataKeys.cPanel,
          data: "${panel.user}",
        );
        Get.offNamedUntil(
          '/navigation',
          (route) => route.isFirst,
        );
      }
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

Future<bool> getBusinessById({required String bId}) async {
  try {
    var response = await ApiService.getApi(Apis.businessDetail(bId: bId));

    if (response != null) {
      BusinessDetailModel detailModel = BusinessDetailModel.fromJson(response);

      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.businessAddress,
        data:
            "${detailModel.business?.address ?? ""}, ${detailModel.business?.city ?? ""}, ${detailModel.business?.state ?? ""} ${detailModel.business?.pincode ?? ""}",
      );
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.businessName,
        data: "${detailModel.business?.businessName ?? ""}",
      );
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.businessId,
        data: "$bId",
      );
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.businessImage,
        data: detailModel.business?.mainImage?.data?.data ?? "",
      );
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.businessTime,
        data:
            "${detailModel.business?.openTime ?? ""}-${detailModel.business?.closeTime ?? ""}",
      );

      await getRatting(bId: bId);
      return true;
    } else {
      return false;
    }
  } catch (error) {
    return false;
  }
}

getRatting({required String bId}) async {
  try {
    final response = await ApiService.getApi(
      Apis.businessRatting(bId: bId),
    );

    if (response != null) {
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.businessRatting,
        data: "${response['averageRating'] ?? "0"}",
      );
    }
    UserDataStorageServices.writeData(
      key: UserStorageDataKeys.businessRatting,
      data: "0",
    );
  } catch (e) {
    UserDataStorageServices.writeData(
      key: UserStorageDataKeys.businessRatting,
      data: "0",
    );
  }
}

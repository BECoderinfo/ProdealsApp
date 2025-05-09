import 'package:pro_deals1/imports.dart';

editProfile({
  String? imagePath,
  required String name,
  required String number,
  required String email,
  required String addressId,
  required void Function() onDone,
}) async {
  try {
    String s1 = '';
    String s2 = '';
    if (imagePath != null) {
      s1 = 'image';
      s2 = imagePath;
    }

    var response = await ApiService.multipartApi(
        Apis.userUpdateProfile(
            uId: UserDataStorageServices.readData(
                    key: UserStorageDataKeys.uId) ??
                ""),
        s1,
        s2,
        body: {
          'userName': '$name',
          'phone': '$number',
          'email': '$email',
          'address': '$addressId',
        },
        method: 'PUT');

    if (response != null) {
      if (imagePath != null) {
        UserDataStorageServices.writeData(
          key: UserStorageDataKeys.imageData,
          data: response['user']['image']['data'],
        );
        UserDataStorageServices.removeData(
          key: UserStorageDataKeys.imageUrl,
        );
      }
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.name,
        data: name,
      );
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.email,
        data: email,
      );
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.phone,
        data: number,
      );
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.addressId,
        data: addressId,
      );
      ShowToast.toast(
        msg: "${response['message'] ?? "Profile updated successfully"}",
      );
      onDone();
      Get.back();
    } else {
      onDone();
    }
  } catch (error) {
    onDone();
    ShowToast.errorSnackbar(
      title: "Error updating profile",
      msg: "$error",
    );
  }
}

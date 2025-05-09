import 'package:pro_deals1/imports.dart';

Future<void> addAddress({
  required String address,
  required String city,
  required String state,
  required String pincode,
  required String phone,
  required String email,
  required String userName,
  required String userId,
  required void Function() onDone,
}) async {
  try {
    var response = await ApiService.postApi(
      Apis.addressAdd,
      body: {
        'userName': userName,
        'phone': phone,
        'email': email,
        'address': address,
        'city': city,
        'state': state,
        'pincode': pincode,
        'userId': userId,
      },
    );
    if (response != null) {
      ShowToast.toast(
        msg: "${response['message'] ?? "Address added successfully"}",
      );
      Get.back(result: true);
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

Future<void> deleteAddress(String addressId) async {
  try {
    var response = await ApiService.deleteApi(
      Apis.deleteAddressById(aId: addressId),
    );
    if (response != null) {
      ShowToast.toast(
        msg: "${response['message'] ?? "Address deleted successfully"}",
      );
    }
  } catch (error) {
    ShowToast.errorSnackbar(
      title: "Error deleting address",
      msg: "$error",
    );
  }
}

Future<void> updateAddress({
  required String addressId,
  required String address,
  required String city,
  required String state,
  required String pincode,
  required String phone,
  required String email,
  required String userName,
  required void Function() onDone,
}) async {
  try {
    var response = await ApiService.putApi(
      Apis.updateAddressById(
        aId: addressId,
      ),
      body: {
        'userName': userName,
        'phone': phone,
        'email': email,
        'address': address,
        'city': city,
        'state': state,
        'pincode': pincode,
      },
    );
    if (response != null) {
      onDone();
      ShowToast.toast(
        msg: "${response['message'] ?? "Address updated successfully"}",
      );
      Get.back(result: true);
    } else {
      onDone();
    }
  } catch (error) {
    onDone();
    ShowToast.errorSnackbar(
      title: "Error updating address",
      msg: "$error",
    );
  }
}

Future<List<dynamic>> getAddress(String userId) async {
  try {
    var response = await ApiService.getApi(Apis.getAddressById(
      uId: UserDataStorageServices.readData(key: UserStorageDataKeys.uId),
    ));
    if (response != null) {
      return [true, response['addresses']];
    } else {
      return [false];
    }
  } catch (error) {
    ShowToast.errorSnackbar(
      title: "Error fetching address",
      msg: "$error",
    );
    return [false];
  }
}

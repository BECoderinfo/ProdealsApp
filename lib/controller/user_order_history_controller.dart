import 'package:pro_deals1/imports.dart';

class UserOrderHistoryController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllOrder();
  }

  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;

  RxList<UserOrderHistoryListModel> orderList =
      <UserOrderHistoryListModel>[].obs;

  getAllOrder() async {
    try {
      final response = await ApiService.getApi(Apis.getOrderByUserId(
          uId: UserDataStorageServices.readData(
                key: UserStorageDataKeys.uId,
              ) ??
              ""));

      if (response != null) {
        if (response['orders'] is List && response['orders'].isNotEmpty) {
          orderList.clear();
          response['orders']
              .map((e) => orderList.add(UserOrderHistoryListModel.fromJson(e)))
              .toList();
          orderList.value = orderList.reversed.toList();
        }
      }
      isLoaded.value = true;
    } catch (error) {
      isError.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  List<dynamic> getStatusName({int index = 0}) {
    if (orderList[index].status == 'Cancelled') {
      return [
        'Cancelled',
        AppColor.red,
      ];
    } else if (orderList[index].orderStatus == 'Rejected') {
      return [
        'Rejected',
        AppColor.red,
      ];
    } else if (orderList[index].orderStatus == 'Pending' &&
        orderList[index].status == 'Pending') {
      return [
        'Pending',
        AppColor.pendingStatusColor,
      ];
    } else if (orderList[index].orderStatus == 'Accepted' &&
        orderList[index].status == 'Processing') {
      return [
        'Accepted',
        AppColor.acceptStatusColor,
      ];
    } else {
      return [
        'Completed',
        AppColor.completedStatusColor,
      ];
    }
  }
}

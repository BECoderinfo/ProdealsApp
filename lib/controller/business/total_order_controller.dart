import 'package:pro_deals1/imports.dart';

class TotalOrderController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllOrder();
  }

  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxInt page = 0.obs;

  RxList<OrderListModel> orderList = <OrderListModel>[].obs;
  RxList<OrderListModel> backUpList = <OrderListModel>[].obs;

  getAllOrder() async {
    try {
      final response = await ApiService.getApi(Apis.getAllOrder(
          bId: UserDataStorageServices.readData(
                key: UserStorageDataKeys.businessId,
              ) ??
              ""));

      if (response != null) {
        if (response['orders'] is List && response['orders'].isNotEmpty) {
          orderList.clear();
          backUpList.clear();
          response['orders']
              .map((e) => orderList.add(OrderListModel.fromJson(e)))
              .toList();
          orderList.value = orderList.reversed.toList();
          backUpList.value = List.from(orderList);
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
    if (page.value == 1) {
      return [
        'Pending',
        AppColor.pendingStatusColor,
      ];
    } else if (page.value == 2) {
      return [
        'Accepted',
        AppColor.acceptStatusColor,
      ];
    } else if (page.value == 3) {
      return [
        'Completed',
        AppColor.completedStatusColor,
      ];
    } else {
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
}

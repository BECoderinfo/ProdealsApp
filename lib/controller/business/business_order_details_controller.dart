import 'package:pro_deals1/imports.dart';

class BusinessOrderDetailsController extends GetxController {
  final String oId = Get.arguments;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("$oId");
    getOrderDetails();
  }

  OrderListModel? orderDetails;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxString oStatus = "".obs;

  List<dynamic> getStatusName() {
    if (orderDetails?.status == 'Cancelled') {
      return [
        'Cancelled',
        AppColor.red,
      ];
    } else if (orderDetails?.orderStatus == 'Rejected') {
      return [
        'Rejected',
        AppColor.red,
      ];
    } else if (orderDetails?.orderStatus == 'Pending' &&
        orderDetails?.status == 'Pending') {
      return [
        'Pending',
        AppColor.pendingStatusColor,
      ];
    } else if (orderDetails?.orderStatus == 'Accepted' &&
        orderDetails?.status == 'Processing') {
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

  RxBool isChange = false.obs;

  getOrderDetails() async {
    try {
      final response = await ApiService.getApi(
        Apis.getOrderDetails(
          oId: oId,
        ),
      );

      if (response != null && response['data'] != null) {
        orderDetails = OrderListModel.fromJson(response['data']);
        oStatus.value = getStatusName().first;
        isLoaded.value = true;
      } else {
        isError.value = true;
      }
    } catch (error) {
      isError.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  RxBool isProcess = false.obs;

  changeOrderStatus({
    required Uri url,
  }) async {
    isProcess.value = true;
    try {
      final response = await ApiService.putApi(
        url,
      );

      if (response != null) {
        ShowToast.toast(
          msg: response['message'] ?? "Order status updated successfully.",
        );
        if (!isChange.value) {
          isChange.value = !isChange.value;
        }
        await getOrderDetails();
        oStatus.value = getStatusName().first;
        isProcess.value = false;
      }
      isProcess.value = false;
    } catch (error) {
      isProcess.value = false;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  Widget? getButton() {
    if (orderDetails?.orderStatus == 'Pending' &&
        orderDetails?.status == 'Pending') {
      return Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                changeOrderStatus(
                  url: Apis.rejectOrder(oId: orderDetails?.sId ?? ""),
                );
              },
              child: StatusButton(
                text: "Reject",
                textColor: AppColor.red,
                bColor: AppColor.red,
              ),
            ),
          ),
          Gap(15),
          Expanded(
            child: GestureDetector(
              onTap: () {
                changeOrderStatus(
                  url: Apis.acceptOrder(oId: orderDetails?.sId ?? ""),
                );
              },
              child: StatusButton(
                text: "Accept",
                textColor: AppColor.black300,
                bColor: AppColor.primary,
                backgroundColor: AppColor.primary,
              ),
            ),
          ),
        ],
      );
    } else if (orderDetails?.orderStatus == 'Accepted' &&
        orderDetails?.status == 'Processing') {
      return Row(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                changeOrderStatus(
                  url: Apis.cancelOrder(oId: orderDetails?.sId ?? ""),
                );
              },
              child: StatusButton(
                text: "Cancel",
                textColor: AppColor.red,
                bColor: AppColor.red,
              ),
            ),
          ),
          Gap(15),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                changeOrderStatus(
                  url: Apis.completeOrder(oId: orderDetails?.sId ?? ""),
                );
              },
              child: StatusButton(
                text: "Mark as completed",
                textColor: AppColor.primary,
                bColor: AppColor.primary,
              ),
            ),
          ),
        ],
      );
    }
    return Container();
  }

  String getOfferDiscount() {
    try {
      if ((orderDetails?.promocode ?? "").isNotEmpty) {
        return "${((int.tryParse("${orderDetails?.totalsave ?? "0"}") ?? double.parse("${orderDetails?.totalsave ?? "0"}")) - (int.tryParse("${orderDetails?.discount ?? "0"}") ?? double.parse("${orderDetails?.discount ?? "0"}"))).toStringAsFixed(0)}";
      } else {
        return "${int.tryParse("${orderDetails?.totalsave ?? "0"}") ?? double.parse("${orderDetails?.totalsave ?? "0"}").toStringAsFixed(0)}";
      }
    } catch (e) {
      return "";
    }
  }

  String getSubTotal() {
    try {
      return "${((int.tryParse("${orderDetails?.totalPrice ?? "0"}") ?? double.parse("${orderDetails?.totalPrice ?? "0"}")) + (int.tryParse("${getOfferDiscount()}") ?? double.parse("${getOfferDiscount()}")) + (int.tryParse("${orderDetails?.discount ?? "0"}") ?? double.parse("${orderDetails?.discount ?? "0"}"))).toStringAsFixed(0)}";
    } catch (e) {
      return "";
    }
  }
}

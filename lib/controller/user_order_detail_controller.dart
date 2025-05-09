import 'dart:developer';

import 'package:pro_deals1/imports.dart';

class UserOrderDetailController extends GetxController {
  final String oId;

  UserOrderDetailController({required this.oId});

  RxDouble rate = 0.0.obs;
  TextEditingController comment = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getOrderDetails();
  }

  OrderListModel? orderDetails;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxString oStatus = "".obs;

  RxBool isRate = false.obs;

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
    if ((orderDetails?.orderStatus == 'Pending' &&
            orderDetails?.status == 'Pending') ||
        (orderDetails?.orderStatus == 'Accepted' &&
            orderDetails?.status == 'Processing')) {
      return Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                changeOrderStatus(
                  url: Apis.cancelOrder(oId: orderDetails?.sId ?? ""),
                );
              },
              child: StatusButton(
                text: "Cancel order",
                textColor: AppColor.red,
                bColor: AppColor.red,
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

  void rateUs() async {
    try {
      isRate.value = true;
      final response = await ApiService.postApi(
        Apis.createRating,
        body: {
          "businessId": orderDetails?.businessId?.sId ?? "",
          "userId": orderDetails?.userId?.sId ?? "",
          "rating": rate.value.toString(),
          if (comment.text.isNotEmpty) "comment": comment.text
        },
      );

      if (response != null) {
        ShowToast.toast(
          msg: response['message'] ?? "Rating submitted successfully.",
        );
      }
    } catch (e) {
      ShowToast.errorSnackbar(title: "Error", msg: "$e");
    } finally {
      isRate.value = false;
    }
  }
}

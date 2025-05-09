import 'dart:ffi';

import 'package:pro_deals1/imports.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:pro_deals1/model_class/choose_plan_model.dart';

class PremiumPageController extends GetxController {
  RxBool isPlanDataLoaded = false.obs;
  RxBool isError = false.obs;
  RxList<PlansListModel> plansList = <PlansListModel>[].obs;

  late Razorpay _razorpay;

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    getAllPlans();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("SUCCESS: ${response.paymentId}");
    ShowToast.toast(msg: "Success: ${response.paymentId}");
    // TODO: Call backend to activate the plan or record transaction
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("ERROR: ${response.code} | ${response.message}");
    ShowToast.errorSnackbar(
        title: "Payment Failed", msg: "${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("EXTERNAL_WALLET: ${response.walletName}");
  }

  getAllPlans() async {
    try {
      final response = await ApiService.getApi(
        Apis.getAllPlan,
      );
      if (response != null) {
        if (response['data'] is List && response['data'].isNotEmpty) {
          response['data']
              .map(
                (e) => plansList.add(PlansListModel.fromJson(e)),
              )
              .toList();
        }
        isPlanDataLoaded.value = true;
      } else {
        isError.value = true;
      }
    } catch (error) {
      isError.value = true;
      ShowToast.errorSnackbar(
        title: "Error deleting address",
        msg: "$error",
      );
    }
  }

  String getMonthlyPrice({required PlansListModel plan}) {
    String name = plan.planDuration ?? "";
    double totalPrice = double.parse("${plan.planPrice ?? 0}");

    RegExp regex = RegExp(r'(\d+)_([a-zA-Z]+)');
    Match? match = regex.firstMatch(name);

    if (match != null) {
      int duration = int.parse(match.group(1)!);
      String timeUnit = match.group(2)!.toLowerCase();

      double months;

      switch (timeUnit) {
        case "months":
          months = duration.toDouble();
          break;
        case "month":
          months = duration.toDouble();
          break;
        case "days":
          months = duration / 30;
          break;
        case "day":
          months = duration / 30;
          break;
        case "year":
          months = duration * 12;
          break;
        default:
          months = duration * 12;
      }

      return (totalPrice / months).ceil().toString();
    }

    throw Exception("Invalid plan name format");
  }

  // void payWithRazorpay({required PlansListModel plan}) {
  //   double amount = double.parse(plan.planPrice.toString());
  //
  //   var options = {
  //     'key': 'rzp_test_4hNJFAWU11G0L3', // Replace with your Razorpay test key
  //     'amount': amount * 100, // amount in paise
  //     'name': 'Pro Deals Premium',
  //     'description': plan.planName ?? "Premium Plan",
  //     'prefill': {
  //       'contact': '9876543210',
  //       'email': 'test@razorpay.com',
  //     },
  //   };
  //
  //   try {
  //     _razorpay.open(options);
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }
}

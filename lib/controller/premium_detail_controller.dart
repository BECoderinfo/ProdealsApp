import 'dart:developer';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../imports.dart';
import '../model_class/choose_plan_model.dart';

class PremiumDetailController extends GetxController {
  final BuildContext ctx;

  final PlansListModel plan;

  PremiumDetailController({required this.plan, required this.ctx});

  String key = "rzp_test_4hNJFAWU11G0L3";

  RxBool isLoading = false.obs;

  late Razorpay _razorpay;

  RxString subId = "".obs;

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    try {
      isLoading.value = true;

      await 10.seconds.delay();

      var res = await ApiService.postApi(Apis.varifySub, body: {
        "razorpay_payment_id": response.paymentId,
        "razorpay_subscription_id": subId.value,
        "razorpay_signature": response.signature,
        "userId":
            UserDataStorageServices.readData(key: UserStorageDataKeys.uId),
        "planId": plan.sId,
        "autoRenew": "true"
      });

      if (res != null) {
        log("$res");

        if (res['success'] == true) {
          UserDataStorageServices.writeData(
            key: UserStorageDataKeys.isPremium,
            data: true,
          );
          UserDataStorageServices.writeData(
            key: UserStorageDataKeys.planId,
            data: plan.sId,
          );

          Get.offAllNamed('/navigation');
        }
      }
    } catch (e) {
      ShowToast.errorSnackbar(title: "Error", msg: "$e");
    } finally {
      isLoading.value = false;
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("ERROR: ${response.code} | ${response.message}");
    ShowToast.errorSnackbar(
        title: "Payment Failed", msg: "${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("EXTERNAL_WALLET: ${response.walletName}");
  }

  void createSub() async {
    try {
      isLoading.value = true;

      var res = await ApiService.postApi(Apis.createSub, body: {
        "autoRenew": "true",
        "planId": plan.sId,
      });

      if (res != null) {
        subId.value = res['subscription']["id"];
        isLoading.value = false;
        payWithRazorpay();
      }
    } catch (e) {
      ShowToast.errorSnackbar(title: "Error", msg: "$e");
    } finally {
      isLoading.value = false;
    }
  }

  void payWithRazorpay() {
    double amount = double.parse(plan.planPrice.toString());

    var options = {
      'key': key, // Replace with your Razorpay test key
      'amount': amount * 100, // amount in paise
      'name': plan.planName,
      'subscription_id': subId.value,
      'description': plan.planName ?? "Premium Plan",
      'prefill': {
        'contact':
            '${UserDataStorageServices.readData(key: UserStorageDataKeys.phone)}',
        'email':
            '${UserDataStorageServices.readData(key: UserStorageDataKeys.email)}',
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }
}

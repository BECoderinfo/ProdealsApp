import 'package:pro_deals1/imports.dart';

class ProfilePageController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("F ::");
    fetchData();
  }

  RxString name = "".obs;
  RxString imageUrl = "".obs;
  RxList<dynamic> image = <dynamic>[].obs;

  SubscriptionModel? subscription;

  RxBool isGetting = false.obs;

  fetchData() {
    getSub();
    name.value =
        UserDataStorageServices.readData(key: UserStorageDataKeys.name) ?? '';
    if (UserDataStorageServices.checkIfExist(
        key: UserStorageDataKeys.imageData)) {
      image.value =
          UserDataStorageServices.readData(key: UserStorageDataKeys.imageData);
    } else if (UserDataStorageServices.checkIfExist(
        key: UserStorageDataKeys.imageUrl)) {
      imageUrl.value =
          UserDataStorageServices.readData(key: UserStorageDataKeys.imageUrl);
    }
  }

  void getSub() async {
    try {
      isGetting.value = true;
      var res = await ApiService.getApi(Apis.getSubById(
          uId: UserDataStorageServices.readData(key: UserStorageDataKeys.uId) ??
              ""));

      if (res != null) {
        subscription = SubscriptionModel.fromJson(res);
      }
    } catch (e) {
      ShowToast.errorSnackbar(title: "Error", msg: "$e");
    } finally {
      isGetting.value = false;
    }
  }

  void showBusinessRequestDialog({required BuildContext ctx}) {
    showDialog(
      context: ctx,
      barrierDismissible: false, // Prevent closing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Request Business Registration'),
          content: Text('Do you want to send a request to create a business?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                UserDataStorageServices.removeData(
                  key: UserStorageDataKeys.businessCreateResponse,
                );
                UserDataStorageServices.removeData(
                  key: UserStorageDataKeys.businessStoreImageUpload,
                );
                Navigator.of(context).pop();
                Get.toNamed('/create_business');
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}

class SubscriptionModel {
  final String id;
  final String userId;
  final String planId;
  final String razorpaySubcriptionId;
  final String razorpayPlanId;
  final DateTime startDate;
  final DateTime endDate;
  final bool autoRenew;
  final int renewalPeriod;
  final bool isActive;
  final int v;

  SubscriptionModel({
    required this.id,
    required this.userId,
    required this.planId,
    required this.razorpaySubcriptionId,
    required this.razorpayPlanId,
    required this.startDate,
    required this.endDate,
    required this.autoRenew,
    required this.renewalPeriod,
    required this.isActive,
    required this.v,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
        id: json["_id"],
        userId: json["userId"],
        planId: json["planId"],
        razorpaySubcriptionId: json["razorpaySubcriptionId"],
        razorpayPlanId: json["razorpayPlanId"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        autoRenew: json["autoRenew"],
        renewalPeriod: json["renewalPeriod"],
        isActive: json["isActive"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "planId": planId,
        "razorpaySubcriptionId": razorpaySubcriptionId,
        "razorpayPlanId": razorpayPlanId,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "autoRenew": autoRenew,
        "renewalPeriod": renewalPeriod,
        "isActive": isActive,
        "__v": v,
      };
}

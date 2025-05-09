import 'package:pro_deals1/imports.dart';

class ActiveOfferController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllOffer(
      bId: UserDataStorageServices.readData(
            key: UserStorageDataKeys.businessId,
          ) ??
          "",
    );
  }

  RxList<OfferListModel> offerList = <OfferListModel>[].obs;

  RxBool isError = false.obs;
  RxBool isLoaded = false.obs;

  String calculateTimeDifference({required String createdDateStr}) {
    DateTime currentDate = DateTime.now();

    DateTime createdDate = DateTime.parse(createdDateStr);

    Duration difference = currentDate.difference(createdDate);
    int diffDays = difference.inDays;
    int diffMonths = (currentDate.year - createdDate.year) * 12 +
        (currentDate.month - createdDate.month);
    int diffYears = currentDate.year - createdDate.year;

    if (diffDays == 0) {
      return "Just arrived";
    } else if (diffDays < 30) {
      return "${diffDays} days ago";
    } else if (diffDays >= 30 && diffMonths < 12) {
      return "${diffMonths} months ago";
    } else if (diffYears >= 1) {
      return "${diffYears} years ago";
    } else {
      return "Unknown status";
    }
  }

  getAllOffer({required String bId}) async {
    try {
      final response = await ApiService.getApi(
        Apis.getOfferByBusinessId(bId: bId),
      );

      if (response != null) {
        if (response['offers'] is List && response['offers'].isNotEmpty) {
          offerList.clear();
          response['offers'].map((e) {
            offerList.add(OfferListModel.fromJson(e));

            if (!(offerList.last.isActive ?? false)) {
              offerList.removeLast();
            }
          }).toList();
          offerList.value = offerList.reversed.toList();
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

  RxString oId = "".obs;
  RxBool isProcess = false.obs;

  manageOffer({required int index}) async {
    oId.value = offerList[index].sId ?? "";
    try {
      final response = await ApiService.putApi(
        Apis.manageOffer(oId: oId.value),
        body: {
          "isActive": offerList[index].isActive ?? true ? 0 : 1,
        },
      );

      if (response != null) {
        getAllOffer(
          bId: UserDataStorageServices.readData(
                key: UserStorageDataKeys.businessId,
              ) ??
              "",
        );
        ShowToast.toast(
          msg: response['message'] ??
              "Offer ${offerList[index].isActive ?? true ? 'disabled' : 'enabled'} successfully.",
        );
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
}

import 'package:pro_deals1/imports.dart';

class RedeemedOffersController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRedeemedOffers();
  }

  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;

  RxList<RedeemedOfferListModel> redeemedOfferList =
      <RedeemedOfferListModel>[].obs;

  getRedeemedOffers() async {
    try {
      final response = await ApiService.getApi(
        Apis.offerRedeemed(
          uId: UserDataStorageServices.readData(key: UserStorageDataKeys.uId) ??
              "",
        ),
      );

      if (response != null &&
          response['offers'] is List &&
          response['offers'].isNotEmpty) {
        response['offers']
            .map(
              (e) => redeemedOfferList.add(RedeemedOfferListModel.fromJson(e)),
            )
            .toList();
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
}

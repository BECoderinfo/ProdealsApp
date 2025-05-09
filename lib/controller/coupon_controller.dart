import 'package:pro_deals1/imports.dart';

class CouponsController extends GetxController {
  RxDouble total = (0.0).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments != null) {
      total.value = Get.arguments;
    }
    getPromoCodes();
  }

  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;

  RxInt index = 0.obs;

  RxList<PromocodeListModel> promoList = <PromocodeListModel>[].obs;

  getPromoCodes() async {
    isLoaded.value = false;
    try {
      final response = await ApiService.getApi(
        Apis.getAllPromoCode,
      );

      if (response != null) {
        if (response['promocodes'] is List &&
            response['promocodes'].isNotEmpty) {
          response['promocodes']
              .map((e) => promoList.add(PromocodeListModel.fromJson(e)))
              .toList();
        }
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
}

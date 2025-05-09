import 'package:pro_deals1/imports.dart';

class BusinessAddressScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllCity();
  }

  RxList<String> cityList = <String>[].obs;
  RxBool isCityLoaded = false.obs;
  Rxn<String?> selectedValue = Rxn<String?>();

  Future<void> getAllCity() async {
    try {
      final response = await ApiService.getApi(
        Apis.getAllCity,
      );

      if (response != null) {
        final responseBody = response;
        if (responseBody['citys'] is List && responseBody['citys'].isNotEmpty) {
          cityList.clear();
          responseBody['citys']
              .map(
                (e) => cityList.add(CityListModel.fromJson(e).cityname ?? ""),
              )
              .toList();
        }
        isCityLoaded.value = true;
      } else {
        isCityLoaded.value = true;
      }
    } catch (error) {
      isCityLoaded.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  final TextEditingController stateController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void checkValidation() {
    var key = formKey.currentState;
    if (key!.validate()) {
      if (cityList.isNotEmpty && selectedValue.value == null) {
        ShowToast.toast(msg: "Please select city");
      } else {
        Get.toNamed(
          '/Profession_details',
          arguments: {
            "businessName": Get.arguments['name'],
            "contactNumber": Get.arguments['phone'],
            "address": addressController.text,
            "state": stateController.text,
            "city": selectedValue.value ?? "",
            "pincode": pincodeController.text,
            "mainImage": '${Get.arguments['image']}',
          },
        );
      }
    }
  }
}

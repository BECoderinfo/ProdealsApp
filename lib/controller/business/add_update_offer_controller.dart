import 'package:pro_deals1/imports.dart';

class AddUpdateOfferController extends GetxController {
  final data = Get.arguments;
  RxBool isEdit = false.obs;
  RxString oId = "".obs;
  RxBool isProcess = false.obs;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (data['isEdit'] is bool && data['isEdit']) {
      isEdit.value = true;
      OfferListModel offer = data['data'];
      oId.value = offer.sId ?? "";
      descriptionController.text = offer.description ?? "";
      if (typeList.contains(offer.offertype)) {
        selectedOfferType.value = offer.offertype;
      }
      productPriceController.text = offer.productPrice ?? "";
      discountValueController.text = offer.offerPrice ?? "";
      expiryDateController.text = (offer.expiryDate ?? "").substring(0, 10);
      setValidData(validOn: offer.validOn ?? "");
    }
  }

  setValidData({required String validOn}) {
    if (validOn.isEmpty) return;

    if (validOn.toLowerCase() == validDays.first.toLowerCase()) {
      selectedValidDays.value = validDays.first;
    } else {
      selectedValidDays.value = validDays.last;

      if (validOn.contains("-")) {
        selectedDays1.value = validOn.split("-").first.capitalizeFirst;
        selectedDays2.value = validOn.split("-").last.capitalizeFirst;
      } else {
        selectedDays1.value = validOn.capitalizeFirst;
        selectedDays2.value = validOn.capitalizeFirst;
      }
    }
  }

  TextEditingController descriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController discountValueController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  List<String> typeList = [
    'Amount',
    'Percentage',
  ];
  List<String> validDays = [
    'All days',
    'Custom',
  ];
  List<String> daysList = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  Rxn<String?> selectedOfferType = Rxn<String?>();
  RxString selectedOfferTypeError = "".obs;
  Rxn<String?> selectedValidDays = Rxn<String?>();
  RxString selectedValidDaysError = "".obs;
  Rxn<String?> selectedDays1 = Rxn<String?>();
  RxString selectedDays1Error = "".obs;
  Rxn<String?> selectedDays2 = Rxn<String?>();
  RxString selectedDays2Error = "".obs;

  void checkAndSwapValues() {
    if (selectedDays1.value != null && selectedDays2.value != null) {
      int startIndex = daysList.indexOf(selectedDays1.value ?? "");
      int endIndex = daysList.indexOf(selectedDays2.value ?? "");

      if (endIndex < startIndex) {
        String temp = selectedDays1.value ?? "";
        selectedDays1.value = selectedDays2.value;
        selectedDays2.value = temp;
      }
    }
  }

  checkValidation() {
    bool isError = false;

    if (selectedOfferType.value == null) {
      isError = true;
      selectedOfferTypeError.value = "Please select offer type";
    }

    if (selectedValidDays.value == null) {
      isError = true;
      selectedValidDaysError.value = "Please select offer valid days";
    } else if (selectedValidDays.value == validDays.last &&
        (selectedDays1.value == null || selectedDays2.value == null)) {
      isError = true;
      if (selectedDays1.value == null) {
        selectedDays1Error.value = "Please select offer start day";
      }
      if (selectedDays2.value == null) {
        selectedDays2Error.value = "Please select offer end day";
      }
    }

    if (!isError) {
      isProcess.value = true;
      if (isEdit.value) {
        callUpdateApi(
          id: oId.value,
        );
      } else {
        callAddApi();
      }
    }
  }

  String getValidDays() {
    if (selectedValidDays.value == validDays.first) {
      return "All days";
    } else if (selectedDays1.value == selectedDays2.value) {
      return "${selectedDays1.value}".toLowerCase();
    } else {
      return "${selectedDays1.value}-${selectedDays2.value}".toLowerCase();
    }
  }

  callUpdateApi({required String id}) async {
    try {
      String s = getValidDays();
      var response = await ApiService.putApi(
        Apis.updateOffer(oId: id),
        body: {
          "offertype": "${selectedOfferType.value}",
          "productPrice": productPriceController.text,
          "validOn": s,
          "offerPrice": discountValueController.text,
          "description": descriptionController.text,
          "expiryDate": expiryDateController.text,
        },
      );

      if (response != null) {
        ShowToast.toast(
          msg: response['message'] ?? "Offer updated successfully.",
        );
        Get.back(result: true);
      }
      isProcess.value = false;
    } catch (e) {
      isProcess.value = false;
      ShowToast.toast(
        msg: e.toString(),
      );
    }
  }

  callAddApi() async {
    try {
      String s = getValidDays();
      var response = await ApiService.postApi(
        Apis.addOffer,
        body: {
          "businessId": UserDataStorageServices.readData(
                key: UserStorageDataKeys.businessId,
              ) ??
              "",
          "offertype": "${selectedOfferType.value}",
          "productPrice": productPriceController.text,
          "validOn": s,
          "offerPrice": discountValueController.text,
          "description": descriptionController.text,
          "expiryDate": expiryDateController.text,
        },
      );

      if (response != null) {
        ShowToast.toast(
          msg: response['message'] ?? "Offer added successfully.",
        );
        Get.back(result: true);
      }
      isProcess.value = false;
    } catch (e) {
      isProcess.value = false;

      ShowToast.toast(
        msg: e.toString(),
      );
    }
  }
}

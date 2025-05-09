import 'package:pro_deals1/imports.dart';

class CategoryDetailController extends GetxController {
  final data = Get.arguments;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategoryBusinessData();
  }

  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;

  RxList<BusinessListModel> businessList = <BusinessListModel>[].obs;

  getCategoryBusinessData() async {
    try {
      var response = await ApiService.getApi(
        Apis.getBusinessByCategory(
          category: data,
        ),
      );
      businessList.clear();
      if (response != null &&
          response['businesses'] is List &&
          response['businesses'].isNotEmpty) {
        response['businesses']
            .map(
              (e) => businessList.add(BusinessListModel.fromJson(e)),
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

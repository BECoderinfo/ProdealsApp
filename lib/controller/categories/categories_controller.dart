import '../../imports.dart';

class CategoriesController extends GetxController {
  RxBool isCategoryLoaded = false.obs;
  RxBool isErrorInCategoryLoading = false.obs;

  RxList<CategoryListModel> categoryList = <CategoryListModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCategoryData();
  }

  Future<void> getCategoryData() async {
    try {
      var response = await ApiService.getApi(
        Apis.getAllCategory,
      );

      if (response != null) {
        if (response is List && response.isNotEmpty) {
          categoryList.clear();
          response
              .map(
                (e) => categoryList.add(CategoryListModel.fromJson(e)),
              )
              .toList();
        }
        isCategoryLoaded.value = true;
      } else {
        isErrorInCategoryLoading.value = true;
      }
    } catch (error) {
      isErrorInCategoryLoading.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }
}

import '../../imports.dart';

class SearchControllers extends GetxController {
  final HomePageController homePageController = Get.find<HomePageController>();

  RxString searchQuery = "".obs;
  RxString selectedCategory = ''.obs;

  RxList<BusinessListModel> filteredBusinessList = <BusinessListModel>[].obs;
  RxList<CategoryListModel> filteredCategoryList = <CategoryListModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredBusinessList.assignAll(homePageController.businessList);
    filteredCategoryList.assignAll(homePageController.categoryList);

    debounce(searchQuery, (_) {
      filterResults();
    }, time: Duration(milliseconds: 300));
  }

  void updateSearch(String value) {
    searchQuery.value = value;
  }

  void clearSearch() {
    searchQuery.value = '';
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
    filterResults();
  }

  void clearCategory() {
    selectedCategory.value = '';
    filterResults();
  }

  void filterResults() {
    final query = searchQuery.value.toLowerCase();
    final category = selectedCategory.value.toLowerCase();

    List<BusinessListModel> businesses = homePageController.businessList;

    if (query.isNotEmpty) {
      businesses = businesses
          .where((b) =>
              (b.businessName?.toLowerCase().contains(query) ?? false) ||
              (b.address?.toLowerCase().contains(query) ?? false))
          .toList();
    }

    if (category.isNotEmpty) {
      businesses = businesses
          .where((b) => b.category?.toLowerCase() == category)
          .toList();
    }

    filteredBusinessList.assignAll(businesses);
  }
}

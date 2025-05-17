import '../../imports.dart';

import 'package:get/get.dart';

class SearchControllers extends GetxController {
  // Search input
  var searchText = ''.obs;

  // Selected category
  var selectedCategory = ''.obs;

  // Dummy data
  final allItems = <Map<String, String>>[
    {"name": "Butter Chicken", "category": "North Indian"},
    {"name": "Margherita Pizza", "category": "Pizza"},
    {"name": "Chocolate Shake", "category": "Shake"},
    {"name": "Brownie", "category": "Desserts"},
    {"name": "Dark Chocolate", "category": "Chocolate"},
  ];

  // Filtered result
  RxList<Map<String, String>> filteredItems = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filterItems(); // Load initially
  }

  void updateSearch(String value) {
    searchText.value = value;
    filterItems();
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
    filterItems();
  }

  void filterItems() {
    final query = searchText.value.toLowerCase();
    final category = selectedCategory.value;

    filteredItems.value = allItems.where((item) {
      final matchesCategory = category.isEmpty || item['category'] == category;
      final matchesSearch =
          query.isEmpty || item['name']!.toLowerCase().contains(query);
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void clearSearch() {
    searchText.value = '';
    filterItems();
  }

  void clearCategory() {
    selectedCategory.value = '';
    filterItems();
  }
}

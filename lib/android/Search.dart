import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:pro_deals1/utils/colors.dart';

import '../controller/search/search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchControllers controller = Get.put(SearchControllers());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text(
          'Search',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/Filter');
            },
            icon: const Icon(
              Icons.filter_alt_outlined,
              size: 28,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Bar
            Obx(
              () => Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.black),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        onChanged: controller.updateSearch,
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(fontStyle: FontStyle.italic),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    if (controller.searchText.value.isNotEmpty)
                      GestureDetector(
                        onTap: controller.clearSearch,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white54,
                          ),
                          child: const Icon(Icons.close, size: 18),
                        ),
                      )
                  ],
                ),
              ),
            ),
            const Gap(16),

            // Category Chips
            Wrap(
              spacing: 8,
              children: [
                _buildCategoryChip(controller, 'North Indian'),
                _buildCategoryChip(controller, 'Pizza'),
                _buildCategoryChip(controller, 'Shake'),
                _buildCategoryChip(controller, 'Desserts'),
                _buildCategoryChip(controller, 'Chocolate'),
              ],
            ),
            const Gap(16),

            // Search Results
            Expanded(
              child: Obx(() {
                final results = controller.filteredItems;
                if (results.isEmpty) {
                  return const Center(child: Text("No results found."));
                }
                return ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final item = results[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        title: Text(item['name']!),
                        subtitle: Text(item['category']!),
                        leading: const Icon(Icons.fastfood),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(SearchControllers controller, String label) {
    return Obx(() {
      bool isSelected = controller.selectedCategory.value == label;
      return ChoiceChip(
        label: Text(
          label,
          style: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        selected: isSelected,
        backgroundColor: Colors.grey.shade200,
        selectedColor: AppColor.primary,
        onSelected: (selected) {
          if (selected) {
            controller.selectCategory(label);
          } else {
            controller.clearCategory();
          }
        },
      );
    });
  }
}

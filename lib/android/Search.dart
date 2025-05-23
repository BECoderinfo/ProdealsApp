import '../controller/search/search_controller.dart';
import '../imports.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Receive city or any argument if needed
    String? city = Get.arguments;

    // Use Get.find instead of put to avoid duplicate controllers if already exists
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Obx(() => Container(
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
                          onChanged: (val) =>
                              controller.searchQuery.value = val,
                          decoration: const InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      if (controller.searchQuery.value.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            controller.searchQuery.value = '';
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white54,
                            ),
                            child: const Icon(Icons.close, size: 18),
                          ),
                        ),
                    ],
                  ),
                )),
            const Gap(16),

            Text(
              'Categories',
              style: GoogleFonts.openSans(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Gap(8),

            // Category Chips (dynamically from filtered categories)
            Obx(() {
              final categories = controller.filteredCategoryList;
              if (categories.isEmpty) return const SizedBox();

              return Wrap(
                spacing: 8,
                children: categories.map((category) {
                  final label = category.category ?? "Unknown";
                  final isSelected = controller.selectedCategory.value == label;
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
                        controller.selectedCategory.value = label;
                        controller
                            .filterResults(); // Filter by category if needed
                      } else {
                        controller.selectedCategory.value = '';
                        controller.filterResults();
                      }
                    },
                  );
                }).toList(),
              );
            }),
            const Gap(12),

            Text(
              'Businesses',
              style: GoogleFonts.openSans(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Gap(8),

            // Search Results for Businesses
            Expanded(
              child: Obx(() {
                final results = controller.filteredBusinessList;
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
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        onTap: () {
                          Get.toNamed('/and_restaurant_details', arguments: {
                            'rId': item.sId ?? "",
                          })?.then((e) {
                            Get.delete<AndroidBusinessDetailController>();
                          });
                        },
                        // leading: const Icon(Icons.store, size: 40),
                        leading: item.mainImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.memory(
                                  Uint8List.fromList(
                                      item.mainImage!.data!.data!),
                                  width: 60,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Icon(Icons.store),
                        title: Text(item.businessName ?? 'Unknown'),
                        subtitle: Text(
                          "${item.category ?? 'No Category'} • ${item.address ?? 'No Address'}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 18),
                            Text((item.averageRating != null
                                ? double.parse(item.averageRating!)
                                    .toStringAsFixed(1)
                                : '0.0')),
                          ],
                        ),
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
}

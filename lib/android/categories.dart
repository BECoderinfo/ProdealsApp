import 'package:pro_deals1/controller/categories/categories_controller.dart';
import '../../imports.dart';
import '../widget/shimmerLoding.dart';

class categories extends StatelessWidget {
  const categories({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;

    final CategoriesController controller = Get.put(CategoriesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: AppColor.primary,
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isErrorInCategoryLoading.value) {
          return const Center(child: Text('Error loading categories'));
        }

        if (!controller.isCategoryLoaded.value) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemCount: 6,
              // You can show 6 shimmer cards while loading
              itemBuilder: (context, index) {
                return ShimmerLoading(
                  isLoading: true,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          );
        }

        if (controller.categoryList.isEmpty) {
          return const Center(child: Text('No categories available'));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            itemCount: controller.categoryList.length,
            itemBuilder: (context, index) {
              CategoryListModel category = controller.categoryList[index];
              return _buildCategoryCard(category, hit, wid, index);
            },
          ),
        );
      }),
    );
  }

  // 🔧 This is the same method used on the Home Page
  Widget _buildCategoryCard(category, double hit, double wid, int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          '/category_detail_screen',
          arguments: category.category ?? "",
        );
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 180, // Adjust this value as needed
          maxWidth: wid / 3.3,
        ),
        child: Container(
          height: hit / 4,
          width: wid / 3.6,
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        category.category ?? "",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          color:
                              Colors.primaries[index % Colors.primaries.length],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(8),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.memory(
                          Uint8List.fromList(category.image!.data!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: (hit / 6) / 2.4,
                width: wid / 3.6,
                decoration: BoxDecoration(
                  color: Colors.primaries[index % Colors.primaries.length],
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                height: (hit / 6) / 2.8,
                width: wid / 3.6,
                alignment: Alignment.center,
                child: ClipOval(
                  child: Image.memory(
                    Uint8List.fromList(category.icon!.data!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

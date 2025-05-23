import '../../controller/business/ratings_controller.dart';
import '../../imports.dart';
import '../../model_class/rating_model.dart';
import '../../widget/cupertino_my_drawer.dart';

class RatingsPage extends StatelessWidget {
  RatingsPage({super.key});

  final RatingsController controller = Get.put(RatingsController());

  final List<int> starFilterValues = [0, 5, 4, 3, 2, 1];
  final List<String> starLabels = ['All', '5★', '4★', '3★', '2★', '1★'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Business Ratings')),
      drawer: C_drawer(size.height, size.width),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            const SizedBox(height: 10),
            Text(
              'Average Rating: ${controller.averageRating.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 48,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: starFilterValues.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final value = starFilterValues[index];
                  final isSelected =
                      controller.selectedStarFilter.value == value;

                  return ChoiceChip(
                    label: Text(
                      starLabels[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: AppColor.primary,
                    backgroundColor: Colors.grey[200],
                    elevation: isSelected ? 4 : 0,
                    showCheckmark: false,
                    padding: EdgeInsets.symmetric(
                      horizontal: isSelected ? 20 : 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onSelected: (_) => controller.updateFilter(value),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  String bId = UserDataStorageServices.readData(
                          key: UserStorageDataKeys.businessId) ??
                      "";
                  await controller.fetchRatings(bId: bId);
                },
                child: controller.filteredRatings.isEmpty
                    ? ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(32),
                            child: Center(child: Text("No ratings found.")),
                          )
                        ],
                      )
                    : ListView.builder(
                        itemCount: controller.filteredRatings.length,
                        itemBuilder: (context, index) {
                          return RatingTile(
                              rating: controller.filteredRatings[index]);
                        },
                      ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class RatingTile extends StatelessWidget {
  final RatingModel rating;

  const RatingTile({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(rating.userId.userName,
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating.rating.round()
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                  size: 20,
                );
              }),
            ),
            const SizedBox(height: 4),
            Text(rating.comment),
            const SizedBox(height: 4),
            Text(
              DateFormat.yMMMd().format(rating.updatedAt),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

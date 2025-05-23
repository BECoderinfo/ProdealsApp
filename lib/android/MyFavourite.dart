import 'package:pro_deals1/imports.dart';

class Favourite extends GetView<FavouriteController> {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;

    return GetBuilder<FavouriteController>(
      init: FavouriteController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Favourite'),
            centerTitle: true,
            backgroundColor: AppColor.primary,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Obx(() {
              if (controller.isError.value) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.search_off_rounded, size: 80),
                      SizedBox(height: 16),
                      Text(
                        "Something went wrong. Please try again.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (controller.isLoading.value) {
                return ListView.builder(
                  itemCount: 4,
                  itemBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                );
              }

              if (controller.list.isEmpty) {
                return Center(
                  child: Text(
                    "You Need to Add Favourite.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }

              return ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  final business = controller.list[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/and_restaurant_details', arguments: {
                        'rId': business.sId ?? "",
                      })?.then((e) {
                        controller.getAllFavouriteBusiness();
                        Get.delete<AndroidBusinessDetailController>();
                      });
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xfff9f9f9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.gray.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.memory(
                                Uint8List.fromList(business.image!),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    business.name ?? "",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    business.address ?? "",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "⭐ ${business.ratting?.toStringAsFixed(1) ?? "0.0"}",
                                    style: TextStyle(
                                      color: AppColor.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                controller.removeFavourite(index: index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        );
      },
    );
  }
}

extension on String {
  toStringAsFixed(int i) {
    return double.parse(this).toStringAsFixed(i);
  }
}

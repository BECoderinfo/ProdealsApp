import 'package:pro_deals1/imports.dart';

import '../widget/shimmerLoding.dart';

class CategoryDetailScreen extends GetView<CategoryDetailController> {
  const CategoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryDetailController>(
      init: CategoryDetailController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Category details"),
            centerTitle: true,
            backgroundColor: const Color(0xFFD6AA26),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Obx(() {
              if (controller.isError.value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.search_off_rounded, size: 80),
                    const Gap(20),
                    const Text(
                      "Something went wrong please try again.",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ],
                );
              }

              final isLoading = !controller.isLoaded.value;
              final isEmpty = controller.businessList.isEmpty;

              if (!isLoading && isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Align(
                      child: Text(
                        "Business not found.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                );
              }

              final itemCount = isLoading ? 4 : controller.businessList.length;
              return ListView.separated(
                itemCount: itemCount,
                separatorBuilder: (context, index) => const Gap(10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final business =
                      isLoading ? null : controller.businessList[index];

                  return ShimmerLoading(
                    isLoading: isLoading,
                    child: business == null
                        ? _buildBusinessPlaceholderCard()
                        : GestureDetector(
                            onTap: () {
                              Get.toNamed('/and_restaurant_details',
                                  arguments: {
                                    'rId': business.sId ?? "",
                                  })?.then((_) => Get.delete<
                                  AndroidBusinessDetailController>());
                            },
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color(0xfff9f9f9),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.gray,
                                    blurRadius: 2,
                                    offset: const Offset(0.5, 0.5),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    if (business.mainImage?.data?.data != null)
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.memory(
                                          Uint8List.fromList(
                                              business.mainImage!.data!.data!),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    else
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    const Gap(10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            business.businessName ?? "",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${business.address ?? ""}, ${business.city ?? ""}",
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "⭐ ${business.averageRating?.toStringAsFixed(1) ?? "0.0"}",
                                            style: TextStyle(
                                              color: AppColor.primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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

  Widget _buildBusinessPlaceholderCard() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

extension on String {
  toStringAsFixed(int i) {
    return double.parse(this).toStringAsFixed(i);
  }
}

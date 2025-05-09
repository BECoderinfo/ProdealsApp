import 'package:pro_deals1/imports.dart';

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
            child: Obx(
              () => controller.isError.value
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 80,
                        ),
                        Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "Something went wrong please try again.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : controller.isLoaded.value
                      ? controller.businessList.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Business not found.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : ListView.builder(
                              itemCount: controller.businessList.length,
                              padding: EdgeInsets.symmetric(vertical: 8),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed('/and_restaurant_details',
                                        arguments: {
                                          'rId': controller
                                                  .businessList[index].sId ??
                                              "",
                                        })?.then((e) {
                                      Get.delete<
                                          AndroidBusinessDetailController>();
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      bottom: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.gray,
                                          blurRadius: 2,
                                          offset: const Offset(1, 1),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        controller.businessList[index].mainImage
                                                    ?.data?.data ==
                                                null
                                            ? Gap(0)
                                            : ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                ),
                                                child: Image.memory(
                                                  Uint8List.fromList(
                                                    controller
                                                        .businessList[index]
                                                        .mainImage!
                                                        .data!
                                                        .data!,
                                                  ),
                                                  width: 85,
                                                  height: 85,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                        Gap(10),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${controller.businessList[index].businessName ?? ""}",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Gap(5),
                                                Text(
                                                  "${controller.businessList[index].address ?? ""}, ${controller.businessList[index].city ?? ""}, ${controller.businessList[index].state ?? ""}-${controller.businessList[index].pincode ?? ""}",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                      : CustomCircularIndicator(
                          color: AppColor.primary,
                        ),
            ),
          ),
        );
      },
    );
  }
}

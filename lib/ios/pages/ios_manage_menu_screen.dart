import 'package:pro_deals1/imports.dart';

class iosManageMenuScreen extends GetView<ManageMenuController> {
  const iosManageMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return GetBuilder<ManageMenuController>(
      init: ManageMenuController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              Obx(
                () => controller.deleteButtonShow.value ||
                        controller.imageList.isEmpty
                    ? Gap(0)
                    : IconButton(
                        onPressed: () {
                          controller.deleteButtonShow.value = true;
                        },
                        icon: Icon(Icons.delete),
                      ),
              ),
              const Gap(16),
              BusinessImage.mainStoreImageWidget(),
              const Gap(16),
            ],
            elevation: 0,
          ),
          drawer: drawer(hit, wid),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => controller.deleteButtonShow.value
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  controller.imageIdList.clear();
                                  controller.deleteButtonShow.value = false;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(16),
                            Expanded(
                              child: controller.isProcess.value
                                  ? CustomCircularIndicator(
                                      color: AppColor.primary,
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        controller.isProcess.value = true;
                                        controller.deleteMenuImage();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.primary,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      )
                    : Gap(0),
              ),
            ],
          ),
          floatingActionButton: Obx(
            () => controller.isProcess.value && controller.imageIdList.isEmpty
                ? FloatingActionButton(
                    onPressed: () {},
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    child: CustomCircularIndicator(
                      color: AppColor.primary,
                    ),
                  )
                : FloatingActionButton.extended(
                    backgroundColor: AppColor.primary,
                    onPressed: () {
                      controller.imagePicker(context);
                    },
                    label: Text(
                      "Add menu image",
                      style: TextStyle(color: AppColor.white),
                    ),
                    icon: Icon(
                      Icons.add_rounded,
                      color: AppColor.white,
                    ),
                  ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "MANAGE MENU IMAGES",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Gap(20),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.memory(
                          Uint8List.fromList(
                            UserDataStorageServices.readData(
                                    key: UserStorageDataKeys.businessImage)
                                .where((element) =>
                                    element is int ||
                                    element is String ||
                                    element is double)
                                .map<int>((element) {
                              if (element is String) {
                                return int.tryParse(element) ?? 0;
                              } else if (element is double) {
                                return element.toInt();
                              }
                              return element as int;
                            }).toList(),
                          ),
                          fit: BoxFit.cover,
                          key: ValueKey('memoryImage'),
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/profile_image.png',
                              key: ValueKey('errorImage'),
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  "${UserDataStorageServices.readData(key: UserStorageDataKeys.businessName) ?? ""}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                          Gap(4),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.grey,
                                size: 14,
                              ),
                              Expanded(
                                child: Text(
                                  "${UserDataStorageServices.readData(key: UserStorageDataKeys.businessAddress) ?? ""}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                          Gap(4),
                          Row(
                            children: [
                              Text(
                                "${double.parse("${UserDataStorageServices.readData(key: UserStorageDataKeys.businessRatting) ?? "0"}").toStringAsFixed(1)}",
                                style: TextStyle(fontSize: 14),
                              ),
                              Gap(5),
                              RatingBar.builder(
                                itemBuilder: (context, index) {
                                  return Icon(
                                    Icons.star,
                                    color: Color(0xFFD6AA26),
                                    size: 16,
                                  );
                                },
                                onRatingUpdate: (value) {},
                                ignoreGestures: true,
                                allowHalfRating: true,
                                itemCount: 5,
                                updateOnDrag: false,
                                initialRating: double.parse(
                                    "${UserDataStorageServices.readData(key: UserStorageDataKeys.businessRatting) ?? "0"}"),
                                itemSize: 16,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Obx(
                  () => Expanded(
                    child: controller.isError.value
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off_rounded,
                                size: 80,
                              ),
                              Gap(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Gap(20),
                                  Expanded(
                                    child: Text(
                                      "Something went wrong please try again.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Gap(20),
                                ],
                              ),
                            ],
                          )
                        : !controller.isLoaded.value
                            ? CustomCircularIndicator(color: AppColor.primary)
                            : controller.imageList.isEmpty
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Gap(20),
                                          Expanded(
                                            child: Text(
                                              "Menu images not found.",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Gap(20),
                                        ],
                                      ),
                                    ],
                                  )
                                : MasonryGridView.builder(
                                    gridDelegate:
                                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    itemCount: controller.imageList.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 4,
                                              offset: const Offset(1, 1),
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        padding: const EdgeInsets.all(4.0),
                                        child: Stack(
                                          fit: StackFit.passthrough,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.memory(
                                                Uint8List.fromList(
                                                  controller.imageList[index]
                                                      .data!.data!,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Obx(
                                              () =>
                                                  controller.deleteButtonShow
                                                          .value
                                                      ? Positioned(
                                                          child: Checkbox(
                                                            value: controller
                                                                .imageIdList
                                                                .contains(controller
                                                                        .imageList[
                                                                            index]
                                                                        .sId ??
                                                                    ""),
                                                            onChanged: (value) {
                                                              if (controller
                                                                  .imageIdList
                                                                  .contains(controller
                                                                          .imageList[
                                                                              index]
                                                                          .sId ??
                                                                      "")) {
                                                                controller
                                                                    .imageIdList
                                                                    .remove(controller
                                                                            .imageList[index]
                                                                            .sId ??
                                                                        "");
                                                              } else {
                                                                controller
                                                                    .imageIdList
                                                                    .add(controller
                                                                            .imageList[index]
                                                                            .sId ??
                                                                        "");
                                                              }
                                                            },
                                                          ),
                                                          bottom: 0,
                                                          right: 0,
                                                        )
                                                      : Gap(0),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                  ),
                ),
                const Gap(50),
              ],
            ),
          ),
        );
      },
    );
  }
}

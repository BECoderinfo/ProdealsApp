import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class iosFavourite extends GetView<FavouriteController> {
  const iosFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;

    return GetBuilder<FavouriteController>(
      init: FavouriteController(),
      builder: (controller) {
        return CupertinoPageScaffold(
          child: Container(
            height: hit,
            width: wid,
            color: AppColor.white,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Gap(30),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 2,
                              spreadRadius: 0,
                              color: AppColor.gray,
                            ),
                          ],
                        ),
                        child: Icon(
                          CupertinoIcons.arrow_left,
                          size: 16,
                          color: AppColor.black300,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Favourite',
                        style: TextStyle(
                          color: AppColor.black300,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                // const Gap(20),
                Expanded(
                  child: Obx(
                    () => controller.list.isEmpty
                        ? Container(
                            height: hit * 0.3,
                            alignment: Alignment.center,
                            child: Text(
                              "You don't have any Favourite business.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.list.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: Card(
                                  child: GestureDetector(
                                    onTap: () {
                                      /// change the page name after completing
                                      Get.toNamed('/and_restaurant_details',
                                          arguments: {
                                            'rId': controller.list[index].sId ??
                                                "",
                                          })?.then((e) {
                                        controller.getAllFavouriteBusiness();
                                        Get.delete<
                                            AndroidBusinessDetailController>();
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 75,
                                          height: 75,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                            ),
                                            child: Image.memory(
                                              Uint8List.fromList(
                                                controller.list[index].image,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Gap(10),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.list[index].name,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_city,
                                                    size: 14,
                                                    color: AppColor.gray,
                                                  ),
                                                  Gap(5),
                                                  Expanded(
                                                    child: Text(
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      "${controller.list[index].address}",
                                                      style: TextStyle(
                                                          color: AppColor.gray),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: AppColor.primary,
                                                    size: 16,
                                                  ),
                                                  Text(
                                                    "${controller.list[index].ratting}",
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.primary),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Gap(10),
                                        IconButton(
                                          icon: Icon(Icons.favorite_rounded),
                                          onPressed: () {
                                            controller.removeFavourite(
                                              index: index,
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

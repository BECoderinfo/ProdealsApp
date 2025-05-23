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
                    Builder(
                      builder: (context) {
                        return Navigator.canPop(context)
                            ? GestureDetector(
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
                              )
                            : SizedBox.shrink();
                      },
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
                const Gap(20),
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
                        : ListView.separated(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => const Gap(14),
                            itemCount: controller.list.length,
                            itemBuilder: (context, index) {
                              final item = controller.list[index];

                              return Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/restaurant_details',
                                        arguments: {
                                          'rId': item.sId ?? "",
                                        })?.then((e) {
                                      Get.delete<
                                          AndroidBusinessDetailController>();
                                    });
                                  },
                                  child: Container(
                                    height: wid / 4.8,
                                    width: wid - 34,
                                    decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.08),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.memory(
                                              Uint8List.fromList(
                                                controller.list[index].image!,
                                              ),
                                              fit: BoxFit.cover,
                                              width: wid / 4.6,
                                              height: wid / 5,
                                            ),
                                          ),
                                          const Gap(20),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    controller
                                                            .list[index].name ??
                                                        "",
                                                    style: GoogleFonts.openSans(
                                                      color: AppColor.black300,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Text(
                                                  "${controller.list[index].category ?? 'No Category'} • ${controller.list[index].address ?? 'No Address'}",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: AppColor.black300,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Gap(8),
                                          Container(
                                            width: 1,
                                            color: Colors.grey.withOpacity(0.5),
                                          ),
                                          const Gap(8),
                                          Container(
                                            width: wid / 9,
                                            height: hit,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/Star.svg'),
                                                Text(
                                                  double.parse(controller
                                                              .list[index]
                                                              .ratting ??
                                                          "0.0")
                                                      .toStringAsFixed(1),
                                                  style: GoogleFonts.openSans(
                                                    color: AppColor.black300,
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

import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class iosNotification extends GetView<NotificationController> {
  const iosNotification({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      child: GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (controller) {
          return Container(
            height: height,
            width: width,
            color: AppColor.white,
            child: Obx(
              () {
                if (controller.isError.value) {
                  return Column(
                    children: [
                      _buildHeader(),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off_rounded, size: 80),
                            Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "Something went wrong please try again.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (controller.isNotificationLoaded.value) {
                  if (controller.notificationList.isEmpty) {
                    return Column(
                      children: [
                        _buildHeader(),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Notification not found.",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        _buildHeader(),
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller.notificationList.length,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 6),
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColor.gray.withOpacity(0.2),
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.bell,
                                        color: AppColor.primary,
                                        size: 24,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${controller.notificationList[index].title ?? ""}',
                                              style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.black300,
                                              ),
                                              maxLines: 1,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              '${controller.notificationList[index].description ?? ""}',
                                              style: GoogleFonts.openSans(
                                                fontSize: 14,
                                                color: AppColor.black300,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Gap(8),
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          '${controller.formatDateTime(DateTime.parse(controller.notificationList[index].createdAt ?? "${DateTime.now}").toLocal())}',
                                          style: GoogleFonts.openSans(
                                            fontSize: 12,
                                            color: AppColor.gray,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                } else {
                  return Column(
                    children: [
                      _buildHeader(),
                      Expanded(
                        child: CustomCircularIndicator(
                          color: AppColor.primary,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

Widget _buildHeader() {
  return Column(
    children: [
      const Gap(40),
      Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => Get.back(),
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
            ),
            Text(
              'Notification',
              style: TextStyle(
                color: AppColor.black300,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      const Gap(20),
    ],
  );
}

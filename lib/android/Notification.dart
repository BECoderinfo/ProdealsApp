import 'package:pro_deals1/imports.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (controller) {
          return Obx(
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
                : controller.isNotificationLoaded.value
                    ? controller.notificationList.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Notification not found.",
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
                            itemCount: controller.notificationList.length,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors
                                    .primaries[index % Colors.primaries.length]
                                    .shade50,
                                elevation: 1,
                                margin: EdgeInsets.all(8),
                                child: ListTile(
                                  title: Text(
                                    '${controller.notificationList[index].title ?? ""}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.notificationList[index].description ?? ""}',
                                        style: TextStyle(
                                            fontSize: 12, color: AppColor.gray),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const Gap(6),
                                      Text(
                                        '${controller.formatDateTime(DateTime.parse(controller.notificationList[index].createdAt ?? "${DateTime.now}").toLocal())}',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                    : CustomCircularIndicator(
                        color: AppColor.primary,
                      ),
          );
        },
      ),
    );
  }
}

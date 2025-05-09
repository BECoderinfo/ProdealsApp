import 'package:pro_deals1/imports.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllNotification();
  }

  RxList<NotificationListModel> notificationList =
      <NotificationListModel>[].obs;

  RxBool isNotificationLoaded = false.obs;
  RxBool isError = false.obs;

  getAllNotification() async {
    try {
      var response = await ApiService.getApi(
        Apis.getAllNotification,
      );

      if (response != null) {
        if (response['notifications'] is List &&
            response['notifications'].isNotEmpty) {
          notificationList.clear();
          response['notifications']
              .map(
                (e) => notificationList.add(NotificationListModel.fromJson(e)),
              )
              .toList();
        }
        isNotificationLoaded.value = true;
      } else {
        isError.value = true;
      }
    } catch (error) {
      isError.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  String formatDateTime(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(Duration(days: 1));

    if (dateTime.isAfter(today)) {
      return "Today ${DateFormat.jm().format(dateTime)}";
    } else if (dateTime.isAfter(yesterday)) {
      return "Yesterday ${DateFormat.jm().format(dateTime)}";
    } else {
      return DateFormat('dd MMM, yyyy hh:mm a').format(dateTime);
    }
  }
}

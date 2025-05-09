import '../imports.dart';

class MyDialog {
  static void alertDialog({
    required String title,
    required String description,
    required void Function()? onTap,
  }) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(title),
        content: Text(description),
        actions: [
          MyButtonOk(
            onTap: onTap,
          )
        ],
      ),
    );
  }
}

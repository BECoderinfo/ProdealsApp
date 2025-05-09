import 'package:pro_deals1/imports.dart';

class SupportController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllQuestions();
  }

  RxList<FAQQuestionList> faqList = <FAQQuestionList>[].obs;
  RxList<FAQQuestionList> myQuestionList = <FAQQuestionList>[].obs;

  RxBool isLoaded = false.obs;
  RxBool isProcess = false.obs;
  RxBool isError = false.obs;

  askQuestionDialog({
    required BuildContext ctx,
  }) {
    showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ask question"),
            ],
          ),
          content: TextField(
            controller: queController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Enter question',
            ),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColor.black,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text("Cancel"),
                    ),
                  ),
                ),
                Gap(10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => askQuestion(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  getAllQuestions() async {
    try {
      var response = await ApiService.getApi(
        Apis.getAllFAQ,
      );

      if (response != null) {
        if (response['quotations'] is List &&
            response['quotations'].isNotEmpty) {
          faqList.clear();
          myQuestionList.clear();
          response['quotations'].map(
            (e) {
               if (e['user'] ==
                  UserDataStorageServices.readData(
                      key: UserStorageDataKeys.uId)) {
                myQuestionList.add(FAQQuestionList.fromJson(e));
              } else {
                faqList.add(FAQQuestionList.fromJson(e));
              }
            },
          ).toList();
        }
        isLoaded.value = true;
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

  TextEditingController queController = TextEditingController();

  askQuestion() async {
    if (queController.text.isEmpty) {
      ShowToast.errorSnackbar(
        title: "Validation error",
        msg: "Please enter question",
      );
      return;
    }
    try {
      var response = await ApiService.postApi(
        Apis.askQuestion,
        body: {
          "user": UserDataStorageServices.readData(
            key: UserStorageDataKeys.uId,
          ),
          "quotation": queController.text,
        },
      );

      if (response != null) {
        ShowToast.toast(msg: response['message'] ?? '');
        Get.back();
        await getAllQuestions();
      }
      isProcess.value = false;
    } catch (error) {
      isProcess.value = false;
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

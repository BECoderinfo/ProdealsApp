import 'package:pro_deals1/imports.dart';

class BusinessProfessionProfileController extends GetxController {
  final data = Get.arguments;
  final formKey = GlobalKey<FormState>();

  final TextEditingController areaController = TextEditingController();
  final TextEditingController openingController = TextEditingController();
  final TextEditingController closetimeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  Rxn<String?> dayValue = Rxn<String>();
  List<String> day = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Open All Days",
  ];

  Future<String?> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(alwaysUse24HourFormat: false), // Ensures 12-hour format
          child: child!,
        );
      },
    );

    if (picked != null) {
      return MaterialLocalizations.of(context)
          .formatTimeOfDay(picked, alwaysUse24HourFormat: false)
          .toString();
    }
    return null;
  }

  RxBool isProcess = false.obs;

  checkValidation() {
    var key = formKey.currentState;
    if (key!.validate()) {
      if (dayValue.value == null) {
        ShowToast.toast(msg: "Please select close day");
      } else {
        callApi();
      }
    }
  }

  callApi() async {
    try {
      isProcess.value = true;
      var request = MultipartRequest(
        'POST',
        Apis.createBusiness,
      );
      Map<String, String> mapData = {};
      mapData = {
        "userId":
            UserDataStorageServices.readData(key: UserStorageDataKeys.uId) ??
                "",
        "businessName": data['businessName'],
        "contactNumber": data['contactNumber'],
        "address": data['address'],
        "state": data['state'],
        "city": data['city'],
        "landmark": data['landmark'],
        "pincode": data['pincode'],
        "category": data['category'],
        "gstNumber": data['gstNumber'],
        "panNumber": data['panNumber'],
        "openTime": openingController.text.toLowerCase(),
        "closeTime": closetimeController.text.toLowerCase(),
        "Description": descriptionController.text,
        "areaSqures": areaController.text,
      };
      if (dayValue.value != day.last) {
        mapData['offDays'] = dayValue.value ?? "";
      }
      request.files.add(
        await MultipartFile.fromPath(
          'proofImage',
          '${data['proofImage']}',
        ),
      );
      request.fields.addAll(mapData);

      StreamedResponse response =
          await request.send().timeout(Apis.timeoutDuration);

      var body = await response.stream.bytesToString();

      if (response.statusCode == 200 || response.statusCode == 201) {
        UserDataStorageServices.writeData(
          key: UserStorageDataKeys.businessCreateResponse,
          data: body,
        );
        uploadMainStoreImage(
          businessId: jsonDecode(body)['business']['_id'] ?? "",
        );
      } else {
        isProcess.value = false;
        ShowToast.errorSnackbar(
          title: "Error",
          msg: "${jsonDecode(body)['message'] ?? "Something went wrong."}",
        );
      }
    } on SocketException {
      isProcess.value = false;
      ApiService.handleSocketException();
    } on TimeoutException {
      isProcess.value = false;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Request timed out. Please try again.",
      );
    } catch (error) {
      isProcess.value = false;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  uploadMainStoreImage({required String businessId}) async {
    try {
      var request = MultipartRequest(
        'POST',
        Apis.mainImageUpload(bId: businessId),
      );
      request.files.add(
        await MultipartFile.fromPath(
          'mainImage',
          '${data['mainImage']}',
        ),
      );

      StreamedResponse response =
          await request.send().timeout(Apis.timeoutDuration);

      var body = await response.stream.bytesToString();

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.toNamed('/upload_store');
        isProcess.value = false;
      } else {
        isProcess.value = false;
        ShowToast.errorSnackbar(
          title: "Error",
          msg: "${jsonDecode(body)['message'] ?? "Something went wrong."}",
        );
      }
    } on SocketException {
      isProcess.value = false;
      ApiService.handleSocketException();
    } on TimeoutException {
      isProcess.value = false;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Request timed out. Please try again.",
      );
    } catch (error) {
      isProcess.value = false;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

//
}

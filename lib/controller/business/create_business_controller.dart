import 'package:pro_deals1/imports.dart';

class CreateBusinessScreenController extends GetxController {
  Rxn<File?> selectedImage = Rxn<File?>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isProcess = false.obs;

  void imagepicker(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (builder) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromcamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt_sharp,
                              size: 70,
                            ),
                            Text("Camera"),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    selectedImage.value = File(returnImage.path);

    Get.back();
  }

  Future _pickImageFromcamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    selectedImage.value = File(returnImage.path);
    Get.back();
  }

  requestBusiness() async {
    try {
      final response = await ApiService.postApi(
        Apis.businessRegister,
        body: {
          "userId":
              "${UserDataStorageServices.readData(key: UserStorageDataKeys.uId) ?? ""}",
          "businessName": nameController.text,
          "contactNumber": numberController.text,
        },
      );

      if (response != null) {
        isProcess.value = false;
        if (response['data'] == null) {
          // User already has business or other message
          if (response['message'] == 'User is already a business') {
            UserDataStorageServices.writeData(
              key: UserStorageDataKeys.isBusiness,
              data: true,
            );
            // Also save that user has business request accepted
            UserDataStorageServices.writeData(
              key: UserStorageDataKeys.businessRequestAccepted,
              data: true,
            );
            Get.toNamed('/Business_address', arguments: {
              'name': nameController.text,
              'phone': numberController.text,
              'image': selectedImage.value?.path ?? "",
            });
          } else {
            ShowToast.toast(msg: response['message']);
          }
        } else {
          // Request sent, store request id and mark request sent
          final data = jsonDecode(response.body)['data'];
          UserDataStorageServices.writeData(
            key: UserStorageDataKeys.reqBusinessId,
            data: data['_id'],
          );
          UserDataStorageServices.writeData(
            key: UserStorageDataKeys.businessRequestSent,
            data: true,
          );

          MyDialog.alertDialog(
            onTap: () {
              Get.back();
              Get.back();
            },
            title: "Business Request Sent",
            description:
                "Your request to create a new business has been successfully sent to the admin. You will be notified once the request is reviewed and approved.",
          );
        }
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

  checkValidation() {
    var key = formKey.currentState;
    UserDataStorageServices.removeData(key: UserStorageDataKeys.reqBusinessId);
    if (key!.validate()) {
      if (selectedImage.value == null) {
        ShowToast.toast(msg: "Please select image");
      } else {
        if (UserDataStorageServices.checkIfExist(
                key: UserStorageDataKeys.reqBusinessId) ||
            UserDataStorageServices.readData(
                key: UserStorageDataKeys.isBusiness)) {
          Get.toNamed('/Business_address', arguments: {
            'name': nameController.text,
            'phone': numberController.text,
            'image': selectedImage.value?.path ?? "",
          });
        } else {
          isProcess.value = true;
          requestBusiness();
        }
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (UserDataStorageServices.checkIfExist(
            key: UserStorageDataKeys.businessStoreImageUpload,
          ) &&
          (UserDataStorageServices.readData(
                key: UserStorageDataKeys.businessStoreImageUpload,
              ) ??
              false)) {
        Get.back();
        Get.toNamed('/verify');
      } else if (UserDataStorageServices.checkIfExist(
        key: UserStorageDataKeys.businessCreateResponse,
      )) {
        Get.back();
        Get.toNamed('/Profession_details');
      }
    });
  }
}

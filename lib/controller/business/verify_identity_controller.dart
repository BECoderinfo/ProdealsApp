import 'package:pro_deals1/imports.dart';

class VerifyIdentityController extends GetxController {
  Widget imagePickerWidget({required String type}) {
    return InkWell(
      onTap: () {
        imagePicker(Get.context!, type: type);
      },
      child: Container(
        height: 200,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Stack(
          children: [
            if (getFile(type: type) != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  getFile(type: type),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            if (getFile(type: type) == null)
              const Center(
                child: Icon(
                  Icons.photo_camera_back_outlined,
                  color: Colors.grey,
                  size: 50,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void imagePicker(BuildContext context, {required String? type}) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery().then(
                          (value) {
                            if (value is XFile) {
                              if (type == "1") {
                                voterId.value = File(value.path);
                              } else {
                                govermentId.value = File(value.path);
                              }
                            }
                          },
                        );
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
                        _pickImageFromCamera();
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
            ],
          ),
        );
      },
    );
  }

  Future<XFile?> _pickImageFromGallery() async {
    Get.back();
    return await MyVariables.imagePicker.pickImage(source: ImageSource.gallery);
  }

  Future<XFile?> _pickImageFromCamera() async {
    Get.back();
    return await MyVariables.imagePicker.pickImage(source: ImageSource.camera);
  }

  Rxn<File?> voterId = Rxn<File?>();
  Rxn<File?> govermentId = Rxn<File?>();

  getFile({required String type}) {
    if (type == "1") {
      return voterId.value;
    }
    return govermentId.value;
  }

  RxBool isProcess = false.obs;

  uploadImage() async {
    String bId = jsonDecode(UserDataStorageServices.readData(
                key: UserStorageDataKeys.businessCreateResponse) ??
            "")['business']['_id'] ??
        "";
    if (bId.isEmpty) {
      return ShowToast.toast(
        msg: "Something went wrong while verify your identity",
      );
    }
    isProcess.value = true;
    dynamic d = await uploadIdImage(
      url: Apis.voterIdImageUpload(bId: bId),
      imagePath: voterId.value?.path ?? "",
      param: 'waterIdImage',
    );

    if (d is bool && d) {
      dynamic d = await uploadIdImage(
        url: Apis.govermentIdImageUpload(bId: bId),
        imagePath: govermentId.value?.path ?? "",
        param: 'govermentIdImage',
      );
      if (d is bool && d) {
        UserDataStorageServices.writeData(
          key: UserStorageDataKeys.isBusinessLogin,
          data: true,
        );

        bool b = await getBusinessById(bId: bId);
        if (b) {
          UserDataStorageServices.writeData(
            key: UserStorageDataKeys.businessId,
            data: bId,
          );
          UserDataStorageServices.writeData(
            key: UserStorageDataKeys.cPanel,
            data: "${panel.business}",
          );
          Navigator.popUntil(Get.context!, (route) => route.isFirst);
          Get.toNamed('/successfully');
        } else {
          Get.toNamed('/dashboard');
        }
      } else {
        isProcess.value = false;
        ShowToast.toast(
          msg: "Something went wrong while verify identity",
        );
      }
    } else {
      isProcess.value = true;
      ShowToast.toast(
        msg: "Something went wrong while verify identity",
      );
    }
  }

  Future<dynamic> uploadIdImage({
    required Uri url,
    required String param,
    required String imagePath,
  }) async {
    try {
      var request = MultipartRequest(
        'POST',
        url,
      );
      request.files.add(
        await MultipartFile.fromPath(
          '$param',
          '$imagePath',
        ),
      );

      StreamedResponse response =
          await request.send().timeout(Apis.timeoutDuration);

      var body = await response.stream.bytesToString();

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        ShowToast.errorSnackbar(
          title: "Error",
          msg: "${jsonDecode(body)['message'] ?? "Something went wrong."}",
        );
        return false;
      }
    } on SocketException {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        ShowToast.errorSnackbar(
          title: "Error",
          msg: "Something went wrong. Please try again.",
        );
      } else {
        ShowToast.errorSnackbar(
          title: "Error",
          msg: "No internet connection.",
        );
      }

      return false;
    } on TimeoutException {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "Request timed out. Please try again.",
      );
      return false;
    } catch (error) {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
      return false;
    }
  }
}

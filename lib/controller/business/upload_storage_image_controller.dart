import 'package:pro_deals1/imports.dart';

class UploadStorageImageController extends GetxController {
  void imagePicker(BuildContext context, {required int index}) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return Container(
          padding: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, -4),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select Image Source",
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOption(
                    context: context,
                    icon: Icons.image,
                    label: "Gallery",
                    onTap: () {
                      _pickImageFromGallery(i: index);
                      Navigator.pop(context);
                    },
                    gradientColors: [Colors.purple, Colors.pink],
                  ),
                  _buildOption(
                    context: context,
                    icon: Icons.camera_alt_sharp,
                    label: "Camera",
                    onTap: () {
                      _pickImageFromCamera(i: index);
                      Navigator.pop(context);
                    },
                    gradientColors: [Colors.blue, Colors.green],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildOption({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required List<Color> gradientColors,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImageFromGallery({required int i}) async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;
    if (i >= 0 && i < selectedImage.length) {
      selectedImage[i] = File(pickedImage.path);
    } else {
      selectedImage.add(File(pickedImage.path));
    }
  }

  Future<void> _pickImageFromCamera({required int i}) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage == null) return;
    if (i >= 0 && i < selectedImage.length) {
      selectedImage[i] = File(pickedImage.path);
    } else {
      selectedImage.add(File(pickedImage.path));
    }
  }

  Widget ImagePickerContainer({required int i}) {
    return InkWell(
      onTap: () {
        imagePicker(Get.context!, index: i);
      },
      child: Container(
        height: 140,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Stack(
          children: [
            if (selectedImage.isNotEmpty &&
                (i >= 0 && i < selectedImage.length))
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  selectedImage[i]!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            if (selectedImage.isEmpty || !(i >= 0 && i < selectedImage.length))
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Material(
                    color: Colors.transparent,
                    child: Image.asset(
                      "assets/images/Group 3747.png",
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  RxList<File?> selectedImage = <File?>[].obs;
  RxBool isProcess = false.obs;

  uploadImage() async {
    int i = 0;
    String bId = jsonDecode(UserDataStorageServices.readData(
                key: UserStorageDataKeys.businessCreateResponse) ??
            "")['business']['_id'] ??
        "";
    if (bId.isEmpty) {
      return ShowToast.toast(
        msg: "Something went wrong while upload store image",
      );
    }
    isProcess.value = true;
    for (var e in selectedImage) {
      dynamic d = await uploadStoreImage(
        imagePath: e?.path ?? "",
        businessId: bId,
      );
      if (d is bool && !d) {
        isProcess.value = false;
        break;
      } else {
        i++;
      }
    }

    if (i == selectedImage.length) {
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.businessStoreImageUpload,
        data: true,
      );
      isProcess.value = false;
      Get.toNamed('/verify');
    }
  }

  Future<dynamic> uploadStoreImage({
    required String businessId,
    required String imagePath,
  }) async {
    try {
      var request = MultipartRequest(
        'POST',
        Apis.storeImageUpload(bId: businessId),
      );
      request.files.add(
        await MultipartFile.fromPath(
          'storeImage',
          '$imagePath',
        ),
      );

      StreamedResponse response =
          await request.send().timeout(Apis.timeoutDuration);

      var body = await response.stream.bytesToString();

      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {
        ShowToast.errorSnackbar(
          title: "Error",
          msg: "${jsonDecode(body)['message'] ?? "Something went wrong."}",
        );
        return false;
      }
    } on SocketException {
      ApiService.handleSocketException();

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

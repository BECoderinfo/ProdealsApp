import 'package:pro_deals1/imports.dart';

class ManageMenuController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMenuImage(
      bId: UserDataStorageServices.readData(
            key: UserStorageDataKeys.businessId,
          ) ??
          "",
    );
  }

  RxList<MultipleImages> imageList = <MultipleImages>[].obs;

  RxBool isError = false.obs;
  RxBool isLoaded = false.obs;

  getMenuImage({required String bId}) async {
    try {
      final response = await ApiService.getApi(
        Apis.getMenuImages(bId: bId),
      );

      if (response != null) {
        if (response['business'] is List && response['business'].isNotEmpty) {
          imageList.clear();
          response['business']
              .map((e) => imageList.add(MultipleImages.fromJson(e)))
              .toList();
          imageList.value = imageList.reversed.toList();
        }
      }
      isLoaded.value = true;
    } catch (error) {
      isError.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  RxBool isProcess = false.obs;
  RxBool deleteButtonShow = false.obs;
  RxList<String> imageIdList = <String>[].obs;

  deleteMenuImage() async {
    try {
      var response = await ApiService.deleteApiBody(
        Apis.deleteBusinessImagesById(
            bId: UserDataStorageServices.readData(
                  key: UserStorageDataKeys.businessId,
                ) ??
                ""),
        {
          "storeImages": [],
          "menuImages": imageIdList,
        },
      );

      if (response != null) {
        List<MultipleImages> idd = List.from(imageList);
        for (var e in imageList) {
          if (imageIdList.contains((e.sId ?? ""))) {
            idd.remove(e);
          }
        }
        imageList.value = idd;
        imageIdList.clear();
        ShowToast.toast(
          msg: response['message'] ?? "Images delete successfully",
        );
      }
      imageIdList.clear();
      deleteButtonShow.value = false;
      isProcess.value = false;
    } catch (e) {
      ShowToast.toast(
        msg: "${e}",
      );

      imageIdList.clear();
      deleteButtonShow.value = false;
      isProcess.value = false;
    }
  }

  void imagePicker(BuildContext context) {
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
                      _pickImageFromGallery();
                      Navigator.pop(context);
                    },
                    gradientColors: [Colors.purple, Colors.pink],
                  ),
                  _buildOption(
                    context: context,
                    icon: Icons.camera_alt_sharp,
                    label: "Camera",
                    onTap: () {
                      _pickImageFromCamera();
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

  Future<void> _pickImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickMultiImage(limit: 5);

    if (pickedImage.isNotEmpty) {
      isProcess.value = true;
      for (var item in pickedImage) {
        await uploadMenuImage(path: item.path);
      }
      isProcess.value = false;
    }
  }

  Future<void> _pickImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage == null) return;

    uploadMenuImage(path: pickedImage.path);
  }

  uploadMenuImage({required String path}) async {
    try {
      final response = await ApiService.multipartApi(
        Apis.menuImageUpload(
          bId: UserDataStorageServices.readData(
                key: UserStorageDataKeys.businessId,
              ) ??
              "",
        ),
        'menuImage',
        path,
      );

      if (response != null) {
        imageList.insert(
          0,
          MultipleImages.fromJson(response['business']['menuImages'].last),
        );
      }
    } catch (error) {
      isProcess.value = false;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }
}

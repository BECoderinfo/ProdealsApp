import 'package:pro_deals1/imports.dart';

Business? data;

class EditBusinessProfileController extends GetxController {
  RxList<String> categoryList = <String>[].obs;
  RxList<String> cityList = <String>[].obs;
  RxList<MultipleImages> storeImages = <MultipleImages>[].obs;

  Future<void> getAllCity() async {
    try {
      var response = await ApiService.getApi(
        Apis.getAllCity,
      );

      if (response != null) {
        if (response['citys'] is List && response['citys'].isNotEmpty) {
          cityList.clear();
          response['citys']
              .map(
                (e) => cityList.add(CityListModel.fromJson(e).cityname ?? ""),
              )
              .toList();
          if (cityList.contains(data?.city ?? "")) {
            citySelected.value = data?.city;
          }
        }
      }
    } catch (error) {}
  }

  Future<void> getCategoryData() async {
    try {
      var response = await ApiService.getApi(
        Apis.getAllCategory,
      );

      if (response != null) {
        if (response is List && response.isNotEmpty) {
          categoryList.clear();
          response
              .map(
                (e) => categoryList
                    .add(CategoryListModel.fromJson(e).category ?? ""),
              )
              .toList();
          if (categoryList.contains(data?.category ?? "")) {
            categorySelected.value = data?.category;
          }
        }
      }
    } catch (error) {}
  }

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

  checkValidation() {
    var key = formKey.currentState;
    if (key?.validate() ?? false) {
      if (isImage(data?.mainImage?.data?.data ?? [])) {
        ShowToast.toast(msg: "Please select image");
      } else {
        p.animateToPage(
          1,
          duration: Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      }
    }
  }

  checkValidationAddress() {
    var key = formKey1.currentState;
    if (key!.validate()) {
      if (cityList.isNotEmpty && citySelected.value == null) {
        ShowToast.toast(msg: "Please select city");
      } else {
        p.animateToPage(
          2,
          duration: Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      }
    }
  }

  checkValidationProfessionalProfile() {
    var key = formKey2.currentState;
    if (key!.validate()) {
      if (categoryList.isNotEmpty && categorySelected.value == null) {
        ShowToast.toast(msg: "Please select category");
      } else {
        isProcess.value = true;
        callApiUpdateDetails();
      }
    }
  }

  callApiUpdateDetails() async {
    try {
      Map<String, String> mapData = {};
      mapData = {
        "userId": data?.userId?.sId ?? "",
        "businessName": nameController.text,
        "address": addressController.text,
        "state": stateController.text,
        "city": citySelected.value ?? "",
        "pincode": pincodeController.text,
        "category": categorySelected.value ?? "",
        "openTime": openTimeController.text.toLowerCase(),
        "closeTime": closeTimeController.text.toLowerCase(),
        "Description": descriptionController.text,
        "areaSqures": areaController.text,
      };
      if (closeDaysSelected.value != day.last) {
        mapData['offDays'] = closeDaysSelected.value ?? "";
      }

      final response = await ApiService.putApi(
        Apis.updateBusinessById(
            bId: UserDataStorageServices.readData(
                  key: UserStorageDataKeys.businessId,
                ) ??
                ""),
        body: mapData,
      );
      if (response != null) {
        isProcess.value = false;
        p.animateToPage(
          3,
          duration: Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      } else {
        isProcess.value = false;
        ShowToast.errorSnackbar(
          title: "Error",
          msg: "${response['message'] ?? "Something went wrong."}",
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
                      pickImageFromGallery(i: index);
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

  RxList<File?> selectedImage = <File?>[].obs;

  Future<void> pickImageFromGallery({required int i}) async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;
    selectedImage[i] = File(pickedImage.path);
    isButtonShow.value = true;
    imageIdList.clear();
    deleteButtonShow.value = false;
  }

  Future<void> _pickImageFromCamera({required int i}) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage == null) return;
    selectedImage[i] = File(pickedImage.path);
    isButtonShow.value = true;
    imageIdList.clear();
    deleteButtonShow.value = false;
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
          alignment: Alignment.center,
          children: [
            if (selectedImage[i] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  selectedImage[i]!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            if (i >= 0 && i < (storeImages.length))
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.memory(
                  Uint8List.fromList(storeImages[i].data!.data!),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Positioned(
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
                    );
                  },
                ),
              ),
            if ((i >= 0 && i < selectedImage.length))
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Obx(
                  () => deleteButtonShow.value &&
                          i >= 0 &&
                          i < (data?.storeImages?.length ?? 0)
                      ? Checkbox(
                          value: imageIdList
                              .contains(data?.storeImages?[i].sId ?? ""),
                          onChanged: (value) {
                            if (imageIdList
                                .contains(data?.storeImages?[i].sId ?? "")) {
                              imageIdList.remove(data?.storeImages?[i].sId);
                            } else {
                              imageIdList.add(data?.storeImages?[i].sId ?? "");
                            }
                          },
                        )
                      : Center(
                          child: Material(
                            color: Colors.transparent,
                            child: Image.asset(
                              "assets/images/Group 3747.png",
                            ),
                          ),
                        ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  RxBool isProcess = false.obs;
  RxList<String> imageIdList = <String>[].obs;

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    mainImage.value = File(returnImage.path);

    Get.back();
  }

  Future _pickImageFromcamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    mainImage.value = File(returnImage.path);
    Get.back();
  }

  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setData();
  }

  bool isImage(List<int> bytes) {
    if (bytes.isEmpty) return true;

    if (bytes.length > 8 &&
        bytes[0] == 137 &&
        bytes[1] == 80 &&
        bytes[2] == 78 &&
        bytes[3] == 71 &&
        bytes[4] == 13 &&
        bytes[5] == 10 &&
        bytes[6] == 26 &&
        bytes[7] == 10) {
      return false;
    }

    if (bytes.length > 2 && bytes[0] == 255 && bytes[1] == 216) {
      if (bytes[bytes.length - 2] == 255 && bytes[bytes.length - 1] == 217) {
        return false;
      }
    }

    if (bytes.length > 6 &&
        bytes[0] == 71 &&
        bytes[1] == 73 &&
        bytes[2] == 70 &&
        bytes[3] == 56) {
      return false;
    }

    if (mainImage.value != null) {
      return false;
    }

    return true;
  }

  RxBool isButtonShow = false.obs;
  RxBool deleteButtonShow = false.obs;
  RxInt pageIndex = 0.obs;

  PageController p = PageController();

  setData() async {
    nameController.text = data?.businessName ?? "";
    phoneController.text = data?.contactNumber ?? "";
    addressController.text = data?.address ?? "";

    stateController.text = data?.state ?? "";
    pincodeController.text = "${data?.pincode ?? ""}";
    areaController.text = "${data?.areaSqures ?? ""}";
    openTimeController.text = "${data?.openTime ?? ""}";
    closeTimeController.text = "${data?.closeTime ?? ""}";
    if (data?.offDays != null && data?.offDays != "") {
      closeDaysSelected.value = data?.offDays;
    } else {
      closeDaysSelected.value = day.last;
    }
    descriptionController.text = "${data?.description ?? ""}";
    selectedImage.value = List.generate(
      6,
      (index) => null,
    );
    storeImages.addAll(data?.storeImages ?? []);
    await getCategoryData();
    await getAllCity();
  }

  updateBusinessImages() async {
    try {
      List<String> iPath = [];
      List<String> iParam = [];
      if (mainImage.value != null) {
        iParam.add('mainImage');
        iPath.add(mainImage.value?.path ?? "");
      }

      for (int i = 0; i < selectedImage.length; i++) {
        if (selectedImage[i] != null) {
          iParam.add('storeImages');
          iPath.add(selectedImage[i]?.path ?? "");
        }
      }
      var response = await ApiService.multipartApi(
        (Apis.updateBusinessImagesById(
            bId: UserDataStorageServices.readData(
                  key: UserStorageDataKeys.businessId,
                ) ??
                "")),
        iParam,
        iPath,
        method: 'PUT',
      );

      if (response != null) {
        isProcess.value = false;
        Get.back();
      } else {
        isProcess.value = false;
        ShowToast.errorSnackbar(
          title: "Error",
          msg: "${response['message'] ?? "Something went wrong."}",
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

  Rxn<File?> mainImage = Rxn<File?>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  Rxn<String?> citySelected = Rxn<String?>();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  Rxn<String?> categorySelected = Rxn<String?>();
  TextEditingController areaController = TextEditingController();
  TextEditingController openTimeController = TextEditingController();
  TextEditingController closeTimeController = TextEditingController();
  Rxn<String?> closeDaysSelected = Rxn<String?>();
  TextEditingController descriptionController = TextEditingController();

  deleteMultipleImages() async {
    try {
      var response = await ApiService.deleteApiBody(
        Apis.deleteBusinessImagesById(
            bId: UserDataStorageServices.readData(
                  key: UserStorageDataKeys.businessId,
                ) ??
                ""),
        {
          "menuImages": [],
          "storeImages": imageIdList,
        },
      );

      if (response != null) {
        List<MultipleImages> idd = List.from(data!.storeImages!);
        for (var e in data!.storeImages!) {
          if (imageIdList.contains((e.sId ?? ""))) {
            idd.remove(e);
          }
        }
        storeImages.value = idd;
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
}

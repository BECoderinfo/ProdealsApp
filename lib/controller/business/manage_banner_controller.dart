import 'package:pro_deals1/imports.dart';

class ManageBannerController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllBanner(
      bId: UserDataStorageServices.readData(
            key: UserStorageDataKeys.businessId,
          ) ??
          "",
    );
  }

  RxList<OfferListModel> offerList = <OfferListModel>[].obs;

  getAllOffer({required String bId}) async {
    try {
      final response = await ApiService.getApi(
        Apis.getOfferByBusinessId(bId: bId),
      );

      if (response != null) {
        if (response['offers'] is List && response['offers'].isNotEmpty) {
          offerList.clear();
          response['offers']
              .map((e) => offerList.add(OfferListModel.fromJson(e)))
              .toList();
          offerList.value = offerList.reversed.toList();
        }
      }
    } catch (error) {}
  }

  RxBool isError = false.obs;
  RxBool isLoaded = false.obs;

  RxList<BannerListModel> bannerList = <BannerListModel>[].obs;

  String getBannerTypeName({required String type}) {
    if (type == "1") {
      return "Upper slider banner";
    } else if (type == "2") {
      return "Middle slider banner";
    } else if (type == "3") {
      return "Lower slider banner";
    }
    return "";
  }

  List<String> typeList = [
    'Upper slider banner',
    'Middle slider banner',
    'Lower slider banner'
  ];

  Rxn<String?> selectedType = Rxn<String?>();

  String getBannerTypeString({required String type}) {
    if (type == "Upper slider banner") {
      return "1";
    } else if (type == "Middle slider banner") {
      return "2";
    } else if (type == "Lower slider banner") {
      return "3";
    }
    return "";
  }

  getAllBanner({required String bId}) async {
    try {
      final response = await ApiService.getApi(
        Apis.viewBanner(bId: bId),
      );

      if (response != null) {
        if (response['banners'] is List && response['banners'].isNotEmpty) {
          bannerList.clear();
          response['banners']
              .map((e) => bannerList.add(BannerListModel.fromJson(e)))
              .toList();
        }
      }

      isLoaded.value = true;
      getAllOffer(bId: bId);
    } catch (error) {
      isError.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  RxBool isProcess = false.obs;

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
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;

    selectedBanner.value = File(pickedImage.path);
  }

  Future<void> _pickImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage == null) return;
    selectedBanner.value = File(pickedImage.path);
  }

  requestBanner() async {
    isProcess.value = true;
    try {
      final response = await ApiService.multipartApi(
        Apis.requestBanner,
        'image',
        selectedBanner.value?.path ?? '',
        body: {
          'offerId': selectedOffer.value?.sId ?? '',
          'type': '${getBannerTypeString(type: selectedType.value ?? '')}',
        },
      );

      if (response != null) {
        ShowToast.toast(msg: response['message'] ?? '');
        getAllBanner(
          bId: UserDataStorageServices.readData(
                key: UserStorageDataKeys.businessId,
              ) ??
              "",
        );
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

  updateBanner({required int index}) async {
    bId.value = bannerList[index].sId ?? "";
    isProcess.value = true;
    String path = "";
    String param = "";
    if (selectedBanner.value != null) {
      param = 'image';
      path = selectedBanner.value?.path ?? '';
    }
    try {
      final response = await ApiService.multipartApi(
        Apis.updateBannerById(bId: bId.value),
        param,
        path,
        body: {
          'type': '${getBannerTypeString(type: selectedType.value ?? '')}',
        },
        method: 'PUT',
      );

      if (response != null) {
        ShowToast.toast(msg: response['message'] ?? '');
        getAllBanner(
          bId: UserDataStorageServices.readData(
                key: UserStorageDataKeys.businessId,
              ) ??
              "",
        );
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

  Rxn<File?> selectedBanner = Rxn<File?>();
  Rxn<OfferListModel?> selectedOffer = Rxn<OfferListModel?>();

  showAddUpdateBannerDialog({
    required BuildContext ctx,
    required String title,
    required double wid,
    int index = -1,
  }) {
    showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Obx(
                    () => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: selectedBanner.value != null
                          ? Image.file(
                              selectedBanner.value!,
                              width: wid,
                              height: wid * 0.35,
                              fit: BoxFit.cover,
                            )
                          : index == -1
                              ? Image.asset(
                                  'assets/images/default_image.png',
                                  width: wid,
                                  height: wid * 0.35,
                                  fit: BoxFit.cover,
                                )
                              : Image.memory(
                                  Uint8List.fromList(
                                    bannerList[index].image!.data!,
                                  ),
                                  width: wid,
                                  height: wid * 0.35,
                                  fit: BoxFit.cover,
                                ),
                    ),
                  ),
                  Positioned(
                    bottom: 3,
                    right: 3,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          imagePicker(context);
                        },
                        icon: Icon(
                          Icons.edit,
                          color: AppColor.white,
                          size: 20,
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColor.black300),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              index != -1 ? Gap(0) : Gap(10),
              index != -1
                  ? Gap(0)
                  : Obx(
                      () => DropdownButton<OfferListModel>(
                        value: selectedOffer.value,
                        hint: Text("Please select offer"),
                        items: offerList.map((OfferListModel value) {
                          return DropdownMenuItem<OfferListModel>(
                            value: value,
                            child: Text(
                              value.description ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        onChanged: (OfferListModel? newValue) {
                          if (newValue == null) return;
                          selectedOffer.value = newValue;
                        },
                        isExpanded: true,
                      ),
                    ),
              Gap(10),
              Obx(
                () => DropdownButton<String>(
                  value: selectedType.value,
                  hint: Text("Please select banner type"),
                  items: typeList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue == null) return;
                    selectedType.value = newValue;
                  },
                  isExpanded: true,
                ),
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () => Get.back(),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: AppColor.black,
                      ),
                    ),
                  ),
                ),
                Gap(10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () async {
                    if (index == -1) {
                      if (selectedOffer.value == null ||
                          selectedType.value == null ||
                          selectedBanner.value == null) {
                        if (selectedBanner.value == null) {
                          await ShowToast.toast(
                              msg: "Please select banner image.");
                        }
                        if (selectedType.value == null) {
                          await ShowToast.toast(
                              msg: "Please select banner type.");
                        }
                        if (selectedOffer.value == null) {
                          ShowToast.toast(msg: "Please select offer.");
                        }
                      } else {
                        Get.back();
                        requestBanner();
                      }
                    } else {
                      if (selectedType.value == null) {
                        ShowToast.toast(msg: "Please select banner type.");
                      } else if (selectedBanner.value == null &&
                          (bannerList[index].image?.data ?? []).isImage()) {
                        ShowToast.toast(msg: "Please select banner.");
                      } else {
                        Get.back();
                        updateBanner(index: index);
                      }
                    }
                  },
                  child: Text(
                    "Request now",
                    style: TextStyle(
                      color: AppColor.black,
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

  RxString bId = "".obs;

  deleteBanner({required int index}) async {
    bId.value = bannerList[index].sId ?? "";
    try {
      final response = await ApiService.deleteApi(
        Apis.deleteBannerById(bId: bId.value),
      );

      if (response != null) {
        ShowToast.toast(
          msg: response['message'] ?? "Banner deleted successfully.",
        );
        bannerList.removeAt(index);
      }
      isProcess.value = false;
      bId.value = "";
    } catch (error) {
      isProcess.value = false;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }
}

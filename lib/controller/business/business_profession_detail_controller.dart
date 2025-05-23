import 'package:pro_deals1/imports.dart';

class BusinessProfessionDetailController extends GetxController {
  final data = Get.arguments;
  final TextEditingController GSTController = TextEditingController();
  final TextEditingController panController = TextEditingController();

  RxBool isChecked = false.obs;
  RxBool isCategoryLoaded = false.obs;

  Rxn<String?> selectedValue = Rxn<String?>();
  RxList<String> categoryList = <String>[].obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategory();
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

    imageFile.value = File(pickedImage.path);
  }

  Future<void> _pickImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage == null) return;

    imageFile.value = File(pickedImage.path);
  }

  Rxn<File?> imageFile = Rxn<File?>();

  getCategory() async {
    try {
      final response = await ApiService.getApi(
        Apis.getAllCategory,
      );

      if (response != null) {
        final responseBody = response;
        categoryList.clear();
        responseBody
            .map(
              (e) => categoryList
                  .add(CategoryListModel.fromJson(e).category ?? ""),
            )
            .toList();
      }
      isCategoryLoaded.value = true;
    } catch (error) {
      isCategoryLoaded.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  void checkValidation() {
    var key = formKey.currentState;
    if (key!.validate()) {
      if (selectedValue.value == null) {
        ShowToast.toast(msg: "Please select business category");
      } else if (imageFile.value == null) {
        ShowToast.toast(msg: "Please select business proof");
      } else {
        Get.toNamed(
          '/Profession_Profile',
          arguments: {
            "businessName": data['businessName'],
            "contactNumber": data['contactNumber'],
            "address": data['address'],
            "state": data['state'],
            "city": data['city'],
            "landmark": data['landmark'],
            "pincode": data['pincode'],
            "mainImage": data['mainImage'],
            "category": selectedValue.value ?? "",
            "gstNumber": GSTController.text,
            "panNumber": panController.text,
            "proofImage": imageFile.value?.path ?? "",
          },
        );
      }
    }
  }
}

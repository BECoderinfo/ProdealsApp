import 'package:pro_deals1/imports.dart';

class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Rxn<XFile?> imageFile = Rxn<XFile?>();
  Rxn<String?> selectedValue = Rxn<String?>();
  final ImagePicker _picker = ImagePicker();
  RxBool isAddressFound = false.obs;
  RxBool isProcess = false.obs;
  final formKey = GlobalKey<FormState>();

  pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    imageFile.value = pickedFile;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController.text =
        UserDataStorageServices.readData(key: UserStorageDataKeys.name) ?? "";
    emailController.text =
        UserDataStorageServices.readData(key: UserStorageDataKeys.email) ?? "";
    phoneController.text =
        UserDataStorageServices.readData(key: UserStorageDataKeys.phone) ?? "";

    fetchAddress();
  }

  RxBool isAddressLoaded = false.obs;

  RxList<String> addressList = <String>[].obs;
  RxList<AddressModel> addressModelList = <AddressModel>[].obs;

  fetchAddress() {
    getAddress(UserDataStorageServices.readData(key: UserStorageDataKeys.uId) ??
            "")
        .then(
      (value) {
        if (value.first) {
          if ((value.last as List).isEmpty) {
            isAddressFound.value = false;
          } else {
            isAddressFound.value = true;
            value.last.map((e) {
              AddressModel a = AddressModel.fromJson(e);
              addressModelList.add(a);
              addressList.add(
                  "${a.address ?? ""}, ${a.city ?? ""}, ${a.state ?? ""}-${a.pincode ?? ""}");
              if ((UserDataStorageServices.readData(
                          key: UserStorageDataKeys.addressId) ??
                      "")
                  .isNotEmpty) {
                if ((a.sId ?? "") ==
                    UserDataStorageServices.readData(
                        key: UserStorageDataKeys.addressId)) {
                  selectedValue.value = addressList.last;
                }
              }
            }).toList();
          }
          isAddressLoaded.value = true;
        }
      },
    );
  }

  bool checkImageStatus() {
    if (imageFile.value == null) {
      return !UserDataStorageServices.checkIfExist(
          key: UserStorageDataKeys.imageData);
    }
    return false;
  }
}

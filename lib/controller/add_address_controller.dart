import 'package:pro_deals1/imports.dart';

class AddAddressController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();

  final formKey = GlobalKey<FormState>();
  RxBool isProcess = false.obs;

  final data = Get.arguments;

  String updateID = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if ((data is AddressModel)) {
      AddressModel a = data as AddressModel;
      name.text = a.userName ?? "";
      email.text = a.email ?? "";
      phone.text = a.phone ?? "";
      address.text = a.address ?? "";
      city.text = a.city ?? "";
      state.text = a.state ?? "";
      pincode.text = a.pincode ?? "";
      updateID = a.sId ?? "";
    }
  }
}

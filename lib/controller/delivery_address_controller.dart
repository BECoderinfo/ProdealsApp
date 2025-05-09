import 'package:pro_deals1/imports.dart';

class DeliveryAddressController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  RxBool isError = false.obs;
  RxBool isDataFetched = false.obs;

  RxList<AddressModel> myAddresses = <AddressModel>[].obs;

  fetchData() async {
    await getAddress(
            UserDataStorageServices.readData(key: UserStorageDataKeys.uId))
        .then(
      (value) {
        if (value.first ?? false) {
          myAddresses.clear();
          if ((value.last as List).isNotEmpty) {
            for (var e in value.last) {
              myAddresses.add(AddressModel.fromJson(e));
            }
          }
          isDataFetched.value = true;
        } else {
          isError.value = true;
        }
      },
    );
  }
}

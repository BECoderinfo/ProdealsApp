import 'dart:developer';
import 'package:pro_deals1/imports.dart';

class FavouriteController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllFavouriteBusiness();
  }

  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxList<FavouriteBusinessList> list = <FavouriteBusinessList>[].obs;

  void getAllFavouriteBusiness() {
    try {
      isError.value = false;
      isLoading.value = true;

      final list1 = UserDataStorageServices.readData(
        key: UserStorageDataKeys.favouriteBusiness,
      );

      list.clear();

      if (list1 != null) {
        list.addAll(
          List.from(list1).map((e) => FavouriteBusinessList.fromJson(e)),
        );
      }
    } catch (e, st) {
      log("Favourite load error: $e", stackTrace: st);
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  void removeFavourite({required int index}) {
    list.removeAt(index);

    if (list.isNotEmpty) {
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.favouriteBusiness,
        data: list.map((e) => e.toJson()).toList(),
      );
    } else {
      UserDataStorageServices.removeData(
        key: UserStorageDataKeys.favouriteBusiness,
      );
    }
  }
}

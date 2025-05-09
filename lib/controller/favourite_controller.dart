import 'dart:developer';

import 'package:pro_deals1/imports.dart';

class FavouriteController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllFavouriteBusiness();
  }

  getAllFavouriteBusiness() {
    final list1 = UserDataStorageServices.readData(
      key: UserStorageDataKeys.favouriteBusiness,
    );

    list.clear();
    if (list1 != null) {
      list.addAll(
        List.from(list1).map((e) => FavouriteBusinessList.fromJson(e)),
      );
    }
  }

  RxList<dynamic> list = <dynamic>[].obs;

  removeFavourite({
    required int index,
  }) {
    list.removeAt(index);
    if (list.isNotEmpty) {
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.favouriteBusiness,
        data: list,
      );
    } else {
      UserDataStorageServices.removeData(
        key: UserStorageDataKeys.favouriteBusiness,
      );
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:pro_deals1/imports.dart';

class HomePageController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCityAndFetchData();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxString cityName = "".obs;

  RxBool isCityNameFind = false.obs;
  RxBool isNavigation = false.obs;
  RxBool isBusinessLoaded = false.obs;
  RxBool isErrorInBusinessLoading = false.obs;
  RxBool isBannerLoaded = false.obs;
  RxBool isErrorInBannerLoading = false.obs;
  RxBool isCategoryLoaded = false.obs;
  RxBool isErrorInCategoryLoading = false.obs;
  RxBool isFoodTypeLoaded = false.obs;
  RxBool isErrorInFoodTypeLoading = false.obs;

  RxList<CityListModel> cityList = <CityListModel>[].obs;
  RxList<BusinessListModel> businessList = <BusinessListModel>[].obs;
  RxList<BannerListModel> slider1BannerList = <BannerListModel>[].obs;
  ValueNotifier<int> slider1Index = ValueNotifier(0);
  RxList<BannerListModel> slider2BannerList = <BannerListModel>[].obs;
  RxList<BannerListModel> slider3BannerList = <BannerListModel>[].obs;
  RxList<CategoryListModel> categoryList = <CategoryListModel>[].obs;
  RxList<FoodTypeListModel> foodTypeList = <FoodTypeListModel>[].obs;

  getCityAndFetchData() async {
    if (UserDataStorageServices.checkIfExist(
        key: UserStorageDataKeys.cityName)) {
      isCityNameFind.value = true;
    }
    await getCategoryData();
    await getFoodTypeData();
    await getSlider1Banner();
    if (cityList.isEmpty) {
      await getAllCity();
    }
    if (UserDataStorageServices.checkIfExist(
        key: UserStorageDataKeys.cityName)) {
      fetchDataByCity(
        city:
            UserDataStorageServices.readData(key: UserStorageDataKeys.cityName),
      );
    } else {
      if (Platform.isAndroid) {
        await LocationService().getCityName().then(
          (value) {
            fetchDataByCity(
              city: value.last,
            );
          },
        );
      } else {
        fetchDataByCity(
          city: "Surat",
        );
      }
    }
  }

  fetchDataByCity({required String city}) async {
    if (isNavigation.value) {
      return;
    }
    isCityNameFind.value = true;
    isBusinessLoaded.value = false;
    if (cityName.value.isEmpty) {
      cityName.value = city;
    }
    UserDataStorageServices.writeData(
      key: UserStorageDataKeys.cityName,
      data: cityName.value,
    );
    try {
      var response = await ApiService.getApi(
        Apis.getBusinessByCity(
            cityName: kDebugMode
                ? cityName.value.isEmpty
                    ? "Surat"
                    : cityName.value
                : city),
      );

      businessList.clear();
      if (response != null &&
          response['businesses'] is List &&
          response['businesses'].isNotEmpty) {
        response['businesses']
            .map(
              (e) => businessList.add(BusinessListModel.fromJson(e)),
            )
            .toList();
      }
      isBusinessLoaded.value = true;
    } catch (error) {
      isErrorInBusinessLoading.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  Future<void> getAllCity() async {
    if (isNavigation.value) {
      return;
    }
    try {
      var response = await ApiService.getApi(
        Apis.getAllCity,
      );

      if (response != null) {
        if (response['citys'] is List && response['citys'].isNotEmpty) {
          cityList.clear();
          response['citys']
              .map(
                (e) => cityList.add(CityListModel.fromJson(e)),
              )
              .toList();
        }
      }
    } catch (error) {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  Future<void> getSlider1Banner() async {
    if (isNavigation.value) {
      return;
    }
    try {
      var response = await ApiService.getApi(
        Apis.getAllBanner,
      );
      if (response != null) {
        final responseBody = response['bannersByType'];
        if (responseBody['1'] is List && responseBody['1'].isNotEmpty) {
          slider1BannerList.clear();
          responseBody['1']
              .map(
                (e) => slider1BannerList.add(BannerListModel.fromJson(e)),
              )
              .toList();
        }
        if (responseBody['2'] is List && responseBody['2'].isNotEmpty) {
          slider2BannerList.clear();
          responseBody['2']
              .map(
                (e) => slider2BannerList.add(BannerListModel.fromJson(e)),
              )
              .toList();
        }
        if (responseBody['3'] is List && responseBody['3'].isNotEmpty) {
          slider3BannerList.clear();
          responseBody['3']
              .map(
                (e) => slider3BannerList.add(BannerListModel.fromJson(e)),
              )
              .toList();
        }
      }
      isBannerLoaded.value = true;
    } catch (error) {
      isErrorInBannerLoading.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  Future<void> getCategoryData() async {
    if (isNavigation.value) {
      return;
    }
    try {
      var response = await ApiService.getApi(
        Apis.getAllCategory,
      );

      if (response != null) {
        if (response is List && response.isNotEmpty) {
          categoryList.clear();
          response
              .map(
                (e) => categoryList.add(CategoryListModel.fromJson(e)),
              )
              .toList();
        }
        isCategoryLoaded.value = true;
      } else {
        isErrorInCategoryLoading.value = true;
      }
    } catch (error) {
      isErrorInCategoryLoading.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  Future<void> getFoodTypeData() async {
    if (isNavigation.value) {
      return;
    }
    try {
      var response = await ApiService.getApi(
        Apis.getAllFoodType,
      );

      if (response != null) {
        if (response is List && response.isNotEmpty) {
          foodTypeList.clear();
          response
              .map(
                (e) => foodTypeList.add(FoodTypeListModel.fromJson(e)),
              )
              .toList();
        }
        isFoodTypeLoaded.value = true;
      } else {
        isErrorInFoodTypeLoading.value = true;
      }
    } catch (error) {
      isErrorInFoodTypeLoading.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  void openCityListSheet() {
    Get.bottomSheet(
      backgroundColor: AppColor.white,
      isDismissible: true,
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      Container(
        height: (cityList.length >= 1 && cityList.length <= 3)
            ? 250
            : (cityList.length >= 4 && cityList.length <= 6)
                ? 300
                : (cityList.length >= 7 && cityList.length <= 9)
                    ? 400
                    : null,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Please select city",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close_rounded),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < cityList.length; i++)
                      GestureDetector(
                        onTap: () {
                          if (cityList[i].cityname?.toLowerCase() ==
                              cityName.value.toLowerCase()) return;
                          cityName.value = cityList[i].cityname ?? "";
                          Get.back();
                          fetchDataByCity(city: cityName.value);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "${cityList[i].cityname}",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Gap(20),
                            Checkbox(
                              activeColor: AppColor.primary,
                              onChanged: (value) {
                                if (cityList[i].cityname?.toLowerCase() ==
                                    cityName.value.toLowerCase()) return;
                                cityName.value = cityList[i].cityname ?? "";
                                Get.back();
                                fetchDataByCity(city: cityName.value);
                              },
                              value: cityList[i].cityname?.toLowerCase() ==
                                  cityName.value.toLowerCase(),
                            )
                          ],
                        ),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    isNavigation.value = true;
  }
}

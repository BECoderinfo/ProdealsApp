import 'package:pro_deals1/imports.dart';
import 'package:pro_deals1/model_class/favourite_business.dart';

class AndroidBusinessDetailController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final data = Get.arguments;

  Widget buildInfoCard(
      double height, double width, IconData icon, String text) {
    return Container(
      height: height / 12,
      width: width / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: AppColor.primary),
          Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    color: AppColor.black300,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTabButton(double height, double width, String text, int index) {
    bool isActive = selectedIndex.value == index;
    return GestureDetector(
      onTap: () async {
        selectedIndex.value = index;
        if (!isOfferLoaded.value && selectedIndex.value == 1) {
          await getCart();
          await getOfferById(bId: data['rId']);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: height / 22,
        width: width / 4.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isActive ? AppColor.primary : AppColor.white,
          border: Border.all(color: AppColor.primary),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.openSans(
            fontSize: 14,
            color: isActive ? AppColor.white : AppColor.black,
          ),
        ),
      ),
    );
  }

  RxDouble ratting = (0.0).obs;

  getRatting({required String bId}) async {
    try {
      final response = await ApiService.getApi(
        Apis.businessRatting(bId: bId),
      );

      if (response != null) {
        ratting.value = double.parse("${response['averageRating'] ?? "0"}");
      }
    } catch (e) {}
  }

  getBusinessDetail({required String bId}) async {
    isLoaded.value = false;
    try {
      final response = await ApiService.getApi(
        Apis.businessDetail(bId: bId),
      );

      if (response != null) {
        details = BusinessDetailModel.fromJson(response);

        if (!(details?.business?.offDays == 'null' ||
            details?.business?.offDays == null)) {
          List<String> daysOfWeek = [
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday",
          ];

          for (String day in daysOfWeek) {
            if (day == details?.business?.offDays) {
              daysList.add(
                Text(
                  "$day - closed",
                  style: GoogleFonts.openSans(
                    color: AppColor.red,
                    fontSize: 15,
                  ),
                ),
              );
            } else {
              daysList.add(
                Text(
                  "$day ${details?.business?.openTime ?? ""} to ${details?.business?.closeTime ?? ""}",
                  style: GoogleFonts.openSans(
                    fontSize: 15,
                    color: AppColor.gray,
                  ),
                ),
              );
            }
          }
        }
        await getRatting(bId: bId);
        await getCart();
        Map<String, dynamic> d = data as Map<String, dynamic>;
        if (d.containsKey('page')) {
          selectedIndex.value = 1;
          await getOfferById(bId: data['rId']);
        }
        isLoaded.value = true;
      } else {
        isError.value = true;
      }
    } catch (error) {
      isError.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  BusinessDetailModel? details;
  RxList<OfferListModel> offerList = <OfferListModel>[].obs;
  RxList<CartListModel> cartList = <CartListModel>[].obs;

  List<Widget> daysList = [];

  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxBool isOfferLoaded = false.obs;
  RxBool isError1 = false.obs;
  RxBool isFavourite = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkFavourite();
    getBusinessDetail(bId: data['rId']);
  }

  checkFavourite() {
    dynamic list = UserDataStorageServices.readData(
        key: UserStorageDataKeys.favouriteBusiness);
    if (list != null) {
      try {
        int i = list.indexWhere(
          (element) => element.sId == data['rId'],
        );

        if (i != -1) {
          isFavourite.value = true;
        }
      } catch (e) {}
    }
  }

  favouriteManage() {
    dynamic list = UserDataStorageServices.readData(
            key: UserStorageDataKeys.favouriteBusiness) ??
        [];
    if (isFavourite.value) {
      list.removeWhere(
        (e) => e.sId == details?.business?.sId,
      );

      isFavourite.value = !isFavourite.value;

      if (list.isEmpty) {
        UserDataStorageServices.removeData(
          key: UserStorageDataKeys.favouriteBusiness,
        );
      } else {
        UserDataStorageServices.writeData(
          key: UserStorageDataKeys.favouriteBusiness,
          data: list.map((e) => e.toJson()).toList(),
        );
      }
    } else {
      FavouriteBusinessList f = FavouriteBusinessList(
        address:
            '${details?.business?.address ?? ""}\n${details?.business?.city ?? ""}, ${details?.business?.state ?? ""} ${details?.business?.pincode ?? ""}',
        name: details?.business?.businessName ?? "",
        sId: details?.business?.sId ?? "",
        image: details?.business?.mainImage?.data?.data ?? [],
        ratting: "${ratting.value}",
      );

      list.add(f);

      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.favouriteBusiness,
        data: list.map((e) => e.toJson()).toList(),
      );
      isFavourite.value = !isFavourite.value;
    }
  }

  bool getButtonName({required OfferListModel offerId}) {
    if (cartList.isEmpty) {
      return true;
    }

    for (var e in cartList) {
      if (offerId.sId == e.offer?.sId) {
        return false;
      }
    }
    return true;
  }

  getCart() async {
    try {
      final response = await ApiService.getApi(
        Apis.getCartByUserId(
            uId: UserDataStorageServices.readData(
                    key: UserStorageDataKeys.uId) ??
                ""),
      );

      if (response != null) {
        if (response['cart'][0]['items'] is List &&
            response['cart'][0]['items'].isNotEmpty) {
          cartList.clear();
          response['cart'][0]['items']
              .map(
                (e) => cartList.add(CartListModel.fromJson(e)),
              )
              .toList();
        }
      }
    } catch (e) {}
  }

  TimeOfDay parseTimeOfDay(String time) {
    try {
      final format = DateFormat('hh:mm a');
      DateTime dateTime =
          format.parse(time.replaceAll(RegExp(r'[^\x20-\x7E]'), '').trim());
      return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
    } catch (e) {
      return TimeOfDay(hour: 0, minute: 0);
    }
  }

  TimeOfDay subtractTimeOfDay(TimeOfDay time, int hours) {
    final dateTime = DateTime(0, 1, 1, time.hour, time.minute)
        .subtract(Duration(hours: hours));
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  String getStatus({
    required String openTimeStr,
    required String closeTimeStr,
  }) {
    TimeOfDay openTime = parseTimeOfDay(openTimeStr);
    TimeOfDay closeTime = parseTimeOfDay(closeTimeStr);
    TimeOfDay openSoonTime = subtractTimeOfDay(openTime, 2);
    TimeOfDay currentTime = TimeOfDay.now();

    DateTime toDateTime(TimeOfDay time) {
      final now = DateTime.now();
      return DateTime(now.year, now.month, now.day, time.hour, time.minute);
    }

    DateTime current = toDateTime(currentTime);
    DateTime open = toDateTime(openTime);
    DateTime close = toDateTime(closeTime);
    DateTime openSoon = toDateTime(openSoonTime);

    if (current.isAfter(openSoon) && current.isBefore(open)) {
      return "Open Soon";
    } else if (current.isAfter(open) && current.isBefore(close)) {
      return "Open Now";
    } else {
      return "Closed";
    }
  }

  String parseTime(String s) {
    try {
      s = s
          .trim()
          .replaceAll(RegExp(r'\s+'), ' ')
          .toUpperCase(); // Normalize and uppercase

      final parsed = DateFormat("h:mm a").parse(s);
      final formatted = DateFormat("h a").format(parsed); // Only hour and AM/PM
      return formatted;
    } catch (e) {
      return "";
    }
  }

  String calculateTimeDifference({required String createdDateStr}) {
    DateTime currentDate = DateTime.now();

    DateTime createdDate = DateTime.parse(createdDateStr);

    Duration difference = currentDate.difference(createdDate);
    int diffDays = difference.inDays;
    int diffMonths = (currentDate.year - createdDate.year) * 12 +
        (currentDate.month - createdDate.month);
    int diffYears = currentDate.year - createdDate.year;

    if (diffDays == 0) {
      return "Just arrived";
    } else if (diffDays < 30) {
      return "${diffDays} days ago";
    } else if (diffDays >= 30 && diffMonths < 12) {
      return "${diffMonths} months ago";
    } else if (diffYears >= 1) {
      return "${diffYears} years ago";
    } else {
      return "Unknown status";
    }
  }

  getOfferById({required String bId}) async {
    try {
      final response = await ApiService.getApi(
        Apis.getOfferByBusinessId(bId: bId),
      );

      if (response != null) {
        if (response['offers'] is List && response['offers'].isNotEmpty) {
          offerList.clear();
          response['offers']
              .map(
                (e) => offerList.add(OfferListModel.fromJson(e)),
              )
              .toList();
        }
      }
      isOfferLoaded.value = true;
    } catch (error) {
      isError1.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  RxString deleteCartId = "".obs;

  void addToCartItem({required String oId}) async {
    deleteCartId.value = oId;
    try {
      final response = await ApiService.postApi(
        Apis.addCart,
        body: {
          "user":
              UserDataStorageServices.readData(key: UserStorageDataKeys.uId) ??
                  "",
          "offerId": oId
        },
      );
      if (response != null) {
        await getCart();
        deleteCartId.value = "";
      } else {
        deleteCartId.value = "";
      }
    } catch (error) {
      deleteCartId.value = "";
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  void deleteItem({required String oId}) async {
    String cartId = "";
    print('oId :: ${oId}');
    for (var e in cartList) {
      if (e.offer?.sId == oId) {
        cartId = e.sId ?? "";
      }
    }
    deleteCartId.value = oId;
    try {
      final response = await ApiService.deleteApi(
        Apis.deleteCart(cartId: cartId),
      );

      if (response != null) {
        for (var e in cartList) {
          if (e.offer?.sId == oId) {
            cartList.remove(e);
            break;
          }
        }
        deleteCartId.value = "";
      } else {
        deleteCartId.value = "";
      }
    } catch (error) {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }
}

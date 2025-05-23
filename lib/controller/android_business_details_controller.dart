import 'package:pro_deals1/imports.dart';
import 'package:pro_deals1/model_class/favourite_business.dart';

class AndroidBusinessDetailController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final data = Get.arguments;

  RxDouble ratting = (0.0).obs;
  BusinessDetailModel? details;
  RxList<OfferListModel> offerList = <OfferListModel>[].obs;
  RxList<CartListModel> cartList = <CartListModel>[].obs;
  List<Widget> daysList = [];

  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxBool isOfferLoaded = false.obs;
  RxBool isError1 = false.obs;
  RxBool isFavourite = false.obs;

  RxString deleteCartId = "".obs;

  @override
  void onInit() {
    super.onInit();
    checkFavourite();
    getBusinessDetail(bId: data['rId']);
  }

  Widget buildInfoCard(
      double height, double width, IconData icon, String text) {
    return Container(
      height: height / 12,
      width: width / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        if (!isOfferLoaded.value && index == 1) {
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

  Future<void> getRatting({required String bId}) async {
    try {
      final response = await ApiService.getApi(Apis.businessRatting(bId: bId));
      if (response != null) {
        ratting.value =
            double.tryParse("${response['averageRating'] ?? "0"}") ?? 0.0;
      }
    } catch (_) {}
  }

  Future<void> getBusinessDetail({required String bId}) async {
    isLoaded.value = false;
    try {
      final response = await ApiService.getApi(Apis.businessDetail(bId: bId));
      if (response != null) {
        details = BusinessDetailModel.fromJson(response);
        daysList.clear();
        List<String> daysOfWeek = [
          "Sunday",
          "Monday",
          "Tuesday",
          "Wednesday",
          "Thursday",
          "Friday",
          "Saturday"
        ];
        for (String day in daysOfWeek) {
          bool isClosed = day == details?.business?.offDays;
          daysList.add(
            Text(
              isClosed
                  ? "$day - closed"
                  : "$day ${details?.business?.openTime ?? ""} to ${details?.business?.closeTime ?? ""}",
              style: GoogleFonts.openSans(
                fontSize: 15,
                color: isClosed ? AppColor.red : AppColor.gray,
              ),
            ),
          );
        }
        await getRatting(bId: bId);
        await getCart();
        if ((data as Map<String, dynamic>).containsKey('page')) {
          selectedIndex.value = 1;
          await getOfferById(bId: data['rId']);
        }
        isLoaded.value = true;
      } else {
        isError.value = true;
      }
    } catch (e) {
      isError.value = true;
      ShowToast.errorSnackbar(title: "Error", msg: "$e");
    }
  }

  Future<void> checkFavourite() async {
    final storedList = UserDataStorageServices.readData(
        key: UserStorageDataKeys.favouriteBusiness);
    if (storedList != null && storedList is List) {
      try {
        final List<FavouriteBusinessList> favList =
            storedList.map((e) => FavouriteBusinessList.fromJson(e)).toList();
        isFavourite.value =
            favList.any((element) => element.sId == data['rId']);
      } catch (_) {}
    }
  }

  void favouriteManage() {
    final storedList = UserDataStorageServices.readData(
        key: UserStorageDataKeys.favouriteBusiness);
    List<FavouriteBusinessList> favList =
        storedList != null && storedList is List
            ? storedList.map((e) => FavouriteBusinessList.fromJson(e)).toList()
            : [];

    if (isFavourite.value) {
      favList.removeWhere((e) => e.sId == details?.business?.sId);
    } else {
      favList.add(FavouriteBusinessList(
        address:
            '${details?.business?.address ?? ""}\n${details?.business?.city ?? ""}, ${details?.business?.state ?? ""} ${details?.business?.pincode ?? ""}',
        name: details?.business?.businessName ?? "",
        sId: details?.business?.sId ?? "",
        image: details?.business?.mainImage?.data?.data ?? [],
        ratting: "${ratting.value}",
        category: details?.business?.category ?? "",
      ));
    }

    if (favList.isEmpty) {
      UserDataStorageServices.removeData(
          key: UserStorageDataKeys.favouriteBusiness);
    } else {
      UserDataStorageServices.writeData(
        key: UserStorageDataKeys.favouriteBusiness,
        data: favList.map((e) => e.toJson()).toList(),
      );
    }
    isFavourite.toggle();
  }

  bool getButtonName({required OfferListModel offerId}) {
    return !cartList.any((e) => offerId.sId == e.offer?.sId);
  }

  Future<void> getCart() async {
    try {
      final uId =
          UserDataStorageServices.readData(key: UserStorageDataKeys.uId) ?? "";
      final response = await ApiService.getApi(Apis.getCartByUserId(uId: uId));
      if (response != null &&
          response['cart'] != null &&
          response['cart'][0]['items'] is List) {
        cartList.value = (response['cart'][0]['items'] as List)
            .map((e) => CartListModel.fromJson(e))
            .toList();
      }
    } catch (_) {}
  }

  Future<void> getOfferById({required String bId}) async {
    try {
      final response =
          await ApiService.getApi(Apis.getOfferByBusinessId(bId: bId));
      if (response != null && response['offers'] is List) {
        offerList.value = response['offers']
            .map<OfferListModel>((e) => OfferListModel.fromJson(e))
            .toList();
      }
      isOfferLoaded.value = true;
    } catch (e) {
      isError1.value = true;
      ShowToast.errorSnackbar(title: "Error", msg: "$e");
    }
  }

  void addToCartItem({required String oId}) async {
    deleteCartId.value = oId;
    try {
      final response = await ApiService.postApi(
        Apis.addCart,
        body: {
          "user":
              UserDataStorageServices.readData(key: UserStorageDataKeys.uId) ??
                  "",
          "offerId": oId,
        },
      );
      if (response != null) await getCart();
    } catch (error) {
      ShowToast.errorSnackbar(title: "Error", msg: "$error");
    } finally {
      deleteCartId.value = "";
    }
  }

  void deleteItem({required String oId}) async {
    final cartItem = cartList.firstWhereOrNull((e) => e.offer?.sId == oId);
    if (cartItem == null) return;
    deleteCartId.value = oId;
    try {
      final response = await ApiService.deleteApi(
          Apis.deleteCart(cartId: cartItem.sId ?? ""));
      if (response != null) {
        cartList.remove(cartItem);
      }
    } catch (error) {
      ShowToast.errorSnackbar(title: "Error", msg: "$error");
    } finally {
      deleteCartId.value = "";
    }
  }

  // Time Parsing / Formatting Utilities
  TimeOfDay parseTimeOfDay(String time) {
    try {
      final format = DateFormat('hh:mm a');
      final cleaned = time.replaceAll(RegExp(r'[^\x20-\x7E]'), '').trim();
      DateTime dt = format.parse(cleaned);
      return TimeOfDay(hour: dt.hour, minute: dt.minute);
    } catch (_) {
      return TimeOfDay(hour: 0, minute: 0);
    }
  }

  TimeOfDay subtractTimeOfDay(TimeOfDay time, int hours) {
    final dt = DateTime(0, 1, 1, time.hour, time.minute)
        .subtract(Duration(hours: hours));
    return TimeOfDay(hour: dt.hour, minute: dt.minute);
  }

  String getStatus(
      {required String openTimeStr, required String closeTimeStr}) {
    TimeOfDay now = TimeOfDay.now();
    TimeOfDay open = parseTimeOfDay(openTimeStr);
    TimeOfDay close = parseTimeOfDay(closeTimeStr);
    TimeOfDay soon = subtractTimeOfDay(open, 2);

    DateTime toDT(TimeOfDay t) => DateTime(0, 0, 0, t.hour, t.minute);
    final current = toDT(now),
        openDT = toDT(open),
        closeDT = toDT(close),
        soonDT = toDT(soon);

    if (current.isAfter(soonDT) && current.isBefore(openDT)) return "Open Soon";
    if (current.isAfter(openDT) && current.isBefore(closeDT)) return "Open Now";
    return "Closed";
  }

  String parseTime(String s) {
    try {
      final parsed = DateFormat("h:mm a").parse(s.trim().toUpperCase());
      return DateFormat("h a").format(parsed);
    } catch (_) {
      return "";
    }
  }

  String calculateTimeDifference({required String createdDateStr}) {
    DateTime current = DateTime.now();
    DateTime created = DateTime.parse(createdDateStr);
    Duration diff = current.difference(created);

    if (diff.inDays == 0) return "Just arrived";
    if (diff.inDays < 30) return "${diff.inDays} days ago";
    int months =
        (current.year - created.year) * 12 + (current.month - created.month);
    if (months < 12) return "$months months ago";
    return "${current.year - created.year} years ago";
  }
}

import 'package:pro_deals1/imports.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCartItem(
      uId: UserDataStorageServices.readData(
            key: UserStorageDataKeys.uId,
          ) ??
          "",
    );
  }

  void clearCartData() {
    qtyList.clear();
  }

  RxList<int> qtyList = <int>[].obs;

  getCartItem({required String uId}) async {
    isLoaded.value = false;
    try {
      var response = await ApiService.getApi(
        Apis.getCartByUserId(uId: uId),
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
          qtyList.value = List.generate(
            cartList.length,
            (index) => 1,
          );
        }
      }
      isLoaded.value = true;
    } catch (error) {
      isError.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;

  RxBool isProcess = false.obs;

  RxList<CartListModel> cartList = <CartListModel>[].obs;

  void confirmDelete({required VoidCallback onDeleteTap}) {
    Get.dialog(AlertDialog(
      title: Text('Confirm Deletion'),
      content: Text('Are you sure you want to delete this item?'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
          ),
          onPressed: onDeleteTap,
          child: Text(
            'Delete',
            style: TextStyle(
              color: AppColor.black,
            ),
          ),
        )
      ],
    ));
  }

  void deleteItem({
    required int index,
  }) async {
    try {
      var response = await ApiService.deleteApi(
        Apis.deleteCart(cartId: cartList[index].sId ?? ""),
      );

      if (response != null) {
        cartList.removeAt(index);
        qtyList.removeAt(index);
      }
    } catch (error) {
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  RxString pCodeData = "".obs;
  RxString pCodeValue = "".obs;
  Rxn<PromocodeListModel?> pCode = Rxn<PromocodeListModel?>();

  void showBottomSheet(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        width: width,
        decoration: const BoxDecoration(color: Color(0xFFF9F9F9)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text('Promocode', style: TextStyle(fontSize: 18)),
                Spacer(),
                InkWell(
                  onTap: () {
                    Get.toNamed(
                      "/Coupons",
                      arguments: getTotal(),
                    )?.then(
                      (value) {
                        if (value != null) {
                          pCode.value = value['promoCode'];

                          pCodeData.value =
                              "(${pCode.value?.promocode ?? ""} - ${pCode.value?.discount ?? 0}${pCode.value?.discountType == "Amount" ? '₹' : '%'})";
                          pCodeValue.value =
                              "${pCode.value?.discount ?? 0}${pCode.value?.discountType == "Amount" ? '₹' : '%'}";
                        }
                      },
                    );
                  },
                  child: Text("Your Coupons",
                      style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
            const Gap(10),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Card(
            //         margin: EdgeInsets.zero,
            //         child: Padding(
            //           padding: const EdgeInsets.only(left: 14),
            //           child: TextField(
            //             decoration: InputDecoration(
            //               border: InputBorder.none,
            //               hintText: 'Enter promocode',
            //               fillColor: AppColor.white,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     const Gap(10),
            //     ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: AppColor.primary,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(6),
            //         ),
            //       ),
            //       onPressed: () {
            //         // Handle apply action
            //       },
            //       child: Text('Apply', style: TextStyle(color: AppColor.white)),
            //     ),
            //   ],
            // ),
            // const Gap(20),
            _buildSummaryRow('Sub Total', '₹ ${getTotal().toStringAsFixed(0)}'),
            Obx(
              () => pCodeData.value.isEmpty
                  ? Gap(0)
                  : _buildSummaryRow(
                      'Promo discount${pCodeData.value}',
                      '- ₹ ${getCouponDiscount().toString().split(".").first}',
                      color: Colors.green,
                    ),
            ),
            Obx(
              () => pCodeData.value.isEmpty ? Gap(0) : const Gap(20),
            ),
            Obx(
              () => pCodeData.value.isEmpty
                  ? _buildSummaryRow(
                      'Total',
                      '₹ ${calculateTotal().toString().split(".").first}',
                      isBold: true,
                    )
                  : _buildSummaryRow(
                      'Total',
                      '₹ ${calculateTotal().toString().split(".").first}',
                      isBold: true,
                    ),
            ),
            const Gap(20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(width, 50),
              ),
              onPressed: () {
                callCheckoutApi();
              },
              child: Text(
                'Checkout',
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value,
      {Color color = Colors.black, bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.openSans(
            fontSize: 16,
            color: color,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  double getTotal() {
    double d = 0;

    for (int i = 0; i < cartList.length; i++) {
      d += double.parse(cartList[i].offer?.paymentAmount ?? "0") * qtyList[i];
    }

    return d;
  }

  String getCouponDiscount() {
    double d = getTotal();
    String d1 = "0";
    if (pCodeValue.value.contains("₹")) {
      String value = pCodeValue.value.split("₹").first;
      d1 = "${(int.tryParse(value) ?? double.parse(value).toStringAsFixed(0))}";
    } else {
      String value = pCodeValue.value.split("%").first;
      d1 = "${((d * (int.tryParse(value) ?? double.parse(value))) / 100)}";
    }

    return d1;
  }

  String calculateTotal() {
    double d = getTotal();
    String d1 = "0";
    if (pCodeValue.value.isEmpty) {
      d1 = '$d';
    } else {
      if (pCodeValue.value.contains("₹")) {
        String value = pCodeValue.value.split("₹").first;
        d1 = "${d - (int.tryParse(value) ?? double.parse(value))}";
      } else {
        String value = pCodeValue.value.split("%").first;
        d1 =
            "${d - ((d * (int.tryParse(value) ?? double.parse(value))) / 100)}";
      }
    }

    return d1;
  }

  Widget buildQuantityButton(IconData icon, {Color color = Colors.black}) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Icon(icon, color: color),
    );
  }

  callCheckoutApi() async {
    isProcess.value = true;
    try {
      var response = await ApiService.postApi(
        Apis.createOrder,
        body: {
          "userId":
              UserDataStorageServices.readData(key: UserStorageDataKeys.uId) ??
                  "",
          "businessId": cartList.first.offer?.businessId,
          "promocode":
              pCodeData.value.isEmpty ? '' : pCodeData.value.split(" - ").first,
          "quantity": qtyList,
          "offerId": cartList
              .map(
                (element) => element.offer?.sId ?? "",
              )
              .toList(),
        },
      );

      if (response != null) {
        if (response is String) {
          ShowToast.toast(
            msg: response,
          );
          if (response == "Invalid or inactive promocode") {
            pCodeData.value = "";
            pCodeValue.value = "";
            pCode.value = null;
          }
        } else {
          Get.back();
          ShowToast.toast(
            msg: response['message'] ?? "",
          );
          currentPageIndex.value = 3;
          pageController.jumpToPage(
            3,
          );
          Get.toNamed('/and_user_order_history');
        }
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
}

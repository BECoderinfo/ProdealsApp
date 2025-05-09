import 'package:pro_deals1/imports.dart';

class Cart extends GetView<CartController> {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (cartController) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Cart'),
            centerTitle: true,
            backgroundColor: AppColor.primary,
          ),
          body: Obx(
            () => cartController.isError.value
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off_rounded,
                        size: 80,
                      ),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Gap(25),
                          Expanded(
                            child: Text(
                              "Something went wrong please try again.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Gap(25),
                        ],
                      ),
                    ],
                  )
                : !cartController.isLoaded.value
                    ? CustomCircularIndicator(color: AppColor.primary)
                    : cartController.cartList.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Your cart is empty",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.all(16),
                            child: ListView.builder(
                              itemCount: cartController.cartList.length,
                              itemBuilder: (context, index) {
                                final data = cartController.cartList[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Slidable(
                                    key: ValueKey('order$index'),
                                    endActionPane: ActionPane(
                                      motion: const DrawerMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (_) => cartController
                                              .deleteItem(index: index),
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'Delete',
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      color: AppColor.white,
                                      child: Obx(
                                        () => ListTile(
                                          title: Text(
                                              data.offer?.description ?? ""),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${(cartController.qtyList[index])} x ₹ ${data.offer?.paymentAmount ?? 0}'),
                                              const Gap(4),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: AppColor.gray
                                                          .withOpacity(0.1),
                                                    ),
                                                    alignment: Alignment.center,
                                                    padding:
                                                        const EdgeInsets.all(6),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            if (cartController
                                                                        .qtyList[
                                                                    index] >
                                                                1) {
                                                              cartController
                                                                      .qtyList[
                                                                  index]--;
                                                            }
                                                            if (controller
                                                                .pCodeData
                                                                .value
                                                                .isNotEmpty) {
                                                              if (controller
                                                                      .getTotal() <
                                                                  (int.tryParse(cartController
                                                                              .pCode
                                                                              .value
                                                                              ?.neededAmount ??
                                                                          '0') ??
                                                                      double.parse(cartController
                                                                              .pCode
                                                                              .value
                                                                              ?.neededAmount ??
                                                                          "0"))) {
                                                                cartController
                                                                    .pCodeData
                                                                    .value = "";
                                                                cartController
                                                                    .pCodeValue
                                                                    .value = "";
                                                              }
                                                            }
                                                          },
                                                          child: cartController
                                                              .buildQuantityButton(
                                                            Icons.remove,
                                                          ),
                                                        ),
                                                        const Gap(10),
                                                        Text(
                                                            '${(cartController.qtyList[index])}'),
                                                        const Gap(10),
                                                        GestureDetector(
                                                          onTap: () {
                                                            cartController
                                                                    .qtyList[
                                                                index]++;
                                                            if (controller.pCode
                                                                        .value !=
                                                                    null &&
                                                                controller
                                                                    .pCodeData
                                                                    .value
                                                                    .isEmpty) {
                                                              if (controller
                                                                      .getTotal() >
                                                                  (int.tryParse(cartController
                                                                              .pCode
                                                                              .value
                                                                              ?.neededAmount ??
                                                                          '0') ??
                                                                      double.parse(cartController
                                                                              .pCode
                                                                              .value
                                                                              ?.neededAmount ??
                                                                          "0"))) {
                                                                cartController
                                                                        .pCodeData
                                                                        .value =
                                                                    "(${cartController.pCode.value?.promocode ?? ""} - ${cartController.pCode.value?.discount ?? 0}${cartController.pCode.value?.discountType == "Amount" ? '₹' : '%'})";
                                                                cartController
                                                                        .pCodeValue
                                                                        .value =
                                                                    "${cartController.pCode.value?.discount ?? 0}${cartController.pCode.value?.discountType == "Amount" ? '₹' : '%'}";
                                                              }
                                                            }
                                                          },
                                                          child: cartController
                                                              .buildQuantityButton(
                                                                  Icons.add,
                                                                  color: AppColor
                                                                      .primary),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          trailing: Text(
                                            '₹ ${(int.tryParse(data.offer?.paymentAmount ?? "0") ?? double.parse(data.offer?.paymentAmount ?? "0")) * (cartController.qtyList[index])}',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
          ),
          floatingActionButton: Obx(
            () => controller.cartList.isEmpty
                ? Gap(0)
                : FloatingActionButton(
                    onPressed: () => cartController.showBottomSheet(context),
                    child: Icon(Icons.book, color: AppColor.primary),
                    backgroundColor: AppColor.white,
                  ),
          ),
        );
      },
    );
  }
}

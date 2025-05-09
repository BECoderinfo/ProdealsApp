import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class ios_cart extends GetView<CartController> {
  const ios_cart({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (cartController) {
          return CupertinoPageScaffold(
            backgroundColor: const Color(0xfff9f9f9),
            child: Container(
              height: hit,
              width: wid,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Gap(40),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                blurRadius: 2,
                                spreadRadius: 0,
                                color: AppColor.gray,
                              ),
                            ],
                          ),
                          child: Icon(
                            CupertinoIcons.arrow_left,
                            size: 16,
                            color: AppColor.black300,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'My Cart',
                          style: TextStyle(
                            color: AppColor.black300,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(
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
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
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
                                ? Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 200,
                                          width: wid,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/empty-cart.png'),
                                            ),
                                          ),
                                        ),
                                        const Gap(20),
                                        Text(
                                          'Your Cart is Empty',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.black300,
                                          ),
                                        ),
                                        const Gap(20),
                                        Text(
                                          'Good Food is Always Cooking.!\nGo ahead, Order some Yummy items the Menu Food ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColor.gray,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const Gap(20),
                                        Container(
                                          height: 50,
                                          width: wid / 1.6,
                                          decoration: BoxDecoration(
                                            color: AppColor.primary,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Back to Shopping',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Expanded(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: hit,
                                            width: wid,
                                            padding: const EdgeInsets.all(10),
                                            child: ListView.builder(
                                              itemCount: cartController
                                                  .cartList.length,
                                              itemBuilder: (context, index) {
                                                final data = cartController
                                                    .cartList[index];
                                                return Slidable(
                                                  key: ValueKey('order$index'),
                                                  endActionPane: ActionPane(
                                                    motion:
                                                        const DrawerMotion(),
                                                    children: [
                                                      SlidableAction(
                                                        onPressed: (context) =>
                                                            cartController
                                                                .confirmDelete(
                                                                    onDeleteTap:
                                                                        () {
                                                          Get.back();
                                                          cartController
                                                              .deleteItem(
                                                                  index: index);
                                                        }),
                                                        backgroundColor:
                                                            Colors.red,
                                                        foregroundColor:
                                                            Colors.white,
                                                        icon: Icons.delete,
                                                        label: 'Delete',
                                                      ),
                                                    ],
                                                  ),
                                                  child: Card(
                                                    color: AppColor.white,
                                                    child: Obx(
                                                      () => ListTile(
                                                        title: Text(data.offer
                                                                ?.description ??
                                                            ""),
                                                        subtitle: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                '${(cartController.qtyList[index])} x ₹ ${data.offer?.paymentAmount ?? 0}'),
                                                            const Gap(4),
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  height: 40,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: AppColor
                                                                        .gray
                                                                        .withOpacity(
                                                                            0.1),
                                                                  ),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          6),
                                                                  child: Row(
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          cartController
                                                                              .qtyList[index]--;
                                                                          if (controller
                                                                              .pCodeData
                                                                              .value
                                                                              .isNotEmpty) {
                                                                            if (controller.getTotal() <
                                                                                (int.tryParse(cartController.pCode.value?.neededAmount ?? '0') ?? double.parse(cartController.pCode.value?.neededAmount ?? "0"))) {
                                                                              cartController.pCodeData.value = "";
                                                                              cartController.pCodeValue.value = "";
                                                                            }
                                                                          }
                                                                        },
                                                                        child: cartController
                                                                            .buildQuantityButton(
                                                                          Icons
                                                                              .remove,
                                                                        ),
                                                                      ),
                                                                      const Gap(
                                                                          10),
                                                                      Text(
                                                                          '${(cartController.qtyList[index])}'),
                                                                      const Gap(
                                                                          10),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          cartController
                                                                              .qtyList[index]++;
                                                                          if (controller.pCode.value != null &&
                                                                              controller.pCodeData.value.isEmpty) {
                                                                            if (controller.getTotal() >
                                                                                (int.tryParse(cartController.pCode.value?.neededAmount ?? '0') ?? double.parse(cartController.pCode.value?.neededAmount ?? "0"))) {
                                                                              cartController.pCodeData.value = "(${cartController.pCode.value?.promocode ?? ""} - ${cartController.pCode.value?.discount ?? 0}${cartController.pCode.value?.discountType == "Amount" ? '₹' : '%'})";
                                                                              cartController.pCodeValue.value = "${cartController.pCode.value?.discount ?? 0}${cartController.pCode.value?.discountType == "Amount" ? '₹' : '%'}";
                                                                            }
                                                                          }
                                                                        },
                                                                        child: cartController.buildQuantityButton(
                                                                            Icons
                                                                                .add,
                                                                            color:
                                                                                AppColor.primary),
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
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            FloatingActionButton(
                                              onPressed: () => cartController
                                                  .showBottomSheet(context),
                                              child: Icon(Icons.book,
                                                  color: AppColor.primary),
                                              backgroundColor: AppColor.white,
                                            ),
                                            Gap(10),
                                          ],
                                        ),
                                        Gap(10),
                                      ],
                                    ),
                                  ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

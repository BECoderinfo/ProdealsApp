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
                              "Something went wrong, please try again.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
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
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 200,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/cart_images.png"),
                                    ),
                                  ),
                                ),
                                Gap(10),
                                Text(
                                  "Your cart is empty",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Gap(10),
                                Text(
                                  "Add items to your cart to get started",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
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
                                      // Prevents automatic closing when an action is taken
                                      children: [
                                        SlidableAction(
                                          onPressed: (_) => cartController
                                              .deleteItem(index: index),
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'Delete',
                                          autoClose: false,
                                          spacing: 10,
                                          // Adjust the space between actions (optional)
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 16),
                                          // Adjust padding to prevent oversize
                                          flex: 1,
                                          // Ensures the action button takes up the full available width of the pane
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
                                                '${(cartController.qtyList[index])} x ₹ ${data.offer?.paymentAmount ?? 0}',
                                              ),
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
                                                          },
                                                          child: cartController
                                                              .buildQuantityButton(
                                                                  Icons.remove),
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
                                                          },
                                                          child: cartController
                                                              .buildQuantityButton(
                                                            Icons.add,
                                                            color: AppColor
                                                                .primary,
                                                          ),
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

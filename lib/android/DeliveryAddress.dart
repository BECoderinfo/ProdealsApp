import 'package:flutter/cupertino.dart';

import '../imports.dart';

class DeliveryAddress extends GetView<DeliveryAddressController> {
  const DeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final DeliveryAddressController dAddressController =
        Get.put(DeliveryAddressController());
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Address'),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() => dAddressController.isError.value
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off_rounded,
                    size: 80,
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "Something went wrong please try again.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : dAddressController.isDataFetched.value
                ? dAddressController.myAddresses.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Addresses not found.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) => Gap(16),
                        itemBuilder: (context, index) {
                          return Container(
                            width: wid,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: AppColor.primary,
                                        ),
                                        const Gap(10),
                                        Text(
                                            '${dAddressController.myAddresses[index].userName ?? ""}'),
                                      ],
                                    ),
                                    PopupMenuButton<String>(
                                      onSelected: (String value) async {
                                        if (value == '2') {
                                          await deleteAddress(dAddressController
                                                  .myAddresses[index].sId ??
                                              "");
                                          dAddressController.fetchData();
                                        } else if (value == '1') {
                                          await Get.toNamed(
                                            '/AddAddress',
                                            arguments: dAddressController
                                                .myAddresses[index],
                                          )?.then(
                                            (value) {
                                              if (value ?? false) {
                                                dAddressController.fetchData();
                                              }
                                            },
                                          );
                                        }
                                      },
                                      offset: Offset(10, 40),
                                      itemBuilder: (BuildContext context) {
                                        return <PopupMenuEntry<String>>[
                                          PopupMenuItem<String>(
                                            value: '1',
                                            child: Text('Update'),
                                          ),
                                          PopupMenuItem<String>(
                                            value: '2',
                                            child: Text('Delete'),
                                          ),
                                        ];
                                      },
                                      icon: Icon(
                                        Icons.keyboard_control,
                                        color: AppColor.gray,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.add_call,
                                      color: AppColor.primary,
                                    ),
                                    const Gap(10),
                                    Text(
                                        '${dAddressController.myAddresses[index].phone ?? ""}')
                                  ],
                                ),
                                const Gap(10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: AppColor.primary,
                                    ),
                                    const Gap(10),
                                    Text(
                                        '${dAddressController.myAddresses[index].email ?? ""}')
                                  ],
                                ),
                                const Gap(10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColor.primary,
                                    ),
                                    const Gap(10),
                                    Expanded(
                                      child: Text(
                                          '${dAddressController.myAddresses[index].address ?? ""}, ${dAddressController.myAddresses[index].city ?? ""}, ${dAddressController.myAddresses[index].state ?? ""}-${dAddressController.myAddresses[index].pincode ?? ""}'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: dAddressController.myAddresses.length,
                      )
                : CustomCircularIndicator(
                    color: AppColor.primary,
                  )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.toNamed('/AddAddress')?.then(
            (value) {
              if (value ?? false) {
                dAddressController.fetchData();
              }
            },
          );
        },
        child: const Icon(CupertinoIcons.add),
        backgroundColor: AppColor.primary,
      ),
    );
  }
}

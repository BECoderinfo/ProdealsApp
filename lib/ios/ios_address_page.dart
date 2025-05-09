import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class ios_Address extends GetView<DeliveryAddressController> {
  const ios_Address({super.key});

  @override
  Widget build(BuildContext context) {
    final DeliveryAddressController dAddressController =
        Get.put(DeliveryAddressController());
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff9f9f9),
      child: Container(
        height: hit,
        width: wid,
        padding: EdgeInsets.all(16),
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
                    'Address',
                    style: TextStyle(
                      color: AppColor.black300,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(10),
            Expanded(
              flex: 1,
              child: Obx(
                () => dAddressController.isError.value
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
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
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
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : ListView.separated(
                                separatorBuilder: (context, index) => Gap(10),
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: wid,
                                    decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            CupertinoIcons
                                                                .person_alt,
                                                            color:
                                                                AppColor.orange,
                                                            size: 20,
                                                          ),
                                                          const Gap(10),
                                                          Text(
                                                            '${dAddressController.myAddresses[index].userName ?? ""}',
                                                            style: GoogleFonts
                                                                .openSans(
                                                              color: AppColor
                                                                  .black300,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Gap(10),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.call,
                                                            color:
                                                                AppColor.orange,
                                                            size: 20,
                                                          ),
                                                          const Gap(10),
                                                          Text(
                                                            '${dAddressController.myAddresses[index].phone ?? ""}',
                                                            style: GoogleFonts
                                                                .openSans(
                                                              color: AppColor
                                                                  .black300,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Gap(10),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.mail,
                                                            color:
                                                                AppColor.orange,
                                                            size: 20,
                                                          ),
                                                          const Gap(10),
                                                          Text(
                                                            '${dAddressController.myAddresses[index].email ?? ""}',
                                                            style: GoogleFonts
                                                                .openSans(
                                                              color: AppColor
                                                                  .black300,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Gap(10),
                                                      Material(
                                                        child: PopupMenuButton<
                                                            String>(
                                                          onSelected: (String
                                                              value) async {
                                                            if (value == '2') {
                                                              await deleteAddress(
                                                                  dAddressController
                                                                          .myAddresses[
                                                                              index]
                                                                          .sId ??
                                                                      "");
                                                              dAddressController
                                                                  .fetchData();
                                                            } else if (value ==
                                                                '1') {
                                                              await Get.toNamed(
                                                                '/ios_add_address',
                                                                arguments:
                                                                    dAddressController
                                                                            .myAddresses[
                                                                        index],
                                                              )?.then(
                                                                (value) {
                                                                  if (value ??
                                                                      false) {
                                                                    dAddressController
                                                                        .fetchData();
                                                                  }
                                                                },
                                                              );
                                                            }
                                                          },
                                                          offset:
                                                              Offset(10, 40),
                                                          itemBuilder:
                                                              (BuildContext
                                                                  context) {
                                                            return <PopupMenuEntry<
                                                                String>>[
                                                              PopupMenuItem<
                                                                  String>(
                                                                value: '1',
                                                                child: Text(
                                                                    'Update'),
                                                              ),
                                                              PopupMenuItem<
                                                                  String>(
                                                                value: '2',
                                                                child: Text(
                                                                    'Delete'),
                                                              ),
                                                            ];
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .more_vert_rounded,
                                                            color:
                                                                AppColor.gray,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Gap(10),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    CupertinoIcons
                                                        .location_solid,
                                                    color: AppColor.orange,
                                                    size: 20,
                                                  ),
                                                  const Gap(10),
                                                  Text(
                                                    '${dAddressController.myAddresses[index].address ?? ""}',
                                                    style: GoogleFonts.openSans(
                                                      color: AppColor.black300,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                itemCount:
                                    dAddressController.myAddresses.length,
                              )
                        : CustomCircularIndicator(
                            color: AppColor.primary,
                          ),
              ),
            ),
            const Gap(30),
            GestureDetector(
              onTap: () async {
                await Get.toNamed('/ios_add_address')?.then(
                  (value) {
                    if (value ?? false) {
                      dAddressController.fetchData();
                    }
                  },
                );
              },
              child: Container(
                height: 50,
                width: wid,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.primary,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Add New Address',
                  style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}

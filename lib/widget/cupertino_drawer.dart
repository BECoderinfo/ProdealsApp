import 'package:geolocator/geolocator.dart';
import 'package:pro_deals1/imports.dart';

Widget cupertino_drawer(double hit, double wid) {
  return Container(
    color: AppColor.primary,
    child: Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            'assets/icons/drawer_image.png',
            fit: BoxFit.cover,
            height: 200,
            width: 200,
          ),
        ),
        Container(
          height: hit,
          width: wid / 1.3,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.white,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: UserDataStorageServices.checkIfExist(
                            key: UserStorageDataKeys.imageData)
                        ? Image.memory(
                            Uint8List.fromList(UserDataStorageServices.readData(
                                    key: UserStorageDataKeys.imageData)
                                .where((element) =>
                                    element is int ||
                                    element is String ||
                                    element is double)
                                .map<int>((element) {
                              if (element is String) {
                                return int.tryParse(element) ?? 0;
                              } else if (element is double) {
                                return element.toInt();
                              }
                              return element as int;
                            }).toList()),
                            fit: BoxFit.cover,
                          )
                        : Image.asset('assets/images/profile_image.png'),
                  ),
                  const Gap(16),
                  SizedBox(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${UserDataStorageServices.readData(key: UserStorageDataKeys.name) ?? ""}',
                          style: GoogleFonts.openSans(
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${UserDataStorageServices.readData(key: UserStorageDataKeys.email) ?? ""}',
                          style: GoogleFonts.openSans(
                            color: AppColor.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(30),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed("/edit_profile");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: AppColor.white,
                        ),
                        const Gap(10),
                        Text(
                          'Edit Profile',
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed("/ios_address");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColor.white,
                        ),
                        const Gap(10),
                        Text(
                          'Shopping Address',
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed("/ios_favourite");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: AppColor.white,
                        ),
                        const Gap(10),
                        Text(
                          'Wishlist',
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed("/user_order_history");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.history_edu,
                          color: AppColor.white,
                        ),
                        const Gap(10),
                        Text(
                          'Order History',
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed("/ios_notification");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: AppColor.white,
                        ),
                        const Gap(10),
                        Text(
                          'Notification',
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed('/settings_screen');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: AppColor.white,
                        ),
                        const Gap(10),
                        Text(
                          'Setting',
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed("/ios_support");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.support_outlined,
                          color: AppColor.white,
                        ),
                        const Gap(10),
                        Text(
                          'Support',
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const Gap(20),
              UserDataStorageServices.readData(
                          key: UserStorageDataKeys.businessId) !=
                      null
                  ? Gap(0)
                  : const Gap(0),
              UserDataStorageServices.readData(
                          key: UserStorageDataKeys.businessId) !=
                      null
                  ? Gap(0)
                  : GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.toNamed('/ios_create_account');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.edit_square,
                                color: AppColor.white,
                              ),
                              const Gap(10),
                              Text(
                                'Register your Business',
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  color: AppColor.white,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColor.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
              const Gap(20),
              UserDataStorageServices.readData(
                          key: UserStorageDataKeys.businessId) ==
                      null
                  ? Gap(0)
                  : GestureDetector(
                      onTap: () {
                        UserDataStorageServices.writeData(
                          key: UserStorageDataKeys.cPanel,
                          data: "${panel.business}",
                        );
                        Navigator.popUntil(
                            Get.context!, (route) => route.isFirst);
                        Get.offNamed('/dashboard');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 36,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.logout,
                                  size: 20,
                                  color: Colors.amber,
                                ),
                                const Gap(10),
                                Text(
                                  'Go to business panel',
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              UserDataStorageServices.readData(
                          key: UserStorageDataKeys.businessId) ==
                      null
                  ? Gap(0)
                  : const Gap(10),
              const Gap(10),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Show confirmation dialog before sign out
                    Get.defaultDialog(
                      title: "Are you sure?",
                      middleText: "Do you really want to sign out?",
                      actions: [
                        TextButton(
                          onPressed: () {
                            // If user cancels, close the dialog
                            Get.back();
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            // Perform sign-out action
                            MyVariables.box.erase().then((value) {
                              Get.offNamedUntil(
                                '/login',
                                (route) => route.isFirst,
                              );
                            });
                          },
                          child: Text("Sign Out"),
                        ),
                      ],
                    );
                  },
                  child: Container(
                    height: 36,
                    width: 156,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout,
                          size: 20,
                          color: AppColor.primary,
                        ),
                        const Gap(10),
                        Text(
                          'Logout',
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

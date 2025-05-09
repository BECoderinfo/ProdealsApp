import 'package:pro_deals1/imports.dart';

class ProfilePage extends GetView<ProfilePageController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;

    return GetBuilder<ProfilePageController>(
      init: ProfilePageController(),
      builder: (profileController) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            centerTitle: true,
            backgroundColor: AppColor.primary,
            leading: SizedBox(),
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: hit / 3,
                  width: wid,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60)),
                  ),
                ),
                Container(
                  height: hit,
                  width: wid,
                  child: Column(
                    children: [
                      const Gap(20),
                      SizedBox(
                        height: 110,
                        width: 110,
                        child: Stack(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 50,
                                child: profileController.image.isEmpty &&
                                        profileController.imageUrl.isEmpty
                                    ? Icon(
                                        Icons.person,
                                        size: 45,
                                      )
                                    : profileController.image.isNotEmpty
                                        ? CircleAvatar(
                                            radius: 50,
                                            backgroundImage: MemoryImage(
                                                Uint8List.fromList(
                                                    profileController
                                                        .image
                                                        .where((element) =>
                                                            element is int ||
                                                            element is String ||
                                                            element is double)
                                                        .map<int>((element) {
                                              if (element is String) {
                                                return int.tryParse(element) ??
                                                    0;
                                              } else if (element is double) {
                                                return element.toInt();
                                              }
                                              return element as int;
                                            }).toList())),
                                          )
                                        : CircleAvatar(
                                            radius: 50,
                                            backgroundImage: NetworkImage(
                                                profileController
                                                    .imageUrl.value),
                                          ),
                              ),
                            ),
                            Positioned(
                              bottom: -1,
                              right: -1,
                              child: Container(
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    color: AppColor.white,
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      AppColor.black300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(10),
                      Obx(
                        () => Text(
                          '${profileController.name.value}',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Gap(20),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 16, right: 16, left: 16),
                        child: Container(
                          height: hit / 1.6,
                          width: wid,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16),
                          child: ListView(
                            children: [
                              (UserDataStorageServices.readData(
                                          key: UserStorageDataKeys.isPremium) ==
                                      true)
                                  ? Obx(
                                      () => InkWell(
                                        onTap: (profileController
                                                    .isGetting.value ==
                                                true)
                                            ? null
                                            : () {
                                                Get.toNamed('/userPlan',
                                                    arguments: controller
                                                        .subscription);
                                              },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.diamond,
                                                  color: AppColor.gray,
                                                ),
                                                const Gap(10),
                                                Text(
                                                  'Premium Member',
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 16,
                                                    color: AppColor.gray,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: AppColor.gray,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const Gap(0),
                              (UserDataStorageServices.readData(
                                          key: UserStorageDataKeys.isPremium) ==
                                      true)
                                  ? const Gap(20)
                                  : const Gap(0),
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/edit_profile')?.then(
                                    (value) {
                                      profileController.fetchData();
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: AppColor.gray,
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Edit Profile',
                                          style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            color: AppColor.gray,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.gray,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(20),
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/DeliveryAddress');
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: AppColor.gray,
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Shopping Address',
                                          style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            color: AppColor.gray,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.gray,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(20),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed('/myFavourite');
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: AppColor.gray,
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Wishlist',
                                          style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            color: AppColor.gray,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.gray,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(20),
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/and_user_order_history');
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.history_edu,
                                          color: AppColor.gray,
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Order History',
                                          style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            color: AppColor.gray,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.gray,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(20),
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/notification');
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.notifications,
                                          color: AppColor.gray,
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Notification',
                                          style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            color: AppColor.gray,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.gray,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(20),
                              GestureDetector(
                                onTap: () => Get.toNamed('/settings_screen'),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.settings,
                                          color: AppColor.gray,
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Setting',
                                          style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            color: AppColor.gray,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.gray,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(20),
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/support');
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.support_outlined,
                                          color: AppColor.gray,
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Support',
                                          style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            color: AppColor.gray,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.gray,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              UserDataStorageServices.readData(
                                          key:
                                              UserStorageDataKeys.businessId) !=
                                      null
                                  ? Gap(0)
                                  : const Gap(20),
                              UserDataStorageServices.readData(
                                          key:
                                              UserStorageDataKeys.businessId) !=
                                      null
                                  ? Gap(0)
                                  : InkWell(
                                      onTap: () {
                                        controller.showBusinessRequestDialog(
                                          ctx: context,
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.edit_square,
                                                color: AppColor.gray,
                                              ),
                                              const Gap(10),
                                              Text(
                                                'Register your Business',
                                                style: GoogleFonts.openSans(
                                                  fontSize: 16,
                                                  color: AppColor.gray,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: AppColor.gray,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                              const Gap(40),
                              GestureDetector(
                                onTap: () {
                                  MyVariables.box.erase().then(
                                    (value) {
                                      Get.offNamedUntil(
                                          '/login', (route) => false);
                                    },
                                  );
                                },
                                child: Center(
                                  child: Container(
                                    height: 36,
                                    width: 156,
                                    decoration: BoxDecoration(
                                      color: AppColor.primary,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.logout,
                                          size: 20,
                                          color: AppColor.white,
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Logout',
                                          style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.white,
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

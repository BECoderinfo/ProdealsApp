import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class IosProfile extends GetView<ProfilePageController> {
  const IosProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return GetBuilder<ProfilePageController>(
      init: ProfilePageController(),
      builder: (profileController) {
        return CupertinoPageScaffold(
          child: Container(
            height: hit,
            width: wid,
            color: AppColor.white,
            child: Stack(
              children: [
                Positioned(
                  top: 220,
                  left: -48,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: 170,
                  left: -50,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: 250,
                  left: -36,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2),
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: -66,
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2),
                    ),
                  ),
                ),
                Positioned(
                  top: 190,
                  right: -70,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: -48,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: 160,
                  right: -70,
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(hit / 20),
                        Center(
                          child: Text(
                            'Profile',
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              color: AppColor.black300,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Gap(hit / 20),
                        Center(
                          child: Column(
                            children: [
                              CircleAvatar(
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
                                                profileController.image
                                                    .where((element) =>
                                                        element is int ||
                                                        element is String ||
                                                        element is double)
                                                    .map<int>((element) {
                                                  if (element is String) {
                                                    return int.tryParse(
                                                            element) ??
                                                        0;
                                                  } else if (element
                                                      is double) {
                                                    return element.toInt();
                                                  }
                                                  return element as int;
                                                }).toList(),
                                              ),
                                            ),
                                          )
                                        : CircleAvatar(
                                            radius: 50,
                                            backgroundImage: NetworkImage(
                                              profileController.imageUrl.value,
                                            ),
                                          ),
                              ),
                              const Gap(10),
                              Text(
                                '${profileController.name}',
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.black300,
                                  fontSize: 20,
                                ),
                              ),
                              const Gap(8),
                              (UserDataStorageServices.readData(
                                          key: UserStorageDataKeys.isPremium) ==
                                      true)
                                  ? Text(
                                      '👑 Premium Member',
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.black,
                                        fontSize: 16,
                                      ),
                                    )
                                  : Gap(10),
                              const Gap(60),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed("/user_order_history");
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: wid / 4.5,
                                          width: wid / 4.5,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(1, 1),
                                                blurRadius: 3,
                                                color: AppColor.gray
                                                    .withOpacity(0.5),
                                              ),
                                            ],
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.book,
                                            color: AppColor.black300,
                                            size: 30,
                                          ),
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Orders',
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.black300,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/edit_profile');
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: wid / 4.5,
                                          width: wid / 4.5,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(1, 1),
                                                blurRadius: 3,
                                                color: AppColor.gray
                                                    .withOpacity(0.5),
                                              ),
                                            ],
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.person_outline_sharp,
                                            color: AppColor.black300,
                                            size: 30,
                                          ),
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Profile',
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.black300,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/ios_favourite');
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: wid / 4.5,
                                          width: wid / 4.5,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(1, 1),
                                                blurRadius: 3,
                                                color: AppColor.gray
                                                    .withOpacity(0.5),
                                              ),
                                            ],
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.favorite_border,
                                            color: AppColor.black300,
                                            size: 30,
                                          ),
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Favorites',
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.black300,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/ios_support');
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: wid / 4.5,
                                          width: wid / 4.5,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(1, 1),
                                                blurRadius: 3,
                                                color: AppColor.gray
                                                    .withOpacity(0.5),
                                              ),
                                            ],
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.support_outlined,
                                            color: AppColor.black300,
                                            size: 30,
                                          ),
                                        ),
                                        const Gap(10),
                                        Container(
                                          width: wid / 4.5,
                                          child: Text(
                                            'Support',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.black300,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/ios_address');
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: wid / 4.5,
                                          width: wid / 4.5,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(1, 1),
                                                blurRadius: 3,
                                                color: AppColor.gray
                                                    .withOpacity(0.5),
                                              ),
                                            ],
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: AppColor.black300,
                                            size: 30,
                                          ),
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Addresses',
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.black300,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Obx(
                                    () => GestureDetector(
                                      onTap: controller.isGetting.value
                                          ? null
                                          : () {
                                              (UserDataStorageServices.readData(
                                                          key:
                                                              UserStorageDataKeys
                                                                  .isPremium) ==
                                                      true)
                                                  ? Get.toNamed('/userPlan',
                                                      arguments: controller
                                                          .subscription)
                                                  : Get.toNamed('/Premium');
                                            },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: wid / 4.5,
                                            width: wid / 4.5,
                                            decoration: BoxDecoration(
                                              color: AppColor.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: const Offset(1, 1),
                                                  blurRadius: 3,
                                                  color: AppColor.gray
                                                      .withOpacity(0.5),
                                                ),
                                              ],
                                            ),
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.diamond,
                                              color: AppColor.black300,
                                              size: 30,
                                            ),
                                          ),
                                          const Gap(10),
                                          Text(
                                            'Premium',
                                            style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.black300,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(60),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    // Show confirmation dialog before sign out
                                    Get.defaultDialog(
                                      title: "Are you sure?",
                                      middleText:
                                          "Do you really want to sign out?",
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
                                            MyVariables.box
                                                .erase()
                                                .then((value) {
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
                                    height: hit / 18,
                                    width: wid / 2.4,
                                    decoration: BoxDecoration(
                                      color: AppColor.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.logout,
                                          color: AppColor.white,
                                        ),
                                        const Gap(10),
                                        Text(
                                          'SIGN OUT',
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.bold,
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

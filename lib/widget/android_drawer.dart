import 'package:pro_deals1/imports.dart';

Widget drawer1(double hit, double wid) {
  return Container(
    height: hit,
    width: wid / 1.3,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/drower.png'),
        fit: BoxFit.cover,
      ),
    ),
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const Gap(10),
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
            Get.toNamed('/edit_profile');
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
            Get.toNamed('/DeliveryAddress');
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
            Get.toNamed('/myFavourite');
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
          onTap: () => Get.toNamed('/and_user_order_history'),
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
            Get.toNamed('/notification');
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
          onTap: () => Get.toNamed('/settings_screen'),
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
            Get.toNamed('/support');
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
        UserDataStorageServices.readData(key: UserStorageDataKeys.businessId) !=
                null
            ? Gap(0)
            : const Gap(20),
        UserDataStorageServices.readData(key: UserStorageDataKeys.businessId) !=
                null
            ? Gap(0)
            : GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed('/create_business');
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
        const Gap(30),
        UserDataStorageServices.readData(key: UserStorageDataKeys.businessId) ==
                null
            ? Gap(0)
            : GestureDetector(
                onTap: () {
                  UserDataStorageServices.writeData(
                    key: UserStorageDataKeys.cPanel,
                    data: "${panel.business}",
                  );
                  Navigator.popUntil(Get.context!, (route) => route.isFirst);
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
        UserDataStorageServices.readData(key: UserStorageDataKeys.businessId) ==
                null
            ? Gap(0)
            : const Gap(10),
        GestureDetector(
          onTap: () {
            MyVariables.box.erase().then(
              (value) {
                Get.offNamedUntil('/login', (route) => false);
              },
            );
          },
          child: Center(
            child: Container(
              height: 36,
              width: 156,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(15)),
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
  );
}

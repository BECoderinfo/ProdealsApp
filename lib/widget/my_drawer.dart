import 'package:pro_deals1/imports.dart';

Widget drawer(double hit, double wid) {
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
    child: ListView(
      children: [
        const Gap(40),
        Row(
          children: [
            Container(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: UserDataStorageServices.readData(
                            key: UserStorageDataKeys.businessImage) ==
                        null
                    ? Image.asset(
                        'assets/images/profile_image.png',
                        key: ValueKey('errorImage'),
                        fit: BoxFit.cover,
                      )
                    : Image.memory(
                        Uint8List.fromList(
                          UserDataStorageServices.readData(
                                  key: UserStorageDataKeys.businessImage)
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
                          }).toList(),
                        ),
                        fit: BoxFit.cover,
                        key: ValueKey('memoryImage'),
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/profile_image.png',
                            key: ValueKey('errorImage'),
                            fit: BoxFit.cover,
                          );
                        },
                      ),
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${UserDataStorageServices.readData(key: UserStorageDataKeys.businessName) ?? ""}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  Gap(4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 14,
                      ),
                      Expanded(
                        child: Text(
                          "${UserDataStorageServices.readData(key: UserStorageDataKeys.businessAddress) ?? ""}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Gap(4),
                  Row(
                    children: [
                      Text(
                        "${double.parse("${UserDataStorageServices.readData(key: UserStorageDataKeys.businessRatting) ?? "0"}").toStringAsFixed(1)}",
                        style: TextStyle(fontSize: 14),
                      ),
                      Gap(5),
                      RatingBar.builder(
                        itemBuilder: (context, index) {
                          return Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 16,
                          );
                        },
                        onRatingUpdate: (value) {},
                        ignoreGestures: true,
                        allowHalfRating: true,
                        itemCount: 5,
                        updateOnDrag: false,
                        initialRating: double.parse(
                            "${UserDataStorageServices.readData(key: UserStorageDataKeys.businessRatting) ?? "0"}"),
                        itemSize: 18,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const Gap(30),
        GestureDetector(
          onTap: () {
            Get.back();
            Get.offNamed('/dashboard');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'DASHBOARD',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {
            Get.back();
            Get.offNamed('/business_manage_profile');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'MANAGE PROFILE',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {
            Get.back();
            Get.offNamed('/Manage_menu');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'MANAGE MENU',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {
            Get.back();
            Get.offNamed('/Manage_banner')?.then(
              (value) => Get.delete<ManageBannerController>(),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'MANAGE BANNER',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {
            Get.back();
            Get.offNamed('/Manage_offer')?.then(
              (value) {
                Get.delete<ManageOfferController>();
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'MANAGE OFFERS',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {
            Get.back();
            Get.toNamed('/order_dashboard');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'TOTAL ORDERS',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {
            Get.back();
            Get.offNamed('/earning');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'TOTAL EARNINGS',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {
            Get.back();
            Get.offNamed('/total_redeemed');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'TOTAL REDEEMED',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {
            Get.back();
            Get.offNamed('/Active_offers');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'ACTIVE OFFERS',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {
            Get.back();
            Get.toNamed('/QRcode');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'QR CODE',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        const Gap(20),
        Row(
          children: [
            Text(
              'SETTINGS',
              style: GoogleFonts.openSans(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const Divider(
          indent: 0,
          endIndent: 0,
          color: Colors.black,
          thickness: 0.2,
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {
            Get.back();
            Get.toNamed('/About_Us', arguments: {
              'fileName': MyVariables.aboutUsFile,
            })?.then((value) {
              Get.delete<SettingScreenController>();
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'ABOUT US',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {
            Get.back();
            Get.toNamed('/Term_condition', arguments: {
              'fileName': MyVariables.tAndcFile,
            })?.then((value) {
              Get.delete<SettingScreenController>();
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'TERMS & CONDITION',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {
            Get.back();
            Get.toNamed('/Privacy_policy', arguments: {
              'fileName': MyVariables.privacypolicyFile,
            })?.then((value) {
              Get.delete<SettingScreenController>();
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'PRIVACY POLICY',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        const Gap(30),
        GestureDetector(
          onTap: () {
            UserDataStorageServices.writeData(
              key: UserStorageDataKeys.cPanel,
              data: "${panel.user}",
            );
            currentPageIndex.value = 0;
            Navigator.popUntil(Get.context!, (route) => route.isFirst);
            Get.offNamed('/navigation');
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
                      'Go to user panel',
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
        const Gap(10),
        GestureDetector(
          onTap: () {
            MyVariables.box.erase().then((value) {
              Get.offNamedUntil(
                '/login',
                (route) => route.isFirst,
              );
            });
          },
          child: Center(
            child: Container(
              height: 36,
              width: 156,
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
                    'Logout',
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
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

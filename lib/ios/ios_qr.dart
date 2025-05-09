import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class ios_qr extends GetView<QrController> {
  const ios_qr({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<QrController>(
      init: QrController(),
      builder: (controller) {
        return CupertinoPageScaffold(
          backgroundColor: const Color(0xfff9f9f9),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoFormRow(
                  padding: EdgeInsets.only(
                    top: 25 + MediaQuery.of(context).padding.top,
                    bottom: 15,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Colors.grey.withOpacity(0.5),
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Gap(Get.width / 4),
                      Text(
                        'QR Code',
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(30),
                RepaintBoundary(
                  key: controller.globalKey,
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'My QR Code',
                          style: TextStyle(
                            color: AppColor.black300,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Gap(20),
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: AppColor.gray.withOpacity(0.2),
                          child: UserDataStorageServices.readData(
                                      key: UserStorageDataKeys.businessImage) ==
                                  null
                              ? Image.asset(
                                  'assets/images/profile_image.png',
                                  key: ValueKey('errorImage'),
                                  fit: BoxFit.cover,
                                )
                              : CircleAvatar(
                                  radius: 60,
                                  backgroundImage: MemoryImage(
                                    Uint8List.fromList(
                                      UserDataStorageServices.readData(
                                              key: UserStorageDataKeys
                                                  .businessImage)
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
                                  ),
                                ),
                        ),
                        const Gap(20),
                        Text(
                          '${UserDataStorageServices.readData(key: UserStorageDataKeys.businessName) ?? ''}',
                          style: TextStyle(
                            color: AppColor.black300,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(20),
                        QrImageView(
                          data:
                              '${UserDataStorageServices.readData(key: UserStorageDataKeys.businessId) ?? ""}',
                          version: QrVersions.auto,
                          size: 200,
                          gapless: true,
                        ),
                        const Gap(20),
                      ],
                    ),
                  ),
                ),
                const Gap(30),
                GestureDetector(
                  onTap: () => controller.captureAndSaveImage(),
                  child: Container(
                    height: 50,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.primary,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Share QR Code',
                      style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
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

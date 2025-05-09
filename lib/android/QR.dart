import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pro_deals1/imports.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../utils/colors.dart';

class QRcode extends StatelessWidget {
  const QRcode({super.key});

  @override
  Widget build(BuildContext context) {
    const String phone =
        'assets/images/2560103_camera_media_network_social_icon 1.svg';
    double wid = MediaQuery.of(context).size.width;
    double hit = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text(
          'My QR Code',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Gap(60),
          Container(
            width: 200,
            height: 100,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.memory(
                Uint8List.fromList(
                  UserDataStorageServices.readData(
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
                  }).toList(),
                ),
                fit: BoxFit.cover,
                width: 100,
                height: 100,
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
          const Gap(8),
          Center(
            child: Text(
              '${UserDataStorageServices.readData(key: UserStorageDataKeys.businessName) ?? ""}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          const Gap(40),
          QrImageView(
            data:
                '${UserDataStorageServices.readData(key: UserStorageDataKeys.businessId) ?? ""}',
            version: QrVersions.auto,
            size: 200,
            gapless: true,
          ),
          const Gap(60),
        ],
      ),
    );
  }
}

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_deals1/imports.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../utils/colors.dart';

class QRcode extends StatelessWidget {
  const QRcode({super.key});

  Uint8List? _getImageBytes() {
    try {
      final raw = UserDataStorageServices.readData(
        key: UserStorageDataKeys.businessImage,
      );
      if (raw is List) {
        return Uint8List.fromList(
          raw
              .where((e) => e is int || e is double || e is String)
              .map<int>((e) {
            if (e is int) return e;
            if (e is double) return e.toInt();
            if (e is String) return int.tryParse(e) ?? 0;
            return 0;
          }).toList(),
        );
      }
    } catch (e) {
      // ignore error
    }
    return null;
  }

  Widget _fallbackImage() {
    return Image.asset(
      'assets/images/profile_image.png',
      fit: BoxFit.cover,
      width: 100,
      height: 100,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Uint8List? imageData = _getImageBytes();
    final String businessName = UserDataStorageServices.readData(
          key: UserStorageDataKeys.businessName,
        ) ??
        "";
    final String businessId = UserDataStorageServices.readData(
          key: UserStorageDataKeys.businessId,
        ) ??
        "";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          'My QR Code',
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(40),
              // Business Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: imageData != null
                      ? Image.memory(
                          imageData,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                          errorBuilder: (context, error, stackTrace) =>
                              _fallbackImage(),
                        )
                      : _fallbackImage(),
                ),
              ),
              const Gap(10),
              // Business Name
              Text(
                businessName,
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black300,
                ),
              ),
              const Gap(40),
              // QR Code
              QrImageView(
                data: businessId,
                version: QrVersions.auto,
                size: 200,
                gapless: true,
              ),
              const Gap(12),
              Text(
                'Scan this QR to view business offers and deals',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  color: AppColor.gray,
                ),
              ),
              const Gap(60),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class ios_scan_qr extends StatelessWidget {
  const ios_scan_qr({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff9f9f9),
      child: Column(
        children: [
          Gap(MediaQuery.of(context).padding.top * 2),
          Container(
            height: 60,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: AppColor.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 6,
                          color: AppColor.gray.withOpacity(0.2),
                        ),
                      ],
                    ),
                    child: Icon(
                      CupertinoIcons.arrow_left,
                      size: 24,
                      color: AppColor.black300,
                    ),
                  ),
                ),
                Text(
                  'Scan QR Code',
                  style: TextStyle(
                    color: AppColor.black300,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 40), // Placeholder for alignment
              ],
            ),
          ),
          const Gap(20),
          // QR Scanner
          Expanded(
            child: Container(
              width: width,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    height: height * 0.35,
                    width: width * 0.85,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.transparent,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: MobileScanner(
                        onDetect: (barcodes) {
                          String code = barcodes.barcodes.first.rawValue ?? '';
                          if (code.isNotEmpty && code.isValidObjectId()) {
                            Get.toNamed('/and_restaurant_details', arguments: {
                              'rId': code,
                              'page': 2,
                            })?.then((e) {});
                          }
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(20),
                  // Instructions
                  Text(
                    'Align the QR code within the frame to scan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.black300,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const Gap(20),
                  // Decorative Elements
                  Container(
                    height: 100,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.primary.withOpacity(0.2),
                          AppColor.white
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Keep your camera steady for best results',
                      style: TextStyle(
                        color: AppColor.black300,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Gap(20),
                  // Small Button
                  ElevatedButton(
                    onPressed: () {
                      // Add any action if needed
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      'Scan Now',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

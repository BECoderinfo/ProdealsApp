import 'package:pro_deals1/imports.dart';

class QrScanner extends StatelessWidget {
  const QrScanner({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        centerTitle: true,
        backgroundColor: AppColor.primary,
        leading: SizedBox(),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code_scanner),
            onPressed: () {
              Get.toNamed('/QRcode');
            },
          ),
          Gap(16),
        ],
        elevation: 0,
      ),
      body: Container(
        height: hit,
        width: wid,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: wid,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: MobileScanner(
                      onDetect: (barcodes) {
                        String code = barcodes.barcodes.first.rawValue ?? '';
                        // String code = barcodes.barcodes.first ?? '';
                        if (code.isNotEmpty && code.isValidObjectId()) {
                          Get.toNamed('/and_restaurant_details', arguments: {
                            'rId': code,
                            'page': 2,
                          })?.then((e) {
                            Get.delete<AndroidBusinessDetailController>();
                          });
                        }
                      },
                    ),
                  ),
                  Text(
                    'Scannig the QR Code...',
                    style: TextStyle(
                      color: AppColor.black300,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Align QR Code within frame to scan\nwhich is in right side of camera ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.gray,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(30),
            Container(
              height: 50,
              width: wid / 1.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white,
              ),
              alignment: Alignment.center,
              child: Text(
                'Scanning...',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

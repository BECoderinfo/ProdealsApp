import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../utils/colors.dart';

class QRIos extends StatelessWidget {
  const QRIos({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
        backgroundColor: AppColor.white.withOpacity(0.8),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 0,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: AppColor.white,
                              boxShadow: [BoxShadow(blurRadius: 1)]),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 8,
                        child: Center(
                          child: Text(
                            'Scan QR Code',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    width: wid,
                    height: hit / 1.13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: AppColor.white),
                    child: Column(
                      children: [
                        Gap(20),
                        Center(
                          child: Text(
                            'My QR Code',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/Group 3622.png'))),
                        ),
                        Gap(8),
                        Center(
                          child: Text(
                            'John Lawis',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Gap(40),
                        QrImageView(
                          data: '1234567890',
                          version: QrVersions.auto,
                          size: 200,
                          gapless: true,
                        ),
                        Gap(60),
                        Container(
                          height: 50,
                          width: wid / 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.gray.withOpacity(0.3)),
                          child: const Center(
                            child: Text(
                              'Scan QR Code',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

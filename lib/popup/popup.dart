import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../utils/colors.dart';

class popupscreen extends StatefulWidget {
  const popupscreen({super.key});

  @override
  State<popupscreen> createState() => _popupscreenState();
}

class _popupscreenState extends State<popupscreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: AlertDialog(
        icon: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.close),
          ],
        ),
        title: const Text(
          'UPDRADE TO PREMIUM!',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
        ),
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'it is A Long Establlished Fact That A Reader Will Be Distraced.By The Readble Content Of A Page When Looking At Its Layout.The point OF Using  Lorem lpsum Is  That It Has A More-Or-Less Normal DistriBution Of Letters',
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
            const Gap(20),
            const Text(
              'Primium Benifits :',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.black300,
                  ),
                ),
                const Text(
                  '  Access to all premium content',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.black300,
                  ),
                ),
                const Text(
                  '  Ad-free browsing experience',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.black300,
                  ),
                ),
                const Text(
                  '  Exclusive early access to new features',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.black300,
                  ),
                ),
                const Text(
                  '  Priority Customer Support',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Center(
            child: Container(
              width: 240,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColor.primary),
              child: Center(
                  child: Text('Upgrade Now',
                      style: TextStyle(color: AppColor.white, fontSize: 16))),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Center(
            child: Container(
              width: 240,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primary, width: 2),
                  borderRadius: BorderRadius.circular(7),
                  color: AppColor.white),
              child: const Center(
                  child: Text('Close',
                      style: TextStyle(color: Colors.black, fontSize: 16))),
            ),
          ),
        ],
      ),
    );
  }
}

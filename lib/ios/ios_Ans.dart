import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class ios_Ans extends StatelessWidget {
  const ios_Ans({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff9f9f9),
      child: Container(
        height: hit,
        width: wid,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Gap(40),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 2,
                          spreadRadius: 0,
                          color: AppColor.gray,
                        ),
                      ],
                    ),
                    child: Icon(
                      CupertinoIcons.arrow_left,
                      size: 16,
                      color: AppColor.black300,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Support Center',
                    style: TextStyle(
                      color: AppColor.black300,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(30),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.white,
                          image: const DecorationImage(
                            image: AssetImage('assets/images/Question.png'),
                          ),
                        ),
                      ),
                      const Gap(20),
                      Text(
                        'My order didn’t received  yet?',
                        style: GoogleFonts.openSans(color: AppColor.black300),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Text(
                    "There are many variations of passages ipsum available, but the majority have suffere in some form, by injected humour, randomised words which don't look even slight elievable. If you are going to use a passage of Lorem Ipsum, you need to be sure there is anything embarrassing hidden in the middle of text.\n\nAll the Lorem Ipsum generators the Internet tend to repeat predefined chunks necessary, making this the first true generator on the Internet.",
                    style: GoogleFonts.openSans(color: AppColor.black300),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

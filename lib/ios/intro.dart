import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class ios_intro extends GetView<IntroController> {
  const ios_intro({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: GetBuilder<IntroController>(
        init: IntroController(),
        builder: (controller) {
          return Container(
            height: height,
            width: width,
            child: PageView(
              controller: controller.p,
              children: [
                Column(
                  children: [
                    Container(
                      height: height / 1.7,
                      width: width,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(46),
                        ),
                      ),
                      child: SvgPicture.asset(Intro1),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.black300,
                          ),
                        ),
                        const Gap(10),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primary,
                          ),
                        ),
                        const Gap(10),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text(
                      'Welcome to Pro Deals',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                      ),
                    ),
                    const Gap(20),
                    Text(
                      'Unlock exclusive deals and personalized \ndiscounts tailored to your preferences instantly',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                      ),
                    ),
                    const Gap(40),
                    GestureDetector(
                      onTap: () {
                        controller.p.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: AppColor.primary, shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Icon(
                          CupertinoIcons.arrow_right_circle,
                          color: AppColor.white,
                          size: 36,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: height / 1.7,
                      width: width,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(46),
                        ),
                      ),
                      child: SvgPicture.asset(Intro2),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primary,
                          ),
                        ),
                        const Gap(10),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.black300,
                          ),
                        ),
                        const Gap(10),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text(
                      'Become affiliate marketer',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                      ),
                    ),
                    const Gap(20),
                    Text(
                      'Affiliate marketing is a performance-based\nonline business',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                      ),
                    ),
                    const Gap(40),
                    GestureDetector(
                      onTap: () {
                        controller.p.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: AppColor.primary, shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Icon(
                          CupertinoIcons.arrow_right_circle,
                          color: AppColor.white,
                          size: 36,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: height / 1.7,
                      width: width,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(46),
                        ),
                      ),
                      child: SvgPicture.asset(Intro3),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primary,
                          ),
                        ),
                        const Gap(10),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primary,
                          ),
                        ),
                        const Gap(10),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.black300,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text(
                      'end to end encrypted',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                      ),
                    ),
                    const Gap(20),
                    Text(
                      'security method that keeps your\ncommunications secure',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                      ),
                    ),
                    const Gap(40),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/login');
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: AppColor.primary, shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Icon(
                          CupertinoIcons.arrow_right_circle,
                          color: AppColor.white,
                          size: 36,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

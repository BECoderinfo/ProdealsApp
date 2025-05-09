import 'package:flutter/cupertino.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../imports.dart';

class ios_otp extends GetView<OtpVerificationController> {
  ios_otp({super.key});

  final OtpVerificationController controller =
      Get.put(OtpVerificationController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Container(
        height: height,
        width: width,
        color: AppColor.primary,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColor.black300,
                        ),
                      ),
                      const Gap(60),
                      Text(
                        'OTP Verification',
                        style: GoogleFonts.inter(
                          color: AppColor.black300,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                height: height / 1.25,
                width: width,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(120),
                  ),
                ),
                child: Column(
                  children: [
                    Gap(height / 16),
                    Container(
                      height: height / 4,
                      width: width / 1.5,
                      child: SvgPicture.asset('assets/images/svg/otp_page.svg'),
                    ),
                    const Gap(20),
                    Material(
                      child: OtpPinField(
                        maxLength: 4,
                        onSubmit: (text) {},
                        onChange: (text) {
                          controller.otp.text = text;
                        },
                        autoFocus: false,
                        fieldHeight: 50,
                        keyboardType: TextInputType.number,
                        fieldWidth: 50,
                        otpPinFieldInputType: OtpPinFieldInputType.custom,
                        otpPinFieldDecoration:
                            OtpPinFieldDecoration.roundedPinBoxDecoration,
                      ),
                    ),
                    const Gap(25),
                    Obx(() {
                      return controller.remainingTime.value == 0
                          ? GestureDetector(
                              onTap: () {
                                controller.isProcess.value = true;
                                resendOtp(
                                  email: controller.email,
                                  onDone: () {
                                    controller.isProcess.value = false;
                                  },
                                ).then(
                                  (value) {
                                    if (value ?? false) {
                                      controller.expireTime = DateTime.now()
                                          .add(Duration(minutes: 2))
                                          .toString();
                                      controller.startTimer();
                                      controller.otp.clear();
                                    }
                                  },
                                );
                              },
                              child: Text(
                                "Resend OTP",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                ),
                              ),
                            )
                          : Text(
                              'Resend OTP IN ${controller.remainingTime.value}s',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                            );
                    }),
                    const Gap(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Obx(
                        () => controller.isProcess.value
                            ? CustomCircularIndicator(color: AppColor.primary)
                            : GestureDetector(
                                onTap: () async {
                                  if (controller.otp.text.isEmpty) {
                                    ShowToast.toast(msg: 'Please enter otp');
                                    return;
                                  } else if (controller.otp.text.length != 4) {
                                    ShowToast.toast(
                                      msg: 'Please enter 4 digit otp',
                                    );
                                    return;
                                  }
                                  controller.isProcess.value = true;
                                  verifyOtp(
                                    email: controller.email,
                                    otp: controller.otp.text,
                                    onDone: () {
                                      controller.isProcess.value = false;
                                    },
                                  ).then(
                                    (value) {
                                      if (value ?? false) {
                                        if (controller.phone.isEmpty) {
                                          Get.toNamed(
                                            '/reset_password',
                                            arguments: {
                                              'email': controller.email,
                                            },
                                          );
                                        } else {
                                          loginUser(
                                            email: controller.email,
                                            password: controller.password,
                                            onDone: () {
                                              controller.isProcess.value =
                                                  false;
                                            },
                                          );
                                        }
                                      }
                                    },
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  width: width,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColor.primary,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 2,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'Verify',
                                    style: GoogleFonts.roboto(
                                      color: AppColor.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                    const Gap(40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Column(
                  children: [
                    Gap(height / 16),
                    Container(
                      height: height / 4,
                      width: width / 1.5,
                      child: SvgPicture.asset('assets/images/svg/otp_page.svg'),
                    ),
                    const Gap(25),
                    Material(
                      child: OtpPinField(
                        maxLength: 4,
                        onSubmit: (text) {},
                        onChange: (text) {},
                        autoFocus: false,
                        fieldHeight: 50,
                        fieldWidth: 50,
                        otpPinFieldInputType: OtpPinFieldInputType.custom,
                        otpPinFieldDecoration:
                            OtpPinFieldDecoration.roundedPinBoxDecoration,
                      ),
                    ),
                    const Gap(15),
                    Obx(() {
                      return controller.remainingTime.value == 0
                          ? GestureDetector(
                              onTap: () {
                                controller.isProcess.value = true;
                                resendOtp(
                                  email: controller.email,
                                  onDone: () {
                                    controller.isProcess.value = false;
                                  },
                                ).then(
                                  (value) {
                                    if (value ?? false) {
                                      controller.expireTime = DateTime.now()
                                          .add(Duration(minutes: 2))
                                          .toString();
                                      controller.startTimer();
                                      controller.otp.clear();
                                    }
                                  },
                                );
                              },
                              child: Text("Resend OTP"))
                          : Text(
                              'Resend OTP IN ${controller.remainingTime.value}s',
                              style: GoogleFonts.roboto(),
                            );
                    }),
                    const Gap(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Obx(
                        () => controller.isProcess.value
                            ? CustomCircularIndicator(color: AppColor.primary)
                            : GestureDetector(
                                onTap: () async {
                                  controller.isProcess.value = true;
                                  verifyOtp(
                                    email: controller.email,
                                    otp: controller.otp.text,
                                    onDone: () {
                                      controller.isProcess.value = false;
                                    },
                                  ).then(
                                    (value) {
                                      if (value ?? false) {
                                        if (controller.phone.isEmpty) {
                                          Get.toNamed(
                                            '/reset_password',
                                            arguments: {
                                              'email': controller.email,
                                            },
                                          );
                                        } else {
                                          loginUser(
                                            email: controller.email,
                                            password: controller.password,
                                            onDone: () {
                                              controller.isProcess.value =
                                                  false;
                                            },
                                          );
                                        }
                                      }
                                    },
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  width: width,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColor.primary,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 2,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'Verify',
                                    style: GoogleFonts.roboto(
                                      color: AppColor.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                    const Gap(40),
                  ],
                )
*/

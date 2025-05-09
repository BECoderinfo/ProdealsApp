import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class otp_verification extends GetView<OtpVerificationController> {
  otp_verification({super.key});

  final OtpVerificationController controller =
      Get.put(OtpVerificationController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: height / 1.5,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(background),
                  fit: BoxFit.fill,
                ),
              ),
              child: Form(
                child: Column(
                  children: [
                    const Gap(140),
                    Text(
                      'OTP Verification',
                      style: GoogleFonts.roboto(
                        color: AppColor.black300,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(50),
                    Text(
                      'We Will sent a verification code to\n ${controller.phone}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.w200),
                    ),
                    const Gap(50),
                    CupertinoTextFormFieldRow(
                      obscureText: true,
                      style: GoogleFonts.poppins(
                        color: AppColor.black300,
                      ),
                      placeholder: '0000',
                      placeholderStyle: GoogleFonts.poppins(
                        color: AppColor.black300,
                      ),
                      validator: (pass) {
                        if (controller.otp.text.isEmpty) {
                          return 'Enter otp';
                        } else if (controller.otp.text.length != 4) {
                          return 'Enter valid otp';
                        }
                        return null;
                      },
                      controller: controller.otp,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                    ),
                    const Gap(30),
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
                  ],
                ),
              ),
            ),
            const Gap(40),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                                      controller.isProcess.value = false;
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
                                color: Colors.black26,
                                blurRadius: 2,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Continue',
                                style: GoogleFonts.roboto(
                                  color: AppColor.black300,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

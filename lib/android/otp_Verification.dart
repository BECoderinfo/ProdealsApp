import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class otp_verification extends GetView<OtpVerificationController> {
  otp_verification({super.key});

  // Remove the Get.put here — use controller from GetView
  final OtpVerificationController controller =
      Get.put(OtpVerificationController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          children: [
            Spacer(flex: 2),
            Text(
              'OTP Verification',
              style: GoogleFonts.roboto(
                color: AppColor.black300,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(24),
            Text(
              'We will send a verification code to\n${controller.phone}',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: AppColor.black300.withOpacity(0.8),
              ),
            ),
            const Gap(40),

            // OTP input field wrapped with some styling
            CupertinoTextFormFieldRow(
              obscureText: false,
              // Usually OTP isn't obscured
              maxLength: 4,
              keyboardType: TextInputType.number,
              style: GoogleFonts.poppins(
                color: AppColor.black300,
                fontSize: 24,
                letterSpacing: 12,
                fontWeight: FontWeight.w600,
              ),
              placeholder: '••••',
              textAlign: TextAlign.center,
              placeholderStyle: GoogleFonts.poppins(
                color: AppColor.black300.withOpacity(0.3),
                fontSize: 24,
                letterSpacing: 12,
                fontWeight: FontWeight.w600,
              ),
              validator: (pass) {
                if (controller.otp.text.isEmpty) {
                  return 'Enter OTP';
                } else if (controller.otp.text.length != 4) {
                  return 'Enter valid OTP';
                }
                return null;
              },
              controller: controller.otp,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.primary, width: 2),
              ),
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
                        ).then((value) {
                          if (value ?? false) {
                            controller.expireTime = DateTime.now()
                                .add(Duration(minutes: 2))
                                .toString();
                            controller.startTimer();
                            controller.otp.clear();
                          }
                        });
                      },
                      child: Text(
                        "Resend OTP",
                        style: GoogleFonts.roboto(
                          color: AppColor.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  : Text(
                      'Resend OTP in ${controller.remainingTime.value}s',
                      style: GoogleFonts.roboto(
                        color: AppColor.black300.withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    );
            }),
            Spacer(flex: 3),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Obx(
                () => controller.isProcess.value
                    ? CustomCircularIndicator(color: AppColor.primary)
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 5,
                        ),
                        onPressed: () async {
                          controller.isProcess.value = true;
                          verifyOtp(
                            email: controller.email,
                            otp: controller.otp.text,
                            onDone: () {
                              controller.isProcess.value = false;
                            },
                          ).then((value) {
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
                          });
                        },
                        child: Center(
                          child: Text(
                            'Continue',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class IOSResetPasswordScreen extends GetView<ResetPasswordController> {
  const IOSResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<ResetPasswordController>(
      init: ResetPasswordController(),
      builder: (controller) {
        return CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          child: Container(
            height: height,
            width: width,
            color: AppColor.primary,
            child: Column(
              children: [
                Container(
                  height: height * 0.2,
                  width: width,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Gap(20),
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColor.black300,
                        ),
                      ),
                      Gap(30),
                      Text(
                        'Reset Password',
                        style: GoogleFonts.inter(
                          color: AppColor.black300,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      height: height * 0.8,
                      width: width,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(120),
                        ),
                      ),
                      child: Column(
                        children: [
                          Gap(height / 9),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 3,
                                          color: AppColor.gray.withOpacity(0.4),
                                          offset: const Offset(0, 0)),
                                    ],
                                    color: AppColor.white.withOpacity(1),
                                  ),
                                  child: Obx(
                                    () => CupertinoFormRow(
                                      prefix: SvgPicture.asset(
                                        'assets/icons/lock_circle.svg',
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: CupertinoTextFormFieldRow(
                                              obscureText: !controller
                                                  .isPasswordShow.value,
                                              style: GoogleFonts.poppins(
                                                color: AppColor.black300,
                                              ),
                                              onChanged: (value) {
                                                if (value.isNotEmpty &&
                                                    controller.cPasswordError
                                                        .value.isNotEmpty) {
                                                  controller.cPasswordError
                                                      .value = "";
                                                }
                                              },
                                              placeholder: 'Password',
                                              placeholderStyle:
                                                  GoogleFonts.poppins(
                                                color: AppColor.black300,
                                              ),
                                              controller: controller.password,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              controller.isPasswordShow.value =
                                                  !controller
                                                      .isPasswordShow.value;
                                            },
                                            icon: Icon(
                                              controller.isPasswordShow.value
                                                  ? Icons.visibility_off_rounded
                                                  : Icons.visibility_rounded,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => controller.passwordError.value.isEmpty
                                    ? Gap(0)
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                          left: 24.0,
                                          top: 8.0,
                                        ),
                                        child: Text(
                                          controller.passwordError.value,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          Gap(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 3,
                                          color: AppColor.gray.withOpacity(0.4),
                                          offset: const Offset(0, 0)),
                                    ],
                                    color: AppColor.white.withOpacity(1),
                                  ),
                                  child: CupertinoFormRow(
                                    prefix: SvgPicture.asset(
                                      'assets/icons/lock_circle.svg',
                                    ),
                                    child: CupertinoTextFormFieldRow(
                                      style: GoogleFonts.poppins(
                                        color: AppColor.black300,
                                      ),
                                      onChanged: (value) {
                                        if (value.isNotEmpty &&
                                            controller.cPasswordError.value
                                                .isNotEmpty) {
                                          controller.cPasswordError.value = "";
                                        }
                                      },
                                      placeholder: 'Confirm password',
                                      placeholderStyle: GoogleFonts.poppins(
                                        color: AppColor.black300,
                                      ),
                                      controller: controller.confirmPassword,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => controller.cPasswordError.value.isEmpty
                                    ? Gap(0)
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8.0,
                                          left: 24.0,
                                        ),
                                        child: Text(
                                          controller.cPasswordError.value,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          const Gap(40),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Obx(
                              () => controller.isProcess.value
                                  ? CustomCircularIndicator(
                                      color: AppColor.black,
                                    )
                                  : GestureDetector(
                                      onTap: () async {
                                        controller.passwordError.value = "";
                                        controller.cPasswordError.value = "";
                                        if (controller.password.text.isEmpty ||
                                            controller
                                                .confirmPassword.text.isEmpty ||
                                            controller.password.text.length <
                                                8) {
                                          if (controller
                                              .password.text.isEmpty) {
                                            controller.passwordError.value =
                                                "Please enter password";
                                          } else if (controller
                                                  .password.text.length <
                                              8) {
                                            controller.passwordError.value =
                                                "password length must be 8 or 8+";
                                          }

                                          if (controller
                                              .confirmPassword.text.isEmpty) {
                                            controller.cPasswordError.value =
                                                "Please enter confirm password";
                                          }
                                        } else if (controller.password.text !=
                                            controller.confirmPassword.text) {
                                          controller.cPasswordError.value =
                                              "Please enter both password same";
                                          controller.confirmPassword.clear();
                                        } else {
                                          controller.isProcess.value = true;
                                          controller.resetPassword();
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        width: width,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: AppColor.primary,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade400,
                                              blurRadius: 2,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          'Reset now',
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

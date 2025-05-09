import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class ios_login extends GetView<LoginController> {
  ios_login({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: SingleChildScrollView(
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
                    Text(
                      'Login',
                      style: GoogleFonts.inter(
                        color: AppColor.black300,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'Please sign in to continue.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: AppColor.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height / 1.2,
                width: width,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(120),
                  ),
                ),
                child: Form(
                  key: controller.formkey,
                  child: Column(
                    children: [
                      Gap(height / 9),

                      /// Mobile number field
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           blurRadius: 3,
                      //           color: AppColor.gray.withOpacity(0.4),
                      //           offset: const Offset(0, 0),
                      //         ),
                      //       ],
                      //       color: AppColor.white.withOpacity(1),
                      //     ),
                      //     child: CupertinoFormRow(
                      //       prefix: SvgPicture.asset(
                      //           'assets/icons/account_circle.svg'),
                      //       child: CupertinoTextFormFieldRow(
                      //         style: GoogleFonts.poppins(
                      //           color: AppColor.black300,
                      //         ),
                      //         placeholder: 'number',
                      //         placeholderStyle: GoogleFonts.poppins(
                      //           color: AppColor.black300,
                      //         ),
                      //         validator: (num) {
                      //           if (number.text.isEmpty) {
                      //             return 'Enter number';
                      //           } else if (number.text.length != 10) {
                      //             return 'Enter a valid number';
                      //           }
                      //           return null;
                      //         },
                      //         controller: number,
                      //         // for spacing between icon and text
                      //         padding:
                      //             const EdgeInsets.symmetric(horizontal: 6),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: AppColor.gray.withOpacity(0.4),
                                offset: const Offset(0, 0),
                              ),
                            ],
                            color: AppColor.white.withOpacity(1),
                          ),
                          child: CupertinoFormRow(
                            prefix: SvgPicture.asset(
                                'assets/icons/account_circle.svg'),
                            child: CupertinoTextFormFieldRow(
                              style: GoogleFonts.poppins(
                                color: AppColor.black300,
                              ),
                              placeholder: 'email',
                              placeholderStyle: GoogleFonts.poppins(
                                color: AppColor.black300,
                              ),
                              validator: (num) {
                                if (controller.phone.text.isEmpty) {
                                  return 'Enter number';
                                } else if (!GetUtils.isEmail(
                                    controller.phone.text)) {
                                  return 'Enter a valid email address';
                                }
                                return null;
                              },
                              controller: controller.phone,
                              // for spacing between icon and text
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                            ),
                          ),
                        ),
                      ),
                      const Gap(18),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                                'assets/icons/lock_circle.svg'),
                            child: CupertinoTextFormFieldRow(
                              obscureText: true,
                              style: GoogleFonts.poppins(
                                color: AppColor.black300,
                              ),
                              placeholder: 'Password',
                              placeholderStyle: GoogleFonts.poppins(
                                color: AppColor.black300,
                              ),
                              validator: (pass) {
                                if (controller.password.text.isEmpty) {
                                  return 'Enter password';
                                } else if (controller.password.text.length <
                                    6) {
                                  return 'password length must be 6 or 6+';
                                }
                                return null;
                              },
                              controller: controller.password,
                              // for spacing between icon and text
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                            ),
                          ),
                        ),
                      ),
                      const Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: width,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/forgot');
                            },
                            child: Text(
                              'Forgot Password?',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: AppColor.black300,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Obx(
                          () => controller.isProcess.value &&
                                  controller.phone.text.isNotEmpty &&
                                  controller.password.text.isNotEmpty
                              ? CustomCircularIndicator(
                                  color: AppColor.black,
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    FocusScope.of(context).unfocus();
                                    var key = controller.formkey.currentState!;
                                    if (key.validate()) {
                                      controller.isProcess.value = true;
                                      loginUser(
                                        email: controller.phone.text,
                                        password: controller.password.text,
                                        onDone: () {
                                          controller.isProcess.value = false;
                                          controller.update();
                                        },
                                      );
                                      // password: 'jay@123',
                                      // email: 'jayviradiya58885@gmail.com',
                                    }
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
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      'Login',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 2,
                              width: width / 4,
                              color: AppColor.gray.withOpacity(0.2),
                            ),
                            const Gap(10),
                            Text(
                              'or continue with',
                              style: GoogleFonts.poppins(
                                color: AppColor.black300,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const Gap(10),
                            Container(
                              height: 2,
                              width: width / 4,
                              color: AppColor.gray.withOpacity(0.2),
                            ),
                          ],
                        ),
                      ),
                      const Gap(30),
                      Obx(
                        () => controller.isProcess.value &&
                                controller.phone.text.isEmpty &&
                                controller.password.text.isEmpty
                            ? CustomCircularIndicator(color: AppColor.primary)
                            : GestureDetector(
                                onTap: () {
                                  controller.password.text = "";
                                  controller.phone.text = "";
                                  controller.isProcess.value = true;
                                  controller.loginWithGoogle(ctx: context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 120,
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.apple,
                                    color: AppColor.black300,
                                    size: 50,
                                  ),
                                ),
                              ),
                      ),
                      const Gap(50),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/ios_sign_up');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account?',
                              style:
                                  GoogleFonts.poppins(color: AppColor.black300),
                            ),
                            const Gap(6),
                            Text(
                              ' Sign up',
                              style:
                                  GoogleFonts.poppins(color: AppColor.primary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

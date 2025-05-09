import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class ios_sign_up extends GetView<RegisterController> {
  ios_sign_up({super.key});

  final RegisterController controller = Get.put(RegisterController());

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
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColor.black300,
                        ),
                      ),
                      const Gap(60),
                      Text(
                        'Create Account',
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
                child: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(height / 9),
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
                                  'assets/icons/account_circle.svg'),
                              child: CupertinoTextFormFieldRow(
                                style: GoogleFonts.poppins(
                                  color: AppColor.black300,
                                ),
                                placeholder: 'Enter username',
                                placeholderStyle: GoogleFonts.poppins(
                                  color: AppColor.black300,
                                ),
                                validator: (username) {
                                  if (controller.user.text.isEmpty) {
                                    return 'Enter username';
                                  }
                                  return null;
                                },
                                controller: controller.user,
                                // for spacing between icon and text
                                padding: EdgeInsets.symmetric(horizontal: 6),
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
                                  'assets/icons/call_circle.svg'),
                              child: CupertinoTextFormFieldRow(
                                style: GoogleFonts.poppins(
                                  color: AppColor.black300,
                                ),
                                placeholder: 'Enter phone number',
                                placeholderStyle: GoogleFonts.poppins(
                                  color: AppColor.black300,
                                ),
                                validator: (num) {
                                  if (controller.phone.text.isEmpty) {
                                    return 'Enter number';
                                  } else if (controller.phone.text.length !=
                                      10) {
                                    return 'Enter a valid number';
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
                              prefix: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                              child: CupertinoTextFormFieldRow(
                                style: GoogleFonts.poppins(
                                  color: AppColor.black300,
                                ),
                                placeholder: 'Enter email',
                                placeholderStyle: GoogleFonts.poppins(
                                  color: AppColor.black300,
                                ),
                                validator: (num) {
                                  if (controller.email.text.isEmpty) {
                                    return 'Enter email';
                                  } else if (!GetUtils.isEmail(
                                      controller.email.text)) {
                                    return 'Enter a valid email';
                                  }
                                  return null;
                                },
                                controller: controller.email,
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
                                      8) {
                                    return 'password length must be 8 or 8+';
                                  }
                                  return null;
                                },
                                controller: controller.password,
                                // for spacing between icon and text
                                padding: EdgeInsets.symmetric(horizontal: 6),
                              ),
                            ),
                          ),
                        ),
                        const Gap(60),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Obx(
                            () => controller.isProcess.value
                                ? CustomCircularIndicator(
                                    color: AppColor.black,
                                  )
                                : GestureDetector(
                                    onTap: () async {
                                      FocusScope.of(context).unfocus();
                                      // controller.isProcess.value = false;
                                      // return;
                                      var key = controller.formKey.currentState;
                                      if (key!.validate()) {
                                        controller.isProcess.value = true;
                                        await registerUser(
                                          userName:
                                              controller.user.text.toString(),
                                          email:
                                              controller.email.text.toString(),
                                          phone:
                                              controller.phone.text.toString(),
                                          password: controller.password.text
                                              .toString(),
                                          onDone: () {
                                            controller.isProcess.value = false;
                                          },
                                        );
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
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        'Sign up',
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
                              Gap(10),
                              Text(
                                'or continue with',
                                style: GoogleFonts.poppins(
                                  color: AppColor.black300,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Gap(10),
                              Container(
                                height: 2,
                                width: width / 4,
                                color: AppColor.gray.withOpacity(0.2),
                              ),
                            ],
                          ),
                        ),
                        const Gap(30),
                        Container(
                          height: 50,
                          width: 120,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.apple,
                            color: AppColor.black300,
                            size: 50,
                          ),
                        ),
                        const Gap(50),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already Have an a Account?',
                                style: GoogleFonts.poppins(
                                    color: AppColor.black300),
                              ),
                              const Gap(6),
                              Text(
                                ' Sign in',
                                style: GoogleFonts.poppins(
                                    color: AppColor.primary),
                              ),
                            ],
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

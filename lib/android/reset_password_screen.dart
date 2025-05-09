import 'package:pro_deals1/imports.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<ResetPasswordController>(
      init: ResetPasswordController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            height: height,
            width: width,
            color: AppColor.primary,
            child: Column(
              children: [
                const Gap(160),
                Text(
                  'Reset Password',
                  style: GoogleFonts.roboto(
                    color: AppColor.black300,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => TextField(
                          controller: controller.password,
                          obscureText: !controller.isPasswordShow.value,
                          onChanged: (value) {
                            if (value.isNotEmpty &&
                                controller.passwordError.value.isNotEmpty) {
                              controller.passwordError.value = "";
                            }
                          },
                          decoration: InputDecoration(
                            label: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.password,
                                size: 20,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Enter password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.isPasswordShow.value =
                                    !controller.isPasswordShow.value;
                              },
                              icon: Icon(
                                controller.isPasswordShow.value
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.passwordError.value.isEmpty
                            ? Gap(0)
                            : Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.passwordError.value,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                      )
                    ],
                  ),
                ),
                const Gap(40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: controller.confirmPassword,
                        onChanged: (value) {
                          if (value.isNotEmpty &&
                              controller.cPasswordError.value.isNotEmpty) {
                            controller.cPasswordError.value = "";
                          }
                        },
                        decoration: InputDecoration(
                          label: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.password,
                              size: 20,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter confirm password',
                        ),
                      ),
                      Obx(
                        () => controller.cPasswordError.value.isEmpty
                            ? Gap(0)
                            : Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.cPasswordError.value,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                      )
                    ],
                  ),
                ),
                const Gap(40),
                Obx(
                  () => controller.isProcess.value
                      ? CustomCircularIndicator(color: AppColor.white)
                      : GestureDetector(
                          onTap: () {
                            controller.passwordError.value = "";
                            controller.cPasswordError.value = "";
                            if (controller.password.text.isEmpty ||
                                controller.confirmPassword.text.isEmpty ||
                                controller.password.text.length < 8) {
                              if (controller.password.text.isEmpty) {
                                controller.passwordError.value =
                                    "Please enter password";
                              } else if (controller.password.text.length < 8) {
                                controller.passwordError.value =
                                    "password length must be 8 or 8+";
                              }

                              if (controller.confirmPassword.text.isEmpty) {
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
                            height: 40,
                            width: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.white,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Send',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                color: AppColor.primary,
                                fontSize: 16,
                              ),
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

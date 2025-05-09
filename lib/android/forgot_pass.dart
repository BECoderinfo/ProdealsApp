import 'package:pro_deals1/imports.dart';

class forgot_pass extends GetView<ForgetPasswordController> {
  const forgot_pass({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<ForgetPasswordController>(
      init: ForgetPasswordController(),
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
                  'Reset Password Here!',
                  style: GoogleFonts.roboto(
                    color: AppColor.black300,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(50),
                Text(
                  'Enter Email to \nReset Password',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                  ),
                ),
                const Gap(50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: controller.controller,
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
                              Icons.email,
                              size: 20,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter email',
                        ),
                      ),
                      Obx(
                        () => controller.emailError.value.isEmpty
                            ? Gap(0)
                            : Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.emailError.value,
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
                            controller.emailError.value = "";
                            if (controller.controller.text.isEmpty) {
                              controller.emailError.value =
                                  "Please enter email";
                            } else if (!GetUtils.isEmail(
                                controller.controller.text)) {
                              controller.emailError.value =
                                  "Please enter valid email";
                            } else {
                              controller.isProcess.value = true;
                              controller.sendOtp();
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

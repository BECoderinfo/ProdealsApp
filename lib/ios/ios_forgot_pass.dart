import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class IosForgotPass extends GetView<ForgetPasswordController> {
  const IosForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<ForgetPasswordController>(
      init: ForgetPasswordController(),
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
                                      onChanged: (value) {
                                        if (value.isNotEmpty &&
                                            controller
                                                .emailError.value.isNotEmpty) {
                                          controller.emailError.value = "";
                                        }
                                      },
                                      placeholder: 'Email',
                                      placeholderStyle: GoogleFonts.poppins(
                                        color: AppColor.black300,
                                      ),
                                      controller: controller.controller,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => controller.emailError.value.isEmpty
                                    ? Gap(0)
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8.0,
                                          left: 24.0,
                                        ),
                                        child: Text(
                                          controller.emailError.value,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          const Gap(80),
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
                                        controller.emailError.value = "";
                                        if (controller
                                            .controller.text.isEmpty) {
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
                                          'Send OTP',
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
            // child: Column(
            //   children: [
            //     const Gap(160),
            //     Text(
            //       'Reset Password Here!',
            //       style: GoogleFonts.roboto(
            //         color: AppColor.black300,
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     const Gap(50),
            //     Text(
            //       'Enter Email to \nReset Password',
            //       textAlign: TextAlign.center,
            //       style: GoogleFonts.roboto(
            //         fontSize: 20,
            //       ),
            //     ),
            //     const Gap(50),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //       child: Column(
            //         children: [
            //           TextField(
            //             controller: controller.controller,
            //             decoration: InputDecoration(
            //               label: Container(
            //                 height: 30,
            //                 width: 30,
            //                 decoration: BoxDecoration(
            //                   color: AppColor.white,
            //                   shape: BoxShape.circle,
            //                 ),
            //                 alignment: Alignment.center,
            //                 child: Icon(
            //                   Icons.email,
            //                   size: 20,
            //                 ),
            //               ),
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(10),
            //               ),
            //               hintText: 'Enter email',
            //             ),
            //           ),
            //           Obx(
            //             () => controller.emailError.value.isEmpty
            //                 ? Gap(0)
            //                 : Padding(
            //                     padding: const EdgeInsets.only(top: 8.0),
            //                     child: Text(
            //                       controller.emailError.value,
            //                       style: TextStyle(
            //                         color: Colors.red,
            //                         fontSize: 12,
            //                       ),
            //                     ),
            //                   ),
            //           )
            //         ],
            //       ),
            //     ),
            //     const Gap(40),
            //     Obx(
            //       () => controller.isProcess.value
            //           ? CustomCircularIndicator(color: AppColor.white)
            //           : GestureDetector(
            //               onTap: () {
            //                 controller.emailError.value = "";
            //                 if (controller.controller.text.isEmpty) {
            //                   controller.emailError.value =
            //                       "Please enter email";
            //                 } else if (!GetUtils.isEmail(
            //                     controller.controller.text)) {
            //                   controller.emailError.value =
            //                       "Please enter valid email";
            //                 } else {
            //                   controller.isProcess.value = true;
            //                   controller.sendOtp();
            //                 }
            //               },
            //               child: Container(
            //                 height: 40,
            //                 width: 230,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10),
            //                   color: AppColor.white,
            //                 ),
            //                 alignment: Alignment.center,
            //                 child: Text(
            //                   'Send',
            //                   style: GoogleFonts.roboto(
            //                     fontWeight: FontWeight.w600,
            //                     color: AppColor.primary,
            //                     fontSize: 16,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //     ),
            //   ],
            // ),
          ),
        );
      },
    );
  }
}

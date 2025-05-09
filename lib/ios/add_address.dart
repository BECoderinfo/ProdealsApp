import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class ios_add_address extends GetView<AddAddressController> {
  const ios_add_address({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    final AddAddressController addressController =
        Get.put(AddAddressController());
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff9f9f9),
      child: Container(
        height: hit,
        width: wid,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Gap(40),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 2,
                          spreadRadius: 0,
                          color: AppColor.gray,
                        ),
                      ],
                    ),
                    child: Icon(
                      CupertinoIcons.arrow_left,
                      size: 16,
                      color: AppColor.black300,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Address',
                    style: TextStyle(
                      color: AppColor.black300,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: addressController.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 4),
                              child: Text(
                                'Full Name',
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black300.withOpacity(0.7),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  // prefix: SvgPicture.asset(
                                  //     'assets/icons/account_circle.svg'),
                                  child: CupertinoTextFormFieldRow(
                                    style: GoogleFonts.poppins(
                                      color: AppColor.black300,
                                    ),
                                    placeholder: 'Enter your Name',
                                    placeholderStyle: GoogleFonts.poppins(
                                      color: AppColor.black300,
                                    ),
                                    validator: (username) {
                                      if (controller.name.text.isEmpty) {
                                        return 'Enter username';
                                      }
                                      return null;
                                    },
                                    controller: controller.name,
                                    // for spacing between icon and text
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 4),
                              child: Text(
                                'Phone Number',
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black300.withOpacity(0.7),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  child: CupertinoTextFormFieldRow(
                                    style: GoogleFonts.poppins(
                                      color: AppColor.black300,
                                    ),
                                    placeholder: 'Enter your Phone Number',
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 4),
                              child: Text(
                                'Email Address',
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black300.withOpacity(0.7),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  child: CupertinoTextFormFieldRow(
                                    style: GoogleFonts.poppins(
                                      color: AppColor.black300,
                                    ),
                                    placeholder: 'Enter your Email',
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
                                    controller: controller.email,
                                    // for spacing between icon and text
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 4),
                              child: Text(
                                'Address',
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black300.withOpacity(0.7),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  // prefix: SvgPicture.asset(
                                  //     'assets/icons/lock_circle.svg'),
                                  child: CupertinoTextFormFieldRow(
                                    style: GoogleFonts.poppins(
                                      color: AppColor.black300,
                                    ),
                                    placeholder: 'Enter your Address',
                                    placeholderStyle: GoogleFonts.poppins(
                                      color: AppColor.black300,
                                    ),
                                    validator: (num) {
                                      if (controller.email.text.isEmpty) {
                                        return 'Enter address';
                                      }
                                      return null;
                                    },
                                    controller: controller.address,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 4),
                              child: Text(
                                'City',
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black300.withOpacity(0.7),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  // prefix: SvgPicture.asset(
                                  //     'assets/icons/lock_circle.svg'),
                                  child: CupertinoTextFormFieldRow(
                                    style: GoogleFonts.poppins(
                                      color: AppColor.black300,
                                    ),
                                    placeholder: 'Enter your City',
                                    placeholderStyle: GoogleFonts.poppins(
                                      color: AppColor.black300,
                                    ),
                                    validator: (num) {
                                      if (controller.city.text.isEmpty) {
                                        return 'Enter city';
                                      }
                                      return null;
                                    },
                                    controller: controller.city,
                                    // for spacing between icon and text
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 4),
                              child: Text(
                                'State',
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black300.withOpacity(0.7),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  // prefix: SvgPicture.asset(
                                  //     'assets/icons/lock_circle.svg'),
                                  child: CupertinoTextFormFieldRow(
                                    style: GoogleFonts.poppins(
                                      color: AppColor.black300,
                                    ),
                                    placeholder: 'Enter your State',
                                    placeholderStyle: GoogleFonts.poppins(
                                      color: AppColor.black300,
                                    ),
                                    validator: (num) {
                                      if (controller.state.text.isEmpty) {
                                        return 'Enter state';
                                      }
                                      return null;
                                    },
                                    controller: controller.state,
                                    // for spacing between icon and text
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 4),
                              child: Text(
                                'Pin-code',
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black300.withOpacity(0.7),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  // prefix: SvgPicture.asset(
                                  //     'assets/icons/lock_circle.svg'),
                                  child: CupertinoTextFormFieldRow(
                                    style: GoogleFonts.poppins(
                                      color: AppColor.black300,
                                    ),
                                    placeholder: 'Enter your area pincode',
                                    placeholderStyle: GoogleFonts.poppins(
                                      color: AppColor.black300,
                                    ),
                                    validator: (num) {
                                      if (controller.pincode.text.isEmpty) {
                                        return 'Enter your area pincode';
                                      } else if (controller
                                              .pincode.text.length !=
                                          6) {
                                        return 'Enter a valid 6 digit pincode';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    controller: controller.pincode,
                                    // for spacing between icon and text
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(20),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Obx(
                                () => addressController.isProcess.value
                                    ? CustomCircularIndicator(
                                        color: AppColor.primary)
                                    : GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          var key =
                                              controller.formKey.currentState;
                                          if (key!.validate()) {
                                            controller.isProcess.value = true;
                                            if (addressController
                                                .updateID.isEmpty) {
                                              addAddress(
                                                address:
                                                    controller.address.text,
                                                city: controller.city.text,
                                                state: controller.state.text,
                                                pincode:
                                                    controller.pincode.text,
                                                email: controller.email.text,
                                                phone: controller.phone.text,
                                                userName: controller.name.text,
                                                userId: UserDataStorageServices
                                                    .readData(
                                                  key: UserStorageDataKeys.uId,
                                                ),
                                                onDone: () {
                                                  controller.isProcess.value =
                                                      false;
                                                  controller
                                                      .update(['isProcess']);
                                                },
                                              );
                                            } else {
                                              updateAddress(
                                                address:
                                                    controller.address.text,
                                                city: controller.city.text,
                                                state: controller.state.text,
                                                pincode:
                                                    controller.pincode.text,
                                                email: controller.email.text,
                                                phone: controller.phone.text,
                                                userName: controller.name.text,
                                                addressId:
                                                    addressController.updateID,
                                                onDone: () {
                                                  controller.isProcess.value =
                                                      false;
                                                  controller
                                                      .update(['isProcess']);
                                                },
                                              );
                                            }
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: wid,
                                          decoration: BoxDecoration(
                                            color: AppColor.primary,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            addressController.updateID.isEmpty
                                                ? 'Save Address'
                                                : 'Update Address',
                                            style: TextStyle(
                                                color: AppColor.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
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
          ],
        ),
      ),
    );
  }
}

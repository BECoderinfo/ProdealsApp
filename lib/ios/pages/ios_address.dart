import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';
import '../../widget/ios_button.dart';

class ios_address extends GetView<BusinessAddressScreenController> {
  ios_address({super.key});

  final BusinessAddressScreenController bAddressController =
      Get.put(BusinessAddressScreenController());

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: Container(
        height: hit,
        width: wid,
        color: AppColor.primary,
        child: Stack(
          children: [
            Column(
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
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                          const Gap(60),
                          Text(
                            'Create Business',
                            style: GoogleFonts.inter(
                              color: Colors.black,
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
                    height: hit / 1.25,
                    width: wid,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(120),
                      ),
                    ),
                    child: Form(
                      key: bAddressController.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Gap(hit / 15),
                            Text(
                              "Address",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            const Gap(30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        color: Colors.grey.withOpacity(0.4),
                                        offset: const Offset(0, 0)),
                                  ],
                                  color: Colors.white.withOpacity(1),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: CupertinoTextFormFieldRow(
                                  placeholder: 'Address',
                                  placeholderStyle: const TextStyle(
                                      color: CupertinoColors.systemGrey,
                                      fontSize: 16),
                                  decoration: const BoxDecoration(),
                                  style: TextStyle(color: AppColor.black),
                                  controller:
                                      bAddressController.addressController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter address';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Obx(
                                () => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    bAddressController.isCityLoaded.value
                                        ? bAddressController.cityList.isNotEmpty
                                            ? Material(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          blurRadius: 3,
                                                          color: Colors.grey
                                                              .withOpacity(0.4),
                                                          offset: const Offset(
                                                              0, 0)),
                                                    ],
                                                    color: Colors.white
                                                        .withOpacity(1),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(width: 10),
                                                      Expanded(
                                                        child: DropdownButton<
                                                            String>(
                                                          value:
                                                              bAddressController
                                                                  .selectedValue
                                                                  .value,
                                                          isExpanded: true,
                                                          hint: Text(
                                                            'City',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF414143),
                                                            ),
                                                          ),
                                                          items: bAddressController
                                                              .cityList
                                                              .map<
                                                                  DropdownMenuItem<
                                                                      String>>((String
                                                                  value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child: Text(
                                                                value,
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            );
                                                          }).toList(),
                                                          onChanged: (String?
                                                              newValue) {
                                                            bAddressController
                                                                .selectedValue
                                                                .value = newValue;
                                                          },
                                                          underline: SizedBox(),
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF414143),
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Gap(0)
                                        : CustomCircularIndicator(
                                            color: AppColor.primary),
                                  ],
                                ),
                              ),
                            ),
                            Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        color: Colors.grey.withOpacity(0.4),
                                        offset: const Offset(0, 0)),
                                  ],
                                  color: Colors.white.withOpacity(1),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: CupertinoTextFormFieldRow(
                                  placeholder: 'State',
                                  style: TextStyle(color: AppColor.black),
                                  placeholderStyle: const TextStyle(
                                      color: CupertinoColors.systemGrey,
                                      fontSize: 16),
                                  decoration: const BoxDecoration(),
                                  controller:
                                      bAddressController.stateController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter state';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        color: Colors.grey.withOpacity(0.4),
                                        offset: const Offset(0, 0)),
                                  ],
                                  color: Colors.white.withOpacity(1),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: CupertinoTextFormFieldRow(
                                  placeholder: 'Pin code',
                                  style: TextStyle(color: AppColor.black),
                                  placeholderStyle: const TextStyle(
                                      color: CupertinoColors.systemGrey,
                                      fontSize: 16),
                                  decoration: const BoxDecoration(),
                                  keyboardType: TextInputType.number,
                                  controller:
                                      bAddressController.pincodeController,
                                  onFieldSubmitted: (p0) {
                                    FocusScope.of(context).unfocus();
                                    bAddressController.checkValidation();
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter your area pincode';
                                    } else if (value.length != 6) {
                                      return 'Enter a valid 6 digit pincode';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const Gap(20),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: ios_button(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  bAddressController.checkValidation();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

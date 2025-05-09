import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';
import '../../controller/business/business_profession_profile_controller.dart';
import '../../widget/ios_button.dart';

class ios_businessProfile extends GetView<BusinessProfessionProfileController> {
  const ios_businessProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final BusinessProfessionProfileController profileController =
        Get.put(BusinessProfessionProfileController());
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
                      // key: ,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Gap(hit / 15),
                            Text(
                              "Business / Profession Profile",
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
                                  placeholder: 'Area In square Feet',
                                  placeholderStyle: const TextStyle(
                                      color: CupertinoColors.systemGrey,
                                      fontSize: 16),
                                  decoration: const BoxDecoration(),
                                  controller: profileController.areaController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter area SQFT";
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
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color:
                                                  Colors.grey.withOpacity(0.4),
                                              offset: const Offset(0, 0),
                                            ),
                                          ],
                                          color: Colors.white.withOpacity(1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          child: CupertinoTextFormFieldRow(
                                            placeholder: 'Open Time',
                                            placeholderStyle: const TextStyle(
                                              color: CupertinoColors.systemGrey,
                                              fontSize: 16,
                                            ),
                                            decoration: const BoxDecoration(),
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              profileController
                                                  .selectTime(context)
                                                  .then(
                                                (value) {
                                                  if (value != null) {
                                                    profileController
                                                        .openingController
                                                        .text = value;
                                                  }
                                                },
                                              );
                                            },
                                            controller: profileController
                                                .openingController,
                                            readOnly: true,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "Enter open time";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color:
                                                  Colors.grey.withOpacity(0.4),
                                              offset: const Offset(0, 0),
                                            ),
                                          ],
                                          color: Colors.white.withOpacity(1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          child: CupertinoTextFormFieldRow(
                                            placeholder: 'Close Time',
                                            placeholderStyle: const TextStyle(
                                              color: CupertinoColors.systemGrey,
                                              fontSize: 16,
                                            ),
                                            decoration: const BoxDecoration(),
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              profileController
                                                  .selectTime(context)
                                                  .then(
                                                (value) {
                                                  if (value != null) {
                                                    profileController
                                                        .closetimeController
                                                        .text = value;
                                                  }
                                                },
                                              );
                                            },
                                            controller: profileController
                                                .closetimeController,
                                            readOnly: true,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "Enter close time";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Material(
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
                                    child: DropdownButton<String>(
                                      alignment: Alignment.centerLeft,
                                      value: profileController.dayValue.value,
                                      hint: Text("Please select close day"),
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      isExpanded: true,
                                      underline: SizedBox(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      onChanged: (newValue) {
                                        profileController.dayValue.value =
                                            newValue;
                                      },
                                      items: profileController.day
                                          .map((valueItem) {
                                        return DropdownMenuItem<String>(
                                          value: valueItem,
                                          child: Text(valueItem),
                                        );
                                      }).toList(),
                                    )),
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
                                  maxLines: 5,
                                  placeholder: 'Description (0/500)',
                                  placeholderStyle: const TextStyle(
                                      color: CupertinoColors.systemGrey,
                                      fontSize: 16),
                                  decoration: const BoxDecoration(),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter description";
                                    } else if (value.length < 100) {
                                      return "Description is too short";
                                    } else if (value.length > 500) {
                                      return "Description is too long";
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).unfocus();
                                    profileController.checkValidation();
                                  },
                                  controller:
                                      profileController.descriptionController,
                                ),
                              ),
                            ),
                            const Gap(30),
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
                  profileController.checkValidation();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

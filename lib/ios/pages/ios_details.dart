import 'package:pro_deals1/imports.dart';
import 'package:flutter/cupertino.dart';
import '../../widget/ios_button.dart';

class ios_detail extends GetView<BusinessProfessionDetailController> {
  ios_detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BusinessProfessionDetailController bProfessionController =
        Get.put(BusinessProfessionDetailController());
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
                      key: bProfessionController.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Gap(hit / 15),
                            Text(
                              "Business / Profession Details",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            Gap(hit / 15),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Obx(
                                () => bProfessionController
                                        .isCategoryLoaded.value
                                    ? bProfessionController.categoryList.isEmpty
                                        ? Gap(0)
                                        : Material(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 3,
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    offset: const Offset(0, 0),
                                                  ),
                                                ],
                                                color:
                                                    Colors.white.withOpacity(1),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4),
                                              child: DropdownButton<String>(
                                                value: bProfessionController
                                                    .selectedValue.value,
                                                isExpanded: true,
                                                hint: Text(
                                                  "Select category type",
                                                  style: TextStyle(
                                                    color: Color(0xFF414143),
                                                  ),
                                                ),
                                                items: bProfessionController
                                                    .categoryList
                                                    .map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  bProfessionController
                                                      .selectedValue
                                                      .value = newValue;
                                                },
                                                underline: SizedBox(),
                                                style: TextStyle(
                                                  color: Color(0xFF414143),
                                                  fontSize: 16,
                                                ),
                                              ),

                                              // child: DropdownButton<String>(
                                              //   value:
                                              //       bProfessionController.selectedValue.value ??
                                              //           "Select category type",
                                              //   icon: const Icon(Icons.keyboard_arrow_down),
                                              //   isExpanded: true,
                                              //   underline: const SizedBox(),
                                              //   style: const TextStyle(
                                              //       color: Colors.black, fontSize: 18),
                                              //   onChanged: (newValue) {
                                              //     bProfessionController.selectedValue.value =
                                              //         newValue;
                                              //   },
                                              //   items: bProfessionController.categoryList
                                              //       .map((valueItem) {
                                              //     return DropdownMenuItem<String>(
                                              //       value: valueItem,
                                              //       child: Text(valueItem),
                                              //     );
                                              //   }).toList(),
                                              // ),
                                            ),
                                          )
                                    : CustomCircularIndicator(
                                        color: AppColor.primary),
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
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                  color: Colors.white.withOpacity(1),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: CupertinoTextFormFieldRow(
                                  placeholder: 'GST Number',
                                  placeholderStyle: const TextStyle(
                                    color: CupertinoColors.systemGrey,
                                    fontSize: 16,
                                  ),
                                  controller:
                                      bProfessionController.GSTController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter GST number";
                                    } else if (!value.isValidGSTNo()) {
                                      return "Enter valid GST number";
                                    }
                                    return null;
                                  },
                                  decoration: const BoxDecoration(),
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
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                  color: Colors.white.withOpacity(1),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: CupertinoTextFormFieldRow(
                                  placeholder: 'PAN Number',
                                  placeholderStyle: const TextStyle(
                                    color: CupertinoColors.systemGrey,
                                    fontSize: 16,
                                  ),
                                  decoration: const BoxDecoration(),
                                  controller:
                                      bProfessionController.panController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter pan number";
                                    } else if (!value.isValidPanCardNo()) {
                                      return "Enter valid pan number";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Gap(20),
                            const Padding(
                              padding: EdgeInsets.only(right: 140),
                              child: Text(
                                'Business / Profession Proof',
                                style: TextStyle(
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Gap(20),
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  bProfessionController.imagePicker(context);
                                },
                                child: Container(
                                  height: 150,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    children: [
                                      if (bProfessionController
                                              .imageFile.value !=
                                          null)
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.file(
                                            bProfessionController
                                                .imageFile.value!,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                      if (bProfessionController
                                              .imageFile.value ==
                                          null)
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Center(
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Image.asset(
                                                "assets/images/Group 3747.png",
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Gap(20),
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
                  bProfessionController.checkValidation();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

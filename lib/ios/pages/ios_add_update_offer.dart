import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class iosAddUpdateOfferScreen extends GetView<AddUpdateOfferController> {
  const iosAddUpdateOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    return GetBuilder<AddUpdateOfferController>(
      init: AddUpdateOfferController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Obx(
              () => Text(
                "${controller.isEdit.value ? 'Update' : 'Add'} offer",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            backgroundColor: Colors.grey.shade50,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: GestureDetector(
              onTap: () {
                var key = controller.formKey.currentState;
                if (key?.validate() ?? false) {
                  controller.checkValidation();
                }
              },
              child: Container(
                height: 50,
                width: wid,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  !controller.isEdit.value ? 'Save offer' : 'Update offer',
                  style: TextStyle(color: AppColor.white, fontSize: 18),
                ),
              ),
            ),
          ),
          body: CupertinoPageScaffold(
            child: Container(
              color: AppColor.white,
              padding: EdgeInsets.all(16),
              child: Form(
                child: ListView(
                  children: [
                    Text(
                      "Offer description",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black300.withOpacity(0.7),
                      ),
                    ),
                    const Gap(5),
                    Container(
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
                          placeholder: "Offer description",
                          placeholderStyle: GoogleFonts.poppins(
                            color: AppColor.black300,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter offer description';
                            }
                            return null;
                          },
                          controller: controller.descriptionController,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                        ),
                      ),
                    ),
                    const Gap(15),
                    Text(
                      "Offer type",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black300.withOpacity(0.7),
                      ),
                    ),
                    const Gap(5),
                    Container(
                      padding: EdgeInsets.only(right: 10, left: 30),
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
                        () => DropdownButton<String>(
                          value: controller.selectedOfferType.value,
                          isExpanded: true,
                          hint: Text(
                            'Please select offer type',
                            style: TextStyle(
                              color: Color(0xFF414143),
                            ),
                          ),
                          items: controller.typeList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            controller.selectedOfferType.value = newValue;
                            controller.selectedOfferTypeError.value = "";
                          },
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Color(0xFF414143),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => controller.selectedOfferTypeError.value.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                controller.selectedOfferTypeError.value,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          : Gap(0),
                    ),
                    const Gap(15),
                    Text(
                      "Product price",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black300.withOpacity(0.7),
                      ),
                    ),
                    const Gap(5),
                    Container(
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
                          placeholder: "Product price",
                          placeholderStyle: GoogleFonts.poppins(
                            color: AppColor.black300,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter product price';
                            } else if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(
                                controller.productPriceController.text)) {
                              return 'Enter valid product price';
                            }
                            return null;
                          },
                          controller: controller.productPriceController,
                          // for spacing between icon and text
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                        ),
                      ),
                    ),
                    const Gap(15),
                    Text(
                      "Discount value",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black300.withOpacity(0.7),
                      ),
                    ),
                    const Gap(5),
                    Container(
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
                          placeholder: "Discount value",
                          placeholderStyle: GoogleFonts.poppins(
                            color: AppColor.black300,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter discount value';
                            } else if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(
                                controller.discountValueController.text)) {
                              return 'Enter valid discount value';
                            } else if (controller.selectedOfferType.value ==
                                    controller.typeList.first &&
                                ((int.tryParse(controller
                                            .discountValueController.text) ??
                                        double.parse(controller
                                            .discountValueController.text)) >
                                    (int.tryParse(controller
                                            .productPriceController.text) ??
                                        double.parse(
                                            controller.productPriceController.text)))) {
                              controller.discountValueController.clear();
                              return 'Invalid discount value';
                            }
                            return null;
                          },
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          controller: controller.discountValueController,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                        ),
                      ),
                    ),
                    const Gap(15),
                    Text(
                      "Valid days",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black300.withOpacity(0.7),
                      ),
                    ),
                    const Gap(5),
                    Container(
                      padding: EdgeInsets.only(right: 10, left: 30),
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
                        () => DropdownButton<String>(
                          value: controller.selectedValidDays.value,
                          isExpanded: true,
                          hint: Text(
                            'Please select valid days',
                            style: TextStyle(
                              color: Color(0xFF414143),
                            ),
                          ),
                          items: controller.validDays
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            controller.selectedValidDays.value = newValue;
                            controller.selectedValidDaysError.value = "";
                          },
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Color(0xFF414143),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => controller.selectedValidDaysError.value.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                controller.selectedValidDaysError.value,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          : Gap(0),
                    ),
                    Obx(
                      () => controller.selectedValidDays.value ==
                              controller.validDays.last
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Gap(15),
                                    Text(
                                      "Offer start day",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Gap(5),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                      child: Obx(
                                        () => DropdownButton<String>(
                                          value: controller.selectedDays1.value,
                                          isExpanded: true,
                                          hint: Text(
                                            'Offer start day',
                                            style: TextStyle(
                                              color: Color(0xFF414143),
                                            ),
                                          ),
                                          items: controller.daysList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            controller.selectedDays1.value =
                                                newValue;
                                            controller.checkAndSwapValues();
                                            controller
                                                .selectedDays1Error.value = "";
                                          },
                                          underline: SizedBox(),
                                          style: TextStyle(
                                            color: Color(0xFF414143),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () => controller.selectedDays1Error.value
                                              .isNotEmpty
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                controller
                                                    .selectedDays1Error.value,
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            )
                                          : Gap(0),
                                    ),
                                  ],
                                )),
                                Gap(15),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Gap(15),
                                    Text(
                                      "Offer end day",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Gap(5),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                      child: Obx(
                                        () => DropdownButton<String>(
                                          value: controller.selectedDays2.value,
                                          isExpanded: true,
                                          hint: Text(
                                            'Offer end day',
                                            style: TextStyle(
                                              color: Color(0xFF414143),
                                            ),
                                          ),
                                          items: controller.daysList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            controller.selectedDays2.value =
                                                newValue;
                                            controller.checkAndSwapValues();
                                            controller
                                                .selectedDays2Error.value = "";
                                          },
                                          underline: SizedBox(),
                                          style: TextStyle(
                                            color: Color(0xFF414143),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () => controller.selectedDays2Error.value
                                              .isNotEmpty
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                controller
                                                    .selectedDays2Error.value,
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            )
                                          : Gap(0),
                                    ),
                                  ],
                                ))
                              ],
                            )
                          : Gap(0),
                    ),
                    const Gap(15),
                    Text(
                      "Offer expiry date",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black300.withOpacity(0.7),
                      ),
                    ),
                    const Gap(5),
                    Container(
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
                          placeholder: "Product price",
                          placeholderStyle: GoogleFonts.poppins(
                            color: AppColor.black300,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select offer expiry date';
                            }
                            return null;
                          },
                          controller: controller.expiryDateController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? d = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              currentDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            );

                            if (d != null) {
                              controller.expiryDateController.text =
                                  d.toString().substring(0, 10);
                            }
                          },
                          // for spacing between icon and text
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                        ),
                      ),
                    ),
                  ],
                ),
                key: controller.formKey,
              ),
            ),
          ),
        );
      },
    );
  }
}

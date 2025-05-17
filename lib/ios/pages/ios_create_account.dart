import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';
import '../../widget/ios_button.dart';

class ios_create_account extends GetView<CreateBusinessScreenController> {
  ios_create_account({super.key});

  final CreateBusinessScreenController bController =
      Get.put(CreateBusinessScreenController());

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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Gap(25),
                          SizedBox(
                            height: 110,
                            width: 110,
                            child: Stack(
                              children: [
                                Center(
                                  child: Obx(
                                    () => bController.selectedImage.value ==
                                            null
                                        ? CircleAvatar(
                                            radius: 50,
                                            child: Icon(
                                              Icons.person_rounded,
                                              size: 35,
                                            ),
                                          )
                                        : CircleAvatar(
                                            radius: 50,
                                            backgroundImage: FileImage(
                                              bController.selectedImage.value!,
                                            ),
                                          ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 6,
                                  right: 6,
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: AppColor.white,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: 28,
                                      width: 28,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                          bController.imagepicker(context);
                                        },
                                        fillColor: AppColor.black300,
                                        shape: const CircleBorder(),
                                        child: const Icon(
                                          Icons.edit,
                                          size: 14, // smaller icon
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.zero,
                                        // remove padding for a tighter fit
                                        elevation: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(20),
                          Text(
                            "Business Information",
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          const Gap(30),
                          Form(
                            key: bController.formKey,
                            child: Column(
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
                                            color: Colors.grey.withOpacity(0.4),
                                            offset: const Offset(0, 0)),
                                      ],
                                      color: Colors.white.withOpacity(1),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: CupertinoTextFormFieldRow(
                                      placeholder: 'business Name',
                                      placeholderStyle: const TextStyle(
                                          color: CupertinoColors.systemGrey,
                                          fontSize: 16),
                                      decoration: const BoxDecoration(),
                                      style: TextStyle(color: AppColor.black),
                                      controller: bController.nameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter business name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                const Gap(30),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0),
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
                                      placeholder: 'Phone Number',
                                      placeholderStyle: const TextStyle(
                                          color: CupertinoColors.systemGrey,
                                          fontSize: 16),
                                      decoration: const BoxDecoration(),
                                      style: TextStyle(color: AppColor.black),
                                      keyboardType: TextInputType.number,
                                      controller: bController.numberController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter number';
                                        } else if (value.length != 10) {
                                          return 'Enter a valid number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                const Gap(15),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: Obx(
                () => bController.isProcess.value
                    ? CustomCircularIndicator(color: AppColor.primary)
                    : ios_button(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          bController.checkValidation();
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

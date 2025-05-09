import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class ios_edit_profile extends GetView<EditProfileController> {
  const ios_edit_profile({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return GetBuilder<EditProfileController>(
        init: EditProfileController(),
        builder: (editProfileController) {
          return CupertinoPageScaffold(
            backgroundColor: AppColor.white,
            child: Container(
              height: hit,
              width: wid,
              child: Stack(
                children: [
                  Positioned(
                    top: 220,
                    left: -48,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170,
                    left: -50,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 250,
                    left: -36,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        // color: Colors.deepOrange,
                        shape: BoxShape.circle,
                        border: Border.all(width: 2),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: -66,
                    child: Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        // color: Colors.deepOrange,
                        shape: BoxShape.circle,
                        border: Border.all(width: 2),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 190,
                    right: -70,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    right: -48,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    right: -70,
                    child: Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        // color: Colors.deepOrange,
                        shape: BoxShape.circle,
                        border: Border.all(width: 2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
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
                                  'Profile',
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
                          Obx(
                            () => SizedBox(
                              height: 140,
                              width: 140,
                              child: Stack(
                                children: [
                                  Center(
                                    child: CircleAvatar(
                                        radius: 70,
                                        child: editProfileController
                                                    .imageFile.value !=
                                                null
                                            ? CircleAvatar(
                                                radius: 70,
                                                backgroundImage: FileImage(
                                                  File(editProfileController
                                                      .imageFile.value!.path),
                                                ),
                                              )
                                            : !UserDataStorageServices
                                                    .checkIfExist(
                                                        key: UserStorageDataKeys
                                                            .imageData)
                                                ? UserDataStorageServices
                                                        .checkIfExist(
                                                            key:
                                                                UserStorageDataKeys
                                                                    .imageUrl)
                                                    ? CircleAvatar(
                                                        radius: 70,
                                                        backgroundImage:
                                                            NetworkImage(
                                                          UserDataStorageServices
                                                              .readData(
                                                            key:
                                                                UserStorageDataKeys
                                                                    .imageUrl,
                                                          ),
                                                        ),
                                                      )
                                                    : Icon(Icons.person,
                                                        size: 70)
                                                : CircleAvatar(
                                                    radius: 70,
                                                    backgroundImage: MemoryImage(
                                                        (Uint8List.fromList(UserDataStorageServices
                                                                .readData(
                                                                    key: UserStorageDataKeys
                                                                        .imageData)
                                                            .where((element) =>
                                                                element
                                                                    is int ||
                                                                element
                                                                    is String ||
                                                                element
                                                                    is double) // Filter
                                                            .map<int>(
                                                                (element) {
                                                      if (element is String) {
                                                        return int.tryParse(
                                                                element) ??
                                                            0; // Convert string to int safely
                                                      } else if (element
                                                          is double) {
                                                        return element
                                                            .toInt(); // Convert double to int
                                                      }
                                                      return element
                                                          as int; // Directly cast int
                                                    }).toList()))),
                                                  )),
                                  ),
                                  Positioned(
                                    bottom: -3,
                                    right: -3,
                                    child: Container(
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        color: AppColor.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        onPressed:
                                            editProfileController.pickImage,
                                        icon: Icon(
                                          Icons.edit,
                                          color: AppColor.white,
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  AppColor.gray),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(10),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${editProfileController.nameController.text}',
                              style: GoogleFonts.openSans(
                                color: AppColor.black300,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Gap(50),
                          Form(
                            key: editProfileController.formKey,
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
                                        color:
                                            AppColor.black300.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 3,
                                              color: AppColor.gray
                                                  .withOpacity(0.4),
                                              offset: const Offset(0, 0)),
                                        ],
                                        color: AppColor.white.withOpacity(1),
                                      ),
                                      child: CupertinoFormRow(
                                        child: CupertinoTextFormFieldRow(
                                          style: GoogleFonts.poppins(
                                            color: AppColor.black300,
                                          ),
                                          placeholderStyle: GoogleFonts.poppins(
                                            color: AppColor.black300,
                                          ),
                                          controller: editProfileController
                                              .nameController,
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
                                        color:
                                            AppColor.black300.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 3,
                                              color: AppColor.gray
                                                  .withOpacity(0.4),
                                              offset: const Offset(0, 0)),
                                        ],
                                        color: AppColor.white.withOpacity(1),
                                      ),
                                      child: CupertinoFormRow(
                                        // prefix: SvgPicture.asset(
                                        //     'assets/icons/call_circle.svg'),
                                        child: CupertinoTextFormFieldRow(
                                          style: GoogleFonts.poppins(
                                            color: AppColor.black300,
                                          ),
                                          placeholder: '334 455 343',
                                          placeholderStyle: GoogleFonts.poppins(
                                            color: AppColor.black300,
                                          ),
                                          validator: (num) {
                                            if (editProfileController
                                                .phoneController.text.isEmpty) {
                                              return 'Enter number';
                                            } else if (editProfileController
                                                    .phoneController
                                                    .text
                                                    .length !=
                                                10) {
                                              return 'Enter a valid number';
                                            }
                                            return null;
                                          },
                                          controller: editProfileController
                                              .phoneController,
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
                                        color:
                                            AppColor.black300.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 3,
                                              color: AppColor.gray
                                                  .withOpacity(0.4),
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
                                          placeholder: 'johnlawis23@gmai.com',
                                          placeholderStyle: GoogleFonts.poppins(
                                            color: AppColor.black300,
                                          ),
                                          validator: (num) {
                                            if (editProfileController
                                                .emailController.text.isEmpty) {
                                              return 'Enter Email';
                                            } else if (!GetUtils.isEmail(
                                                editProfileController
                                                    .emailController.text)) {
                                              return 'Enter a valid email address';
                                            }
                                            return null;
                                          },
                                          controller: editProfileController
                                              .emailController,
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
                                        color:
                                            AppColor.black300.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 3,
                                              color: AppColor.gray
                                                  .withOpacity(0.4),
                                              offset: const Offset(0, 0)),
                                        ],
                                        color: AppColor.white.withOpacity(1),
                                      ),
                                      child: Obx(() => editProfileController
                                              .isAddressLoaded.value
                                          ? editProfileController
                                                  .isAddressFound.value
                                              ? Row(
                                                  children: [
                                                    Icon(Icons.location_on),
                                                    // Prefix icon
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child: Material(
                                                        child: DropdownButton<
                                                            String>(
                                                          value:
                                                              editProfileController
                                                                  .selectedValue
                                                                  .value,
                                                          isExpanded: true,
                                                          hint: Text(
                                                            'Please select address',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF414143),
                                                            ),
                                                          ),
                                                          items: editProfileController
                                                              .addressList
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
                                                            editProfileController
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
                                                    ),
                                                  ],
                                                )
                                              : GestureDetector(
                                                  onTap: () async {
                                                    await Get.toNamed(
                                                            '/${!Platform.isIOS ? 'ios_add_address' : 'AddAddress'}')
                                                        ?.then(
                                                      (value) {
                                                        if (value ?? false) {
                                                          editProfileController
                                                              .fetchAddress();
                                                        }
                                                      },
                                                    );
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.location_on),
                                                      // Prefix icon
                                                      SizedBox(width: 10),
                                                      Text(
                                                        'Please add Address',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF414143),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                          : CustomCircularIndicator(
                                              color: AppColor.primary)),
                                    ),
                                  ),
                                  const Gap(20),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Obx(
                                      () => editProfileController
                                              .isProcess.value
                                          ? CustomCircularIndicator(
                                              color: AppColor.primary)
                                          : GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                // editProfileController.isProcess.value = false;
                                                // return;
                                                var key = editProfileController
                                                    .formKey.currentState;
                                                if (key!.validate()) {
                                                  if (editProfileController
                                                          .selectedValue
                                                          .value ==
                                                      null) {
                                                    ShowToast.toast(
                                                        msg:
                                                            "Please select address");
                                                  } else if (editProfileController
                                                      .checkImageStatus()) {
                                                    ShowToast.toast(
                                                        msg:
                                                            "Please select image");
                                                  } else {
                                                    editProfileController
                                                        .isProcess.value = true;
                                                    editProfile(
                                                      imagePath:
                                                          editProfileController
                                                                  .imageFile
                                                                  .value
                                                                  ?.path ??
                                                              null,
                                                      name:
                                                          editProfileController
                                                              .nameController
                                                              .text,
                                                      number:
                                                          editProfileController
                                                              .phoneController
                                                              .text,
                                                      email:
                                                          editProfileController
                                                              .emailController
                                                              .text,
                                                      addressId: editProfileController
                                                              .addressModelList[editProfileController
                                                                  .addressModelList
                                                                  .indexWhere((e) =>
                                                                      "${e.address ?? ""}, ${e.city ?? ""}, ${e.state ?? ""}-${e.pincode ?? ""}" ==
                                                                      editProfileController
                                                                          .selectedValue
                                                                          .value)]
                                                              .sId ??
                                                          "",
                                                      onDone: () {
                                                        editProfileController
                                                            .isProcess
                                                            .value = false;
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
                                                child: Text('save'),
                                              ),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

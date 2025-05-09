import 'package:pro_deals1/imports.dart';

class EditBusinessProfile extends GetView<EditBusinessProfileController> {
  const EditBusinessProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditBusinessProfileController>(
      init: EditBusinessProfileController(),
      builder: (profileController) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Edit profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Obx(
              () => profileController.pageIndex.value == 3
                  ? IconButton(
                      onPressed: () {
                        profileController.deleteButtonShow.value =
                            !profileController.deleteButtonShow.value;
                      },
                      icon: Icon(Icons.delete),
                    )
                  : Gap(0),
            ),
            Gap(10),
          ],
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          backgroundColor: const Color(0xFFD6AA26),
        ),
        bottomNavigationBar: Obx(
          () => Padding(
            padding: controller.imageIdList.isEmpty
                ? EdgeInsets.zero
                : const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                controller.imageIdList.isEmpty
                    ? Gap(0)
                    : Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.imageIdList.clear();
                                profileController.deleteButtonShow.value =
                                    false;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 8),
                                alignment: Alignment.center,
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(16),
                          Expanded(
                            child: profileController.isProcess.value
                                ? CustomCircularIndicator(
                                    color: AppColor.primary,
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      profileController.isProcess.value = true;
                                      profileController.deleteMultipleImages();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.primary,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PageView(
            onPageChanged: (value) => profileController.pageIndex.value = value,
            physics: NeverScrollableScrollPhysics(),
            controller: profileController.p,
            children: [
              Column(
                children: [
                  Expanded(
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
                                    () => profileController.mainImage.value ==
                                            null
                                        ? CircleAvatar(
                                            radius: 50,
                                            child: ClipOval(
                                              child: Image.memory(
                                                Uint8List.fromList(
                                                  data!.mainImage!.data!.data!,
                                                ),
                                                fit: BoxFit.cover,
                                                key: ValueKey('memoryImage'),
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Icon(
                                                    Icons.person_rounded,
                                                    size: 35,
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                        : CircleAvatar(
                                            radius: 50,
                                            backgroundImage: FileImage(
                                              profileController
                                                  .mainImage.value!,
                                            ),
                                          ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -1,
                                  right: -1,
                                  child: Container(
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      color: AppColor.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        profileController.imagepicker(context);
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: AppColor.white,
                                        size: 20,
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColor.black300),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(20),
                          const Text(
                            'Personal Information',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Form(
                            key: profileController.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    'Full Name',
                                    style: TextStyle(color: AppColor.gray),
                                  ),
                                ),
                                const Gap(10),
                                My_TextFiled(
                                  onFieldSubmitted: (p0) {
                                    FocusScope.of(context).unfocus();
                                    profileController.checkValidation();
                                  },
                                  hintText: "Business name",
                                  controller: profileController.nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter business name';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    'Phone Number',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                const Gap(10),
                                My_TextFiled(
                                  hintText: "Mobile number",
                                  kType: TextInputType.number,
                                  controller: profileController.phoneController,
                                  readOnly: true,
                                  onTap: () {
                                    ShowToast.toast(
                                      msg:
                                          'You can\'t update your business mobile number',
                                    );
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter number';
                                    } else if (value.length != 10) {
                                      return 'Enter a valid number';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          profileController.checkValidation();
                        },
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Gap(25),
                          const Text(
                            'Personal Information',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Form(
                            key: profileController.formKey1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(25),
                                const Center(
                                  child: Text(
                                    "Address",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Gap(20),
                                Text(
                                  'Address',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const Gap(10),
                                My_TextFiled(
                                  controller:
                                      profileController.addressController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter address';
                                    }
                                    return null;
                                  },
                                  hintText: "Address",
                                ),
                                Obx(
                                  () => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      profileController.cityList.isEmpty
                                          ? const Gap(0)
                                          : const Gap(20),
                                      profileController.cityList.isEmpty
                                          ? const Gap(0)
                                          : Text(
                                              'City',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                      profileController.cityList.isEmpty
                                          ? const Gap(0)
                                          : const Gap(10),
                                      profileController.cityList.isNotEmpty
                                          ? Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 5,
                                                vertical: 3,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.location_on),
                                                  // Prefix icon
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child:
                                                        DropdownButton<String>(
                                                      value: profileController
                                                          .citySelected.value,
                                                      isExpanded: true,
                                                      hint: Text(
                                                        'Please select address',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF414143),
                                                        ),
                                                      ),
                                                      items: profileController
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
                                                      onChanged:
                                                          (String? newValue) {
                                                        profileController
                                                            .citySelected
                                                            .value = newValue;
                                                      },
                                                      underline: SizedBox(),
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF414143),
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Gap(0)
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'State',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const Gap(10),
                                My_TextFiled(
                                  hintText: "State",
                                  controller: profileController.stateController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter state';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'PinCode',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const Gap(10),
                                My_TextFiled(
                                  hintText: "Pin code",
                                  kType: TextInputType.number,
                                  controller:
                                      profileController.pincodeController,
                                  onFieldSubmitted: (p0) {
                                    FocusScope.of(context).unfocus();
                                    profileController.checkValidationAddress();
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          profileController.checkValidationAddress();
                        },
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: profileController.formKey2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(25),
                            const Center(
                              child: Text(
                                "Business / Profession Details",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Gap(20),
                            Text(
                              'Category',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const Gap(10),
                            Obx(
                              () => Container(
                                height: 60,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                alignment: Alignment.center,
                                child: DropdownButton<String>(
                                  value:
                                      profileController.categorySelected.value,
                                  isExpanded: true,
                                  hint: Text(
                                    "Select category type",
                                    style: TextStyle(
                                      color: Color(0xFF414143),
                                    ),
                                  ),
                                  items: profileController.categoryList
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
                                    profileController.categorySelected.value =
                                        newValue;
                                  },
                                  underline: SizedBox(),
                                  style: TextStyle(
                                    color: Color(0xFF414143),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const Gap(20),
                            Text(
                              'Area in square feet',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const Gap(10),
                            My_TextFiled(
                              controller: profileController.areaController,
                              hintText: "Area Ex: 200",
                              kType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter area SQFT";
                                }
                                return null;
                              },
                            ),
                            const Gap(20),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Opening Time',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const Gap(10),
                                      My_TextFiled(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          profileController
                                              .selectTime(context)
                                              .then(
                                            (value) {
                                              if (value != null) {
                                                profileController
                                                    .openTimeController
                                                    .text = value;
                                              }
                                            },
                                          );
                                        },
                                        controller: profileController
                                            .openTimeController,
                                        hintText: "00:00 AM",
                                        readOnly: true,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Enter open time";
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                ),
                                const Gap(20),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Closing Time',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const Gap(10),
                                      My_TextFiled(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          profileController
                                              .selectTime(context)
                                              .then(
                                            (value) {
                                              if (value != null) {
                                                profileController
                                                    .closeTimeController
                                                    .text = value;
                                              }
                                            },
                                          );
                                        },
                                        controller: profileController
                                            .closeTimeController,
                                        hintText: "00:00 AM",
                                        readOnly: true,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Enter close time";
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(20),
                            Text(
                              'Close Days',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const Gap(10),
                            Obx(
                              () => Container(
                                height: 60,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                alignment: Alignment.center,
                                child: DropdownButton<String>(
                                  alignment: Alignment.centerLeft,
                                  value:
                                      profileController.closeDaysSelected.value,
                                  hint: Text("Please select close day"),
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  onChanged: (newValue) {
                                    profileController.closeDaysSelected.value =
                                        newValue;
                                  },
                                  items: profileController.day.map((valueItem) {
                                    return DropdownMenuItem<String>(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            const Gap(15),
                            Text(
                              'Description',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const Gap(10),
                            TextFormField(
                              maxLines: 4,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter description";
                                } else if (value.length < 100) {
                                  return "Description is too short";
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).unfocus();
                                profileController
                                    .checkValidationProfessionalProfile();
                              },
                              controller:
                                  profileController.descriptionController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                hintText: "Description",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                        () => profileController.isProcess.value
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomCircularIndicator(
                                    color: AppColor.primary),
                              )
                            : MyButton(
                                btnName: "Save",
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  profileController.p.animateToPage(
                                    3,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.linear,
                                  );

                                  // profileController
                                  //     .checkValidationProfessionalProfile();
                                },
                              ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Gap(25),
                          const Center(
                            child: Text(
                              "Upload Store / Work Place Images",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          const Gap(40),
                          Wrap(
                            spacing: 10,
                            runSpacing: 40,
                            children: [
                              Obx(
                                () => profileController.ImagePickerContainer(
                                    i: 0),
                              ),
                              Obx(
                                () => profileController.ImagePickerContainer(
                                    i: 1),
                              ),
                              Obx(
                                () => profileController.ImagePickerContainer(
                                    i: 2),
                              ),
                              Obx(
                                () => profileController.ImagePickerContainer(
                                    i: 3),
                              ),
                              Obx(
                                () => profileController.ImagePickerContainer(
                                    i: 4),
                              ),
                              Obx(
                                () => profileController.ImagePickerContainer(
                                    i: 5),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                        () => profileController.isProcess.value
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomCircularIndicator(
                                    color: AppColor.primary),
                              )
                            : !(profileController.isButtonShow.value ||
                                    profileController.mainImage.value != null)
                                ? Gap(0)
                                : GestureDetector(
                                    onTap: () {
                                      profileController.isProcess.value = true;
                                      profileController.updateBusinessImages();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD6AA26),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        "Upload image",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

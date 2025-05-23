import 'package:pro_deals1/imports.dart';

class EditProfile extends GetView<EditProfileController> {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;

    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
      builder: (editProfileController) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            backgroundColor: AppColor.primary,
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: editProfileController.formKey,
                child: Column(
                  children: [
                    const Gap(20),
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
                                      : !UserDataStorageServices.checkIfExist(
                                              key:
                                                  UserStorageDataKeys.imageData)
                                          ? UserDataStorageServices
                                                  .checkIfExist(
                                                      key: UserStorageDataKeys
                                                          .imageUrl)
                                              ? CircleAvatar(
                                                  radius: 70,
                                                  backgroundImage: NetworkImage(
                                                    UserDataStorageServices
                                                        .readData(
                                                      key: UserStorageDataKeys
                                                          .imageUrl,
                                                    ),
                                                  ),
                                                )
                                              : Icon(Icons.person, size: 70)
                                          : CircleAvatar(
                                              radius: 70,
                                              backgroundImage: MemoryImage((Uint8List
                                                  .fromList(UserDataStorageServices
                                                          .readData(
                                                              key: UserStorageDataKeys
                                                                  .imageData)
                                                      .where((element) =>
                                                          element is int ||
                                                          element is String ||
                                                          element
                                                              is double) // Filter
                                                      .map<int>((element) {
                                                if (element is String) {
                                                  return int.tryParse(
                                                          element) ??
                                                      0; // Convert string to int safely
                                                } else if (element is double) {
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
                                  onPressed: editProfileController.pickImage,
                                  icon: Icon(
                                    Icons.edit,
                                    color: AppColor.white,
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColor.gray),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(20),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${editProfileController.nameController.text}',
                        style: GoogleFonts.openSans(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Gap(30),
                    SizedBox(
                      height: 60,
                      child: TextFormField(
                        controller: editProfileController.nameController,
                        validator: (username) {
                          if (editProfileController
                              .nameController.text.isEmpty) {
                            return 'Enter username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter your Name',
                          prefixIcon: Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.grey[100],
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const Gap(20),
                    SizedBox(
                      height: 60,
                      child: TextFormField(
                        controller: editProfileController.phoneController,
                        validator: (num) {
                          if (editProfileController
                              .phoneController.text.isEmpty) {
                            return 'Enter number';
                          } else if (editProfileController
                                  .phoneController.text.length !=
                              10) {
                            return 'Enter a valid number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          hintText: 'Enter your Phone Number',
                          prefixIcon: Icon(Icons.call),
                          filled: true,
                          fillColor: Colors.grey[100],
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const Gap(20),
                    SizedBox(
                      height: 60,
                      child: TextFormField(
                        controller: editProfileController.emailController,
                        validator: (num) {
                          if (editProfileController
                              .emailController.text.isEmpty) {
                            return 'Enter Email';
                          } else if (!GetUtils.isEmail(
                              editProfileController.emailController.text)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          hintText: 'Enter your Email',
                          prefixIcon: Icon(Icons.email),
                          filled: true,
                          fillColor: Colors.grey[100],
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const Gap(20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 60,
                      child: Obx(() => editProfileController
                              .isAddressLoaded.value
                          ? editProfileController.isAddressFound.value
                              ? Row(
                                  children: [
                                    Icon(Icons.location_on), // Prefix icon
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: DropdownButton<String>(
                                        value: editProfileController
                                            .selectedValue.value,
                                        isExpanded: true,
                                        hint: Text(
                                          'Please select address',
                                          style: TextStyle(
                                            color: Color(0xFF414143),
                                          ),
                                        ),
                                        items: editProfileController.addressList
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
                                          editProfileController
                                              .selectedValue.value = newValue;
                                        },
                                        underline: SizedBox(),
                                        style: TextStyle(
                                          color: Color(0xFF414143),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    await Get.toNamed('/AddAddress')?.then(
                                      (value) {
                                        if (value ?? false) {
                                          editProfileController.fetchAddress();
                                        }
                                      },
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on), // Prefix icon
                                      SizedBox(width: 10),
                                      Text(
                                        'Please add Address',
                                        style: TextStyle(
                                          color: Color(0xFF414143),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                          : CustomCircularIndicator(color: AppColor.primary)),
                    ),
                    const Gap(40),
                    Obx(
                      () => editProfileController.isProcess.value
                          ? CustomCircularIndicator(color: AppColor.primary)
                          : Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  // editProfileController.isProcess.value = false;
                                  // return;
                                  var key = editProfileController
                                      .formKey.currentState;
                                  if (key!.validate()) {
                                    if (editProfileController
                                            .selectedValue.value ==
                                        null) {
                                      ShowToast.toast(
                                          msg: "Please select address");
                                    } else if (editProfileController
                                        .checkImageStatus()) {
                                      ShowToast.toast(
                                          msg: "Please select image");
                                    } else {
                                      editProfileController.isProcess.value =
                                          true;
                                      editProfile(
                                        imagePath: editProfileController
                                                .imageFile.value?.path ??
                                            null,
                                        name: editProfileController
                                            .nameController.text,
                                        number: editProfileController
                                            .phoneController.text,
                                        email: editProfileController
                                            .emailController.text,
                                        addressId: editProfileController
                                                .addressModelList[
                                                    editProfileController
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
                                              .isProcess.value = false;
                                        },
                                      );
                                    }
                                  }
                                },
                                child: Text(
                                  'Update',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

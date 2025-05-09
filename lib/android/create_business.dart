import 'package:pro_deals1/imports.dart';

class create_business extends GetView<CreateBusinessScreenController> {
  create_business({super.key});

  final CreateBusinessScreenController bController =
      Get.put(CreateBusinessScreenController());

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Create Business",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: AppColor.primary,
        ),
        backgroundColor: const Color(0xfff9f9f9),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(30),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Obx(
                () => bController.isProcess.value
                    ? CustomCircularIndicator(color: AppColor.primary)
                    : MyButton(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          bController.checkValidation();
                        },
                      ),
              ),
              Gap(16)
            ]),
            Gap(MediaQuery.of(context).padding.bottom + 16),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: hit,
            width: wid,
            padding: EdgeInsets.all(16),
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
                          () => bController.selectedImage.value == null
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
                              bController.imagepicker(context);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: AppColor.white,
                              size: 20,
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColor.black300),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Form(
                  key: bController.formKey,
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
                        hintText: "Business name",
                        controller: bController.nameController,
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
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 20),
                      //   child: Text(
                      //     'Date of Birth',
                      //     style: TextStyle(color: Colors.grey),
                      //   ),
                      // ),
                      // const Gap(10),
                      // My_TextFiled(
                      //   controller: bController.bdateController,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Enter business name';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Phone Number',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const Gap(10),
                      My_TextFiled(
                        onFieldSubmitted: (p0) {
                          FocusScope.of(context).unfocus();
                          bController.checkValidation();
                        },
                        hintText: "Mobile number",
                        kType: TextInputType.number,
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
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 20),
                      //   child: Text(
                      //     'Email Address',
                      //     style: TextStyle(color: Colors.grey),
                      //   ),
                      // ),
                      // const Gap(10),
                      // My_TextFiled(
                      //   controller: bController.EmailController,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Enter Email';
                      //     } else if (!GetUtils.isEmail(value)) {
                      //       return 'Enter a valid email address';
                      //     }
                      //     return null;
                      //   },
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

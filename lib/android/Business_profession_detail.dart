import '../imports.dart';

class Profession_details extends GetView<BusinessProfessionDetailController> {
  const Profession_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BusinessProfessionDetailController bProfessionController =
        Get.put(BusinessProfessionDetailController());
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
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: const Color(0xFFD6AA26),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    bProfessionController.checkValidation();
                  },
                ),
                const Gap(16),
              ],
            ),
            const Gap(16),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: bProfessionController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(25),
                  const Center(
                    child: Text(
                      "Business / Profession Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Gap(20),
                  Text(
                    'Category',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(10),
                  Obx(
                    () => bProfessionController.isCategoryLoaded.value
                        ? bProfessionController.categoryList.isEmpty
                            ? Gap(0)
                            : Container(
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
                                      bProfessionController.selectedValue.value,
                                  isExpanded: true,
                                  hint: Text(
                                    "Select category type",
                                    style: TextStyle(
                                      color: Color(0xFF414143),
                                    ),
                                  ),
                                  items: bProfessionController.categoryList
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
                                    bProfessionController.selectedValue.value =
                                        newValue;
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
                              )
                        : CustomCircularIndicator(color: AppColor.primary),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'GST Number',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(10),
                  My_TextFiled(
                    controller: bProfessionController.GSTController,
                    hintText: "GST number",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter GST number";
                      } else if (!value.isValidGSTNo()) {
                        return "Enter valid GST number";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Pan Number',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(10),
                  My_TextFiled(
                    controller: bProfessionController.panController,
                    hintText: "Pan number",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter pan number";
                      } else if (!value.isValidPanCardNo()) {
                        return "Enter valid pan number";
                      }
                      return null;
                    },
                  ),
                  const Gap(20),
                  Text(
                    'Business / Profession Proof',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Gap(20),
                  Obx(
                    () => Center(
                      child: InkWell(
                        onTap: () {
                          bProfessionController.imagePicker(context);
                        },
                        child: Container(
                          height: 140,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                          child: Stack(
                            children: [
                              if (bProfessionController.imageFile.value != null)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    bProfessionController.imageFile.value!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              if (bProfessionController.imageFile.value == null)
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

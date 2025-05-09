import 'package:pro_deals1/controller/business/business_profession_profile_controller.dart';
import 'package:pro_deals1/imports.dart';

class Profession_Profile extends GetView<BusinessProfessionProfileController> {
  const Profession_Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final BusinessProfessionProfileController profileController =
        Get.put(BusinessProfessionProfileController());
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
                Obx(
                  () => profileController.isProcess.value
                      ? CustomCircularIndicator(color: AppColor.primary)
                      : MyButton(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            profileController.checkValidation();
                          },
                        ),
                ),
                Gap(16),
              ],
            ),
            const Gap(16),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: profileController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(25),
                  Center(
                    child: Text(
                      "Business / Profession Profile",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                                profileController.selectTime(context).then(
                                  (value) {
                                    if (value != null) {
                                      profileController.openingController.text =
                                          value;
                                    }
                                  },
                                );
                              },
                              controller: profileController.openingController,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                profileController.selectTime(context).then(
                                  (value) {
                                    if (value != null) {
                                      profileController
                                          .closetimeController.text = value;
                                    }
                                  },
                                );
                              },
                              controller: profileController.closetimeController,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: DropdownButton<String>(
                        alignment: Alignment.centerLeft,
                        value: profileController.dayValue.value,
                        hint: Text("Please select close day"),
                        icon: Icon(Icons.keyboard_arrow_down),
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        onChanged: (newValue) {
                          profileController.dayValue.value = newValue;
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
                      } else if (value.length > 500) {
                        return "Description is too long";
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).unfocus();
                      profileController.checkValidation();
                    },
                    controller: profileController.descriptionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      hintText: "Description",
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

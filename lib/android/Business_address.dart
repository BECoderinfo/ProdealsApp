import 'package:pro_deals1/imports.dart';

class B_Address extends GetView<BusinessAddressScreenController> {
  B_Address({Key? key}) : super(key: key);
  final BusinessAddressScreenController bAddressController =
      Get.put(BusinessAddressScreenController());

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
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: AppColor.primary,
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    bAddressController.checkValidation();
                  },
                ),
                Gap(16)
              ],
            ),
            Gap(MediaQuery.of(context).padding.bottom + 16),
          ],
        ),
        body: Container(
          height: hit,
          width: wid,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: bAddressController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(25),
                  const Center(
                    child: Text(
                      "Address",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    controller: bAddressController.addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter address';
                      }
                      return null;
                    },
                    hintText: "Address",
                  ),
                  const Gap(20),
                  Text(
                    'Landmark',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(10),
                  My_TextFiled(
                    controller: bAddressController.landmarkController,
                    validator: (value) {
                      return null;
                    },
                    hintText: "Landmark",
                  ),
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bAddressController.cityList.isEmpty
                            ? const Gap(0)
                            : const Gap(20),
                        bAddressController.cityList.isEmpty
                            ? const Gap(0)
                            : Text(
                                'City',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                        bAddressController.cityList.isEmpty
                            ? const Gap(0)
                            : const Gap(10),
                        bAddressController.isCityLoaded.value
                            ? bAddressController.cityList.isNotEmpty
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on), // Prefix icon
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: DropdownButton<String>(
                                            value: bAddressController
                                                .selectedValue.value,
                                            isExpanded: true,
                                            hint: Text(
                                              'Please select address',
                                              style: TextStyle(
                                                color: Color(0xFF414143),
                                              ),
                                            ),
                                            items: bAddressController.cityList
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
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
                                              bAddressController.selectedValue
                                                  .value = newValue;
                                            },
                                            underline: SizedBox(),
                                            style: TextStyle(
                                              color: Color(0xFF414143),
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Gap(0)
                            : CustomCircularIndicator(color: AppColor.primary),
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
                    controller: bAddressController.stateController,
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
                    controller: bAddressController.pincodeController,
                    onFieldSubmitted: (p0) {
                      FocusScope.of(context).unfocus();
                      bAddressController.checkValidation();
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
          ),
        ),
      ),
    );
  }
}

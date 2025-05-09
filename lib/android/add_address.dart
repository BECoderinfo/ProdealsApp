import 'package:pro_deals1/imports.dart';

class AddAddress extends GetView<AddAddressController> {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    final AddAddressController addressController =
        Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Address'),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              const Gap(10),
              TextFormField(
                controller: addressController.name,
                validator: (username) {
                  if (controller.name.text.isEmpty) {
                    return 'Enter username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your Name',
                  prefixIcon: const Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.grey[100],
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
              const Gap(20),
              TextFormField(
                controller: controller.phone,
                validator: (num) {
                  if (controller.phone.text.isEmpty) {
                    return 'Enter number';
                  } else if (controller.phone.text.length != 10) {
                    return 'Enter a valid number';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your Phone Number',
                  prefixIcon: const Icon(Icons.call),
                  filled: true,
                  fillColor: Colors.grey[100],
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const Gap(20),
              TextFormField(
                controller: controller.email,
                validator: (num) {
                  if (controller.email.text.isEmpty) {
                    return 'Enter email address';
                  } else if (!GetUtils.isEmail(controller.email.text)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  hintText: 'Enter your Email',
                  prefixIcon: const Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.grey[100],
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const Gap(20),
              TextFormField(
                controller: controller.address,
                validator: (num) {
                  if (controller.email.text.isEmpty) {
                    return 'Enter address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'Enter your Address',
                  prefixIcon: const Icon(Icons.location_on),
                  filled: true,
                  fillColor: Colors.grey[100],
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
              const Gap(20),
              TextFormField(
                controller: controller.city,
                validator: (num) {
                  if (controller.city.text.isEmpty) {
                    return 'Enter city';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'Enter your City',
                  prefixIcon: const Icon(Icons.location_city),
                  filled: true,
                  fillColor: Colors.grey[100],
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
              const Gap(20),
              TextFormField(
                controller: controller.state,
                validator: (num) {
                  if (controller.state.text.isEmpty) {
                    return 'Enter state';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'State',
                  hintText: 'Enter your State',
                  prefixIcon: const Icon(Icons.location_city),
                  filled: true,
                  fillColor: Colors.grey[100],
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
              const Gap(20),
              TextFormField(
                controller: controller.pincode,
                validator: (num) {
                  if (controller.pincode.text.isEmpty) {
                    return 'Enter your area pincode';
                  } else if (controller.pincode.text.length != 6) {
                    return 'Enter a valid 6 digit pincode';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Pin code',
                  hintText: 'Enter your area pincode',
                  prefixIcon: const Icon(Icons.location_city),
                  filled: true,
                  fillColor: Colors.grey[100],
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const Gap(60),
              Obx(
                () => addressController.isProcess.value
                    ? CustomCircularIndicator(color: AppColor.primary)
                    : GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          // controller.isProcess.value = false;
                          // return;
                          var key = controller.formKey.currentState;
                          if (key!.validate()) {
                            controller.isProcess.value = true;
                            if (addressController.updateID.isEmpty) {
                              addAddress(
                                address: controller.address.text,
                                city: controller.city.text,
                                state: controller.state.text,
                                pincode: controller.pincode.text,
                                email: controller.email.text,
                                phone: controller.phone.text,
                                userName: controller.name.text,
                                userId: UserDataStorageServices.readData(
                                  key: UserStorageDataKeys.uId,
                                ),
                                onDone: () {
                                  controller.isProcess.value = false;
                                  controller.update(['isProcess']);
                                },
                              );
                            } else {
                              updateAddress(
                                address: controller.address.text,
                                city: controller.city.text,
                                state: controller.state.text,
                                pincode: controller.pincode.text,
                                email: controller.email.text,
                                phone: controller.phone.text,
                                userName: controller.name.text,
                                addressId: addressController.updateID,
                                onDone: () {
                                  controller.isProcess.value = false;
                                  controller.update(['isProcess']);
                                },
                              );
                            }
                          }
                        },
                        child: Container(
                          height: 60,
                          width: wid,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            addressController.updateID.isEmpty
                                ? 'Save Address'
                                : 'Update Address',
                            style:
                                TextStyle(color: AppColor.white, fontSize: 18),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

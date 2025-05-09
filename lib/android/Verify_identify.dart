import 'package:pro_deals1/imports.dart';

class verify extends GetView<VerifyIdentityController> {
  const verify({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyIdentityController identityController =
        Get.put(VerifyIdentityController());
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
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
          const Gap(25),
          Obx(
            () => identityController.isProcess.value
                ? CustomCircularIndicator(color: AppColor.primary)
                : GestureDetector(
                    onTap: () {
                      if (identityController.govermentId.value == null ||
                          identityController.voterId.value == null) {
                        if (identityController.govermentId.value == null &&
                            identityController.voterId.value == null) {
                          ShowToast.toast(msg: "Please select image");
                        } else if (identityController.govermentId.value ==
                            null) {
                          ShowToast.toast(
                              msg: "Please select govement id image");
                        } else {
                          ShowToast.toast(msg: "Please select voter id image");
                        }
                      } else {
                        identityController.uploadImage();
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 230,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD6AA26),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Verify Identify",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          const Gap(25),
        ],
      ),
      body: Container(
        height: hit,
        width: wid,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(25),
              const Text(
                "Verify Identify",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Gap(25),
              const Text(
                "Upload Water ID Card",
                style: TextStyle(fontSize: 16),
              ),
              const Gap(15),
              // Container(
              //   height: 200,
              //   width: 370,
              //   color: Colors.grey[350],
              // ),
              Obx(
                () => identityController.imagePickerWidget(
                  type: "1",
                ),
              ),
              const Gap(25),
              const Text(
                "Upload Government ID ",
                style: TextStyle(fontSize: 16),
              ),
              const Gap(15),
              // Container(
              //   height: 200,
              //   width: 370,
              //   color: Colors.grey[350],
              // ),
              Obx(
                () => identityController.imagePickerWidget(
                  type: "2",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:pro_deals1/imports.dart';

class UploadStore extends GetView<UploadStorageImageController> {
  const UploadStore({super.key});

  @override
  Widget build(BuildContext context) {
    final UploadStorageImageController uploadController =
        Get.put(UploadStorageImageController());
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
          const Gap(60),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => uploadController.isProcess.value
                    ? CustomCircularIndicator(color: AppColor.primary)
                    : MyButton(
                        onTap: () {
                          if (uploadController.selectedImage.isEmpty) {
                            ShowToast.toast(
                                msg: "Please select atleast one store image");
                          } else {
                            uploadController.uploadImage();
                          }
                        },
                      ),
              ),
              Gap(16)
            ],
          ),
          Gap(16)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(25),
              const Center(
                child: Text(
                  "Upload Store / Work Place Images",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const Gap(40),
              Wrap(
                spacing: 10,
                runSpacing: 40,
                children: [
                  Obx(
                    () => uploadController.ImagePickerContainer(i: 0),
                  ),
                  Obx(
                    () => uploadController.ImagePickerContainer(i: 1),
                  ),
                  Obx(
                    () => uploadController.ImagePickerContainer(i: 2),
                  ),
                  Obx(
                    () => uploadController.ImagePickerContainer(i: 3),
                  ),
                  Obx(
                    () => uploadController.ImagePickerContainer(i: 4),
                  ),
                  Obx(
                    () => uploadController.ImagePickerContainer(i: 5),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

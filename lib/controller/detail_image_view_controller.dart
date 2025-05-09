import 'package:pro_deals1/imports.dart';

class DetailImageViewController extends GetxController {
  final data = Get.arguments;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    images.value = data['images'];
    pageController = PageController(initialPage: data['initialIndex']);
  }

  RxList<MultipleImages> images = <MultipleImages>[].obs;

  late PageController pageController;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pageController.dispose();
  }
}

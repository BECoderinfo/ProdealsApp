import 'package:get/get.dart';

class page_controller extends GetxController {
  RxBool isfood = true.obs;

  Update(bool val) {
    isfood.value = val;
  }
}

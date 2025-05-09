import 'package:pro_deals1/imports.dart';

class RegisterController extends GetxController {
  TextEditingController user = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isProcess = false.obs;
}

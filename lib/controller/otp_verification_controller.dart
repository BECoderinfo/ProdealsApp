import 'package:pro_deals1/imports.dart';

class OtpVerificationController extends GetxController {
  final data = Get.arguments;

  String code = "";
  String email = "";
  String username = "";
  String phone = "";
  String password = "";
  String expireTime = "";

  TextEditingController otp = TextEditingController();

  RxInt remainingTime = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (data != null && !data['reset']) {
      code = data['code'];
      email = data['email'];
      username = data['username'];
      phone = data['phone'];
      password = data['password'];
      expireTime = data['expireTime'];
    } else if (data != null) {
      code = data['code'];
      email = data['email'];
      expireTime = DateTime.now().add(Duration(minutes: 2)).toString();
    }
    // startTimer();
  }

  late Timer _timer;

  RxBool isProcess = false.obs;

  startTimer() {
    final now = DateTime.now();
    remainingTime.value = DateTime.parse(expireTime).difference(now).inSeconds;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final secondsLeft = DateTime.parse(expireTime).difference(now).inSeconds;

      if (secondsLeft <= 0) {
        timer.cancel();
        remainingTime.value = 0;
      } else {
        remainingTime.value = secondsLeft;
      }
    });
  }
}

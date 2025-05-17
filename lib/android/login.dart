import 'package:pro_deals1/imports.dart';

class login extends GetView<LoginController> {
  login({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: height / 1.5,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(background),
                  fit: BoxFit.fill,
                ),
              ),
              child: Form(
                key: controller.formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(90),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Login',
                        style: GoogleFonts.roboto(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Please Sign in to Continue.',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    const Gap(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.phone,
                        decoration: InputDecoration(
                          label: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.email,
                              size: 20,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter Email',
                        ),
                        validator: (num) {
                          if (controller.phone.text.isEmpty) {
                            return 'Enter Email';
                          } else if (!GetUtils.isEmail(controller.phone.text)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Gap(14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Obx(
                        () => TextFormField(
                          controller: controller.password,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                controller.showPass.value =
                                    !controller.showPass.value;
                              },
                              child: Icon(
                                controller.showPass.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ),
                            ),
                            label: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.lock,
                                size: 20,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Password',
                          ),
                          obscureText: controller.showPass.value,
                          validator: (pass) {
                            if (controller.password.text.isEmpty) {
                              return 'Enter password';
                            } else if (controller.password.text.length < 6) {
                              return 'password length must be 6 or 6+';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        width: width,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed('/forgot');
                          },
                          child: Text(
                            'Forgot Password?',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w100,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Obx(
                        () => controller.isProcess.value &&
                                controller.phone.text.isNotEmpty &&
                                controller.password.text.isNotEmpty
                            ? CustomCircularIndicator(
                                color: AppColor.white,
                              )
                            : GestureDetector(
                                onTap: () async {
                                  FocusScope.of(context).unfocus();
                                  var key = controller.formkey.currentState!;
                                  if (key.validate()) {
                                    controller.isProcess.value = true;

                                    // Perform login logic
                                    loginUser(
                                      email: controller.phone.text,
                                      password: controller.password.text,
                                      onDone: () {
                                        controller.isProcess.value =
                                            false; // Ensure loading stops before navigating
                                        controller.update();
                                      },
                                    );
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: width,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 2,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.roboto(
                                      color: AppColor.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text('Or Login With'),
            const Gap(40),
            Obx(
              () => controller.isProcess.value &&
                      controller.phone.text.isEmpty &&
                      controller.password.text.isEmpty
                  ? CustomCircularIndicator(color: AppColor.primary)
                  : GestureDetector(
                      onTap: () {
                        controller.password.text = "";
                        controller.phone.text = "";
                        controller.isProcess.value = true;
                        controller.loginWithGoogle(ctx: context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 50,
                          width: width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 2,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(google),
                              const Gap(6),
                              Text('Continue With Google'),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
            const Gap(40),
            GestureDetector(
              onTap: () {
                Get.toNamed('/register');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have Account?',
                    style: GoogleFonts.roboto(color: Colors.grey),
                  ),
                  const Gap(6),
                  Text(
                    'Sign Up',
                    style: GoogleFonts.roboto(color: AppColor.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColor.primary
      ..strokeWidth = 15;

    var path = Path();

    // path.moveTo(0, size.height * 0.7);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
    //     size.width * 0.5, size.height * 0.8);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
    //     size.width * 1.0, size.height * 0.8);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.moveTo(0, size.height * 0.7);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

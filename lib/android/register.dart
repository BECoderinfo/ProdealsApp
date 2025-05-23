import 'package:pro_deals1/imports.dart';

class register extends GetView<RegisterController> {
  register({super.key});

  final RegisterController controller = Get.put(RegisterController());

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
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(background),
                  fit: BoxFit.fill,
                ),
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(80),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Register',
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
                        'Please Register to Login.',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    const Gap(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: controller.user,
                        decoration: InputDecoration(
                          label: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Icon(Icons.person, size: 20),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Create Username',
                        ),
                        validator: (username) {
                          if (controller.user.text.isEmpty) {
                            return 'Enter username';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Gap(14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
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
                            child: Icon(Icons.call, size: 20),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter phone Number',
                        ),
                        validator: (num) {
                          if (controller.phone.text.isEmpty) {
                            return 'Enter number';
                          } else if (controller.phone.text.length != 10) {
                            return 'Enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Gap(14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: controller.email,
                        decoration: InputDecoration(
                          label: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Icon(Icons.email, size: 20),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter email',
                        ),
                        validator: (email) {
                          if (controller.email.text.isEmpty) {
                            return 'Enter email';
                          } else if (!GetUtils.isEmail(controller.email.text)) {
                            return 'Enter a valid email';
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
                          obscureText: controller.isPasswordHidden.value,
                          decoration: InputDecoration(
                            label: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Icon(Icons.lock, size: 20),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordHidden.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                controller.isPasswordHidden.value =
                                    !controller.isPasswordHidden.value;
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Password',
                          ),
                          validator: (pass) {
                            if (controller.password.text.isEmpty) {
                              return 'Enter password';
                            } else if (controller.password.text.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Obx(
                        () => controller.isProcess.value
                            ? CustomCircularIndicator(color: AppColor.white)
                            : GestureDetector(
                                onTap: () async {
                                  FocusScope.of(context).unfocus();
                                  var key = controller.formKey.currentState;
                                  if (key!.validate()) {
                                    controller.isProcess.value = true;
                                    await registerUser(
                                      userName: controller.user.text.trim(),
                                      email: controller.email.text.trim(),
                                      phone: controller.phone.text.trim(),
                                      password: controller.password.text.trim(),
                                      onDone: () {
                                        controller.isProcess.value = false;
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
                                    'Register',
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
            const Gap(30),
            Text('Or Login With'),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () async {
                  controller.isProcess.value = true;
                  final result = await controller.signInWithGoogle();
                  controller.isProcess.value = false;
                  if (result != null) {
                    // Navigate to home or handle as needed
                    Get.snackbar('Success', 'Signed in with Google!');
                  }
                },
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
            const Gap(50),
            GestureDetector(
              onTap: () {
                Get.toNamed('/login');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.roboto(color: Colors.grey),
                  ),
                  const Gap(6),
                  Text(
                    'Login',
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

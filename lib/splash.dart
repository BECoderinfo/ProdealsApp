import 'package:pro_deals1/imports.dart';

class splash extends StatelessWidget {
  const splash({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Timer(const Duration(seconds: 3), () {
      if (UserDataStorageServices.readData(
                key: UserStorageDataKeys.cPanel,
              ) !=
              null &&
          UserDataStorageServices.readData(
                key: UserStorageDataKeys.cPanel,
              ) ==
              '${panel.business}') {
        Get.offNamed('/dashboard');
      } else if (UserDataStorageServices.readData(
                key: UserStorageDataKeys.cPanel,
              ) !=
              null &&
          UserDataStorageServices.readData(
                key: UserStorageDataKeys.cPanel,
              ) ==
              '${panel.user}') {
        currentPageIndex.value = AppPage.home;
        Get.offNamed('/navigation');
      } else {
        Get.offNamed('/intro');
      }
    });
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        color: AppColor.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pro',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: AppColor.white,
                  fontSize: 40,
                ),
              ),
            ),
            const Gap(8),
            Text(
              'Deals',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: AppColor.black300,
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

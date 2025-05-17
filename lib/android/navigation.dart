import 'package:pro_deals1/imports.dart';

class navigation extends StatefulWidget {
  const navigation({super.key});

  @override
  State<navigation> createState() => _navigationState();
}

ValueNotifier<int> currentPageIndex = ValueNotifier(0);

final PageController pageController = PageController(
  initialPage: 0,
);

class _navigationState extends State<navigation> {
  final List<Widget> list = [
    home_page(),
    Cart(),
    QrScanner(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnimatedBuilder(
        animation: currentPageIndex,
        builder: (context, child) {
          return PageView(
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              if (currentPageIndex == 0) {
                // Get.delete<HomePageController>();
              } else if (currentPageIndex == 1) {
                Get.delete<CartController>();
              } else if (currentPageIndex == 3) {
                Get.delete<ProfilePageController>();
              }
              setState(() {
                currentPageIndex.value = value;
              });
            },
            controller: pageController,
            children: list,
          );
        },
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: AnimatedBuilder(
          animation: currentPageIndex,
          builder: (context, child) {
            return BottomNavigationBar(
              backgroundColor: AppColor.primary,
              currentIndex: currentPageIndex.value,
              onTap: (value) {
                setState(() {
                  currentPageIndex.value = value;
                  pageController.jumpToPage(
                    value,
                  );
                });
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColor.white,
              unselectedItemColor: AppColor.black300,
              elevation: 2,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/icons/B_home.svg'),
                  ),
                  activeIcon: Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      child: SvgPicture.asset('assets/icons/home.svg')),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/icons/cart.svg'),
                  ),
                  activeIcon: Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      child: SvgPicture.asset('assets/icons/W_cart.svg')),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/icons/qr_code.svg'),
                  ),
                  activeIcon: Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      child: SvgPicture.asset('assets/icons/W_qr_code.svg')),
                  label: 'Scan',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/icons/A_user.svg'),
                  ),
                  activeIcon: Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      child: SvgPicture.asset('assets/icons/W_A_user.svg')),
                  label: 'Profile',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

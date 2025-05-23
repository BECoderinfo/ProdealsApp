import 'package:pro_deals1/imports.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

enum AppPage { home, cart, scan, profile }

final ValueNotifier<AppPage> currentPageIndex = ValueNotifier(AppPage.home);
final PageController pageController = PageController(initialPage: 0);

class _NavigationState extends State<Navigation> {
  final List<Widget> _pages = const [
    home_page(),
    Cart(),
    QrScanner(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // This is the key line
      backgroundColor: AppColor.primary, // Your page background
      body: ValueListenableBuilder<AppPage>(
        valueListenable: currentPageIndex,
        builder: (context, currentPage, child) {
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              final page = AppPage.values[index];
              currentPageIndex.value = page;

              // Clean up controllers if needed
              if (page == AppPage.cart) Get.delete<CartController>();
              if (page == AppPage.profile) Get.delete<ProfilePageController>();
            },
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: _buildCustomNavBar(),
    );
  }

  Widget _buildCustomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: ValueListenableBuilder<AppPage>(
          valueListenable: currentPageIndex,
          builder: (context, currentPage, child) {
            return BottomNavigationBar(
              backgroundColor: Colors.transparent,
              // Transparent inside clipped parent
              currentIndex: currentPage.index,
              onTap: (index) {
                final page = AppPage.values[index];
                currentPageIndex.value = page;
                pageController.jumpToPage(index);
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColor.white,
              unselectedItemColor: AppColor.black300,
              elevation: 0,
              items: _buildNavItems(),
            );
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildNavItems() {
    return [
      BottomNavigationBarItem(
        icon: _buildNavIcon('assets/icons/B_home.svg'),
        activeIcon: _buildNavIcon('assets/icons/home.svg', isActive: true),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: _buildNavIcon('assets/icons/cart.svg'),
        activeIcon: _buildNavIcon('assets/icons/W_cart.svg', isActive: true),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        icon: _buildNavIcon('assets/icons/qr_code.svg'),
        activeIcon: _buildNavIcon('assets/icons/W_qr_code.svg', isActive: true),
        label: 'Scan',
      ),
      BottomNavigationBarItem(
        icon: _buildNavIcon('assets/icons/A_user.svg'),
        activeIcon: _buildNavIcon('assets/icons/W_A_user.svg', isActive: true),
        label: 'Profile',
      ),
    ];
  }

  Widget _buildNavIcon(String assetPath, {bool isActive = false}) {
    return Container(
      height: 20,
      width: 20,
      alignment: Alignment.center,
      child: SvgPicture.asset(
        assetPath,
        colorFilter:
            isActive ? ColorFilter.mode(AppColor.white, BlendMode.srcIn) : null,
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

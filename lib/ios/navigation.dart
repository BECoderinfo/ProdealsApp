import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class ios_navigation extends StatelessWidget {
  const ios_navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: false,
      tabBar: CupertinoTabBar(
        backgroundColor: AppColor.primary,
        border: Border(),
        activeColor: AppColor.black300,
        inactiveColor: AppColor.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const ios_home();
          case 1:
            return const ios_scan_qr();
          case 2:
            return const iosFavourite();
          default:
            return const IosProfile();
        }
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';

class ios_navigation extends StatefulWidget {
  const ios_navigation({super.key});

  @override
  State<ios_navigation> createState() => _IosNavigationState();
}

class _IosNavigationState extends State<ios_navigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    ios_home(),
    ios_scan_qr(),
    iosFavourite(),
    IosProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            backgroundColor: AppColor.primary,
            selectedItemColor: AppColor.black300,
            unselectedItemColor: AppColor.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

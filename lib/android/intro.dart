import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_deals1/utils/colors.dart';
import 'package:pro_deals1/utils/images.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          IntroPage(
            imageAsset: Intro1,
            backgroundColor: AppColor.primary,
            pageTitle: 'Welcome to Pro Deals',
            pageDescription:
                'Unlock exclusive deals and personalized \ndiscounts tailored to your preferences instantly',
          ),
          IntroPage(
            imageAsset: Intro2,
            backgroundColor: AppColor.black300,
            pageTitle: 'Become affiliate marketer',
            pageDescription:
                'Affiliate marketing is a performance-based \n online business',
          ),
          IntroPage(
            imageAsset: Intro3,
            backgroundColor: AppColor.primary,
            pageTitle: 'End to end encrypted',
            pageDescription:
                'Security method that keeps your \ncommunications secure',
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BottomNav(
          currentPage: _currentPage,
          onPageChanged: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  final String imageAsset;
  final Color backgroundColor;
  final String pageTitle;
  final String pageDescription;

  const IntroPage({
    required this.imageAsset,
    required this.backgroundColor,
    required this.pageTitle,
    required this.pageDescription,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: height / 1.7,
          width: width,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(46),
            ),
          ),
          child: SvgPicture.asset(imageAsset),
        ),
        const Gap(20),
        Text(
          pageTitle,
          style: GoogleFonts.roboto(
            fontSize: 20,
          ),
        ),
        const Gap(20),
        Text(
          pageDescription,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 14,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class BottomNav extends StatelessWidget {
  final int currentPage;
  final Function(int) onPageChanged;

  const BottomNav({
    required this.currentPage,
    required this.onPageChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.offNamedUntil('/login', (route) => false);
          },
          child: Text(
            'Skip',
            style: GoogleFonts.roboto(
              color: AppColor.primary,
              fontSize: 24,
            ),
          ),
        ),
        const Spacer(),
        Row(
          children: List.generate(3, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    currentPage == index ? AppColor.primary : AppColor.black300,
              ),
            );
          }),
        ),
        const Spacer(),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primary,
          ),
          alignment: Alignment.center,
          child: IconButton(
            onPressed: () {
              if (currentPage < 2) {
                onPageChanged(currentPage + 1);
              } else {
                Get.offNamed('/login');
              }
            },
            icon: Icon(
              Icons.arrow_forward_sharp,
              color: AppColor.white,
            ),
          ),
        )
      ],
    );
  }
}

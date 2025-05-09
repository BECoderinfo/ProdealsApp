import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/colors.dart';

class popupscreen4 extends StatefulWidget {
  const popupscreen4({super.key});

  @override
  State<popupscreen4> createState() => _popupscreen4State();
}

class _popupscreen4State extends State<popupscreen4> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.close,
            color: AppColor.white,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 15,
          ),
          Center(
              child: Text(
            '10% OFF',
            style: TextStyle(
                fontFamily: 'assets/fonts/Anton/Anton-Regular.ttf',
                fontSize: 30,
                color: AppColor.white,
                fontWeight: FontWeight.w900),
          )),
          Center(
            child: Text(
              'on your first purchase',
              style: TextStyle(
                  fontSize: 15,
                  color: AppColor.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 240,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primary),
                  borderRadius: BorderRadius.circular(7),
                  color: AppColor.black300),
              child: Center(
                  child: Text('enter your email address here',
                      style: TextStyle(color: AppColor.white))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 240,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColor.primary),
              child: Center(
                  child: Text('GET MY 10% OFF',
                      style: TextStyle(color: AppColor.white))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            'No, Thanks',
            style: TextStyle(
                fontSize: 15,
                color: AppColor.white,
                decoration: TextDecoration.underline,
                decorationColor: AppColor.white),
          )),
          const Gap(10),
        ],
      ),
    );
  }
}

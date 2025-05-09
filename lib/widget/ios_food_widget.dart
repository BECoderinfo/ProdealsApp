import 'package:flutter/material.dart';

import '../utils/colors.dart';

Widget Ios_food_widget({required double hit, required double wid}) {
  print(hit);
  return Container(
    height: hit / 4,
    width: wid / 2,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColor.white,
      boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(0, 1)),
      ],
    ),
    child: Column(
      children: [
        Container(
          height: hit / 6,
          width: wid / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    ),
  );
}

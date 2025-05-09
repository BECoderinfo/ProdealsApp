import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ios_button extends StatelessWidget {
  final void Function()? onTap;

  const ios_button({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 300),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Icon(
              Icons.arrow_forward_rounded,
              color: AppColor.primary,
            ),
          ),
        ),
      ),
    );
  }
}

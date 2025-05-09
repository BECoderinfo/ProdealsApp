import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  Color color;
  CustomCircularIndicator({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}

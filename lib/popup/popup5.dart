import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/colors.dart';

class popupscreen5 extends StatefulWidget {
  const popupscreen5({super.key});

  @override
  State<popupscreen5> createState() => _popupscreen5State();
}

class _popupscreen5State extends State<popupscreen5> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.close,
            color: AppColor.black300,
          ),
        ],
      ),
      title: const Center(
        child: Text(
          '''   Want 10% off 
 Your First order?''',
          style: TextStyle(
              fontSize: 21, color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ),
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Get 10% off + insider access to new products, promos, and more when you subscribe.',
                style: TextStyle(fontSize: 11),
              ),
            ),
          ),
          const Gap(27),
          TextField(
            decoration: InputDecoration(
              hintText: "First name",
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "First name",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 280,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColor.primary),
              child: const Center(
                  child: Text('GET MY 10% OFF',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700))),
            ),
          ),
          const Gap(
            6,
          ),
        ],
      ),
    );
  }
}

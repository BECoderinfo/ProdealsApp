import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/colors.dart';

class popup3 extends StatefulWidget {
  const popup3({super.key});

  @override
  State<popup3> createState() => _popup3State();
}

class _popup3State extends State<popup3> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.grey,
          child: Stack(
            children: [
              Container(
                height: 500,
                width: 500,
                child: Image.asset(
                  'assets/images/Frame 3584.png',
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.close),
                    ],
                  ),
                  const Center(
                    child: Text(
                      ' WAIT WAIT WAIT...',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text.rich(TextSpan(
                        text: '10%',
                        style: TextStyle(
                            fontSize: 45,
                            color: AppColor.black300,
                            fontWeight: FontWeight.w900),
                        children: [
                          TextSpan(
                              text: ' OFF!   ',
                              style: TextStyle(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 45)),
                          const TextSpan(
                              text: '\nUse the discount code below and save',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                          const TextSpan(
                              text: '   \n            10%off your first order',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500))
                        ])),
                  ),
                  const Gap(20),
                  Center(
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(7),
                          color: AppColor.primary),
                      child: const Center(
                          child: Text('BECODER770T',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20))),
                    ),
                  ),
                  const Gap(20),
                  const Center(
                      child: Text(
                    'No, Thanks',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

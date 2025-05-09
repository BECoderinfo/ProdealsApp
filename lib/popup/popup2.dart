import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/colors.dart';

class popupscreen2 extends StatefulWidget {
  const popupscreen2({super.key});

  @override
  State<popupscreen2> createState() => _popupscreen2State();
}

class _popupscreen2State extends State<popupscreen2> {
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.close),
                    ],
                  ),
                  const Center(
                    child: Text(
                      'DONT MISS OUT...',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Center(
                    child: Text.rich(TextSpan(
                        text: '10%',
                        style: const TextStyle(
                            fontSize: 45,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                        children: [
                          TextSpan(
                              text: ' OFF',
                              style: TextStyle(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 45)),
                          const TextSpan(
                              text: '\nOn your first purchase',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500))
                        ])),
                  ),
                  const Gap(26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(10),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.primary),
                              boxShadow: [BoxShadow(color: Colors.white)],
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.white),
                          child: Center(
                              child: Text('enter your Email address here',
                                  style: TextStyle(
                                      color: AppColor.black300, fontSize: 10))),
                        ),
                      ),
                      Gap(10),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(7),
                              color: AppColor.primary),
                          child: const Center(
                              child: Text('GET MY 10% OFF',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10))),
                        ),
                      ),
                      const Gap(9),
                    ],
                  ),
                  const Gap(26),
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

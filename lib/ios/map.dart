import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../utils/colors.dart';

class locationios extends StatelessWidget {
  const locationios({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: Container(
        width: wid,
        height: hit,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 196, 197, 197),
          image: DecorationImage(
            image: AssetImage("assets/images/map.jpg"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Gap(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Gap(10),
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CupertinoTextField(
                            controller: _controller,
                            placeholder: "Search",
                            suffix: Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(6),
                              child: Image.asset('assets/images/search.png'),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                            ),
                          ),
                        ),
                        const Gap(10),
                      ],
                    ),
                  ),
                ),
                Gap(10),
                Expanded(
                  flex: 0,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primary,
                    ),
                    padding: EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      'assets/icons/location_searching.svg',
                      color: AppColor.white,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const Gap(10),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (_) => cardList()));
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: AppColor.primary, width: 2)),
                      child: Center(
                        child: Text(
                          'Fast food',
                          style: TextStyle(color: AppColor.black300),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: AppColor.primary, width: 2)),
                        child: Center(
                          child: Text(
                            'Italian',
                            style: TextStyle(color: AppColor.black300),
                          ),
                        )),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: AppColor.primary, width: 2)),
                        child: Center(
                          child: Text(
                            'Mexican',
                            style: TextStyle(color: AppColor.black300),
                          ),
                        )),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: AppColor.primary, width: 2)),
                        child: Center(
                          child: Text(
                            'Indian',
                            style: TextStyle(color: AppColor.black300),
                          ),
                        )),
                  ),
                  const Gap(5),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.primary,
                ),
                child: Icon(
                  Icons.filter_alt_outlined,
                  size: 38,
                  color: AppColor.white,
                ),
              ),
            ),
            const Gap(10),
            Container(
              width: wid,
              height: 340,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.black300),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: wid,
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/cc2.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'Coffee Culture',
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColor.white,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColor.primary,
                          size: 16,
                        ),
                        Text(
                          ' Khodiyar Nivas, Vesu, Surat',
                          style: TextStyle(fontSize: 14, color: AppColor.white),
                        )
                      ],
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.directions_car_filled_outlined,
                                color: AppColor.black300,
                                size: 16,
                              ),
                              Gap(6),
                              Text(
                                'Free',
                                style: TextStyle(
                                    color: AppColor.black300, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Gap(10),
                        Container(
                          height: 30,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.watch_later,
                                color: AppColor.black300,
                                size: 16,
                              ),
                              Gap(6),
                              Text(
                                '10-15cm',
                                style: TextStyle(
                                    color: AppColor.black300, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Gap(10),
                        Container(
                          height: 30,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColor.black300,
                                size: 16,
                              ),
                              Gap(6),
                              Text(
                                '4.5',
                                style: TextStyle(
                                    color: AppColor.black300, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            height: 60,
                            width: wid / 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.primary),
                            child: const Center(
                              child: Text(
                                ' More Details',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        Gap(10),
                        Expanded(
                          child: Container(
                            height: 60,
                            width: wid / 6.20,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColor.primary, width: 2),
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.black300,
                            ),
                            padding: EdgeInsets.all(12),
                            child:
                                SvgPicture.asset('assets/icons/rect1441.svg'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

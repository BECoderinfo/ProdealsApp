import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_deals1/utils/colors.dart';

class support_details extends StatelessWidget {
  const support_details({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Support Center Details'),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: Container(
        height: hit,
        width: wid,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: AppColor.white,
                child: SvgPicture.asset('assets/icons/pay.svg'),
              ),
              dense: true,
              title: Text(
                'Payment Method',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const Gap(10),
            Text(
                "There are many variations of passages ipsum available, but the majority have suffere in some form, by injected humour, randomised words which don't look even slight elievable. If you are going to use a passage of Lorem Ipsum, you need to be sure there is anything embarrassing hidden in the middle of text.\n\nAll the Lorem Ipsum generators the Internet tend to repeat predefined chunks necessary, making this the first true generator on the Internet."),
          ],
        ),
      ),
    );
  }
}

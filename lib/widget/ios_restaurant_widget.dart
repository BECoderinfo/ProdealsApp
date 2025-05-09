import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

Widget ios_restaurant(
    {required double hit,
    required double wid,
    required String title,
    required String location,
    required double rating,
    required String time,
    required String image}) {
  return Container(
    height: hit,
    width: wid,
    decoration: BoxDecoration(
      color: AppColor.black300,
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Container(
          height: hit / 3,
          width: wid,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Gap(8),
        Text(
          title,
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const Gap(6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.location_solid,
              color: AppColor.primary,
              size: 14,
            ),
            const Gap(4),
            Text(
              location,
              style: GoogleFonts.openSans(
                fontSize: 14,
              ),
            ),
          ],
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: hit / 10,
              width: wid / 4.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.directions_car,
                    color: AppColor.white,
                    size: 18,
                  ),
                  Text(
                    'Free',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(6),
            Container(
              height: hit / 10,
              width: wid / 4.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.access_time_filled,
                    color: AppColor.white,
                    size: 18,
                  ),
                  Text(
                    '${time}m',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(6),
            Container(
              height: hit / 10,
              width: wid / 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.star_rate_rounded,
                    color: AppColor.white,
                    size: 18,
                  ),
                  Text(
                    '$rating',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: hit / 6.7,
              width: wid - 36 - 100,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                'More Details',
                style: GoogleFonts.openSans(color: AppColor.black300),
              ),
            ),
            Container(
              height: hit / 6.7,
              width: hit / 6.7,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primary, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.bookmark,
                color: AppColor.primary,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

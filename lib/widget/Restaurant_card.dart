import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

Widget restaurant(
  double hit,
  double wid,
  String name,
  String location,
  String votes,
  double rating,
  String offers,
) {
  return Container(
    height: hit,
    width: wid,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
    ),
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              height: hit / 2,
              width: wid / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Column(
              children: [
                Text(
                  'Shiva Restaurant',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text(location),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: AppColor.primary,
                    ),
                    Text('$rating'),
                  ],
                ),
                Text('$votes Votes'),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text(offers),
            Divider(),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: hit / 5,
                width: wid / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text('Offer'),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

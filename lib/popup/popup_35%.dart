import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class popup_35 extends StatefulWidget {
  const popup_35({super.key});

  @override
  State<popup_35> createState() => _popup_35State();
}

class _popup_35State extends State<popup_35> {
  @override
  Widget build(BuildContext context) {
    Color Yellow = Color(0xFFDAA520);
    Color black = Color(0xFF2A2A2A);
    double wid = MediaQuery.of(context).size.width;
    // const imageUrl =
    //     'assets/images/Mandala_SVG_Craft_Design_85_generated 1.png';
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: wid * 1,
          width: wid * 0.9,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 270),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                ),
              ),
              Container(
                height: wid / 4,
                child: Image.asset(
                  'assets/images/image 14.png',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '35%',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                      fontSize: 45,
                    ),
                  ),
                  Text(
                    'OFF',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 45,
                        color: Yellow),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Subscribe our Membership',
                  style: GoogleFonts.poppins(fontSize: 10, color: black),
                ),
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 190,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'enter your email address here',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          //   borderSide: BorderSide(color: Yellow, width: 2.0),
                          // ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Yellow, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Yellow, width: 2.0),
                          ),
                          focusColor: Yellow),
                    ),
                  ),
                  Gap(10),
                  Container(
                    height: 40,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Yellow,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            color: Colors.grey,
                            offset: Offset(0, 0))
                      ],
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'SUBSCRIBE NOW',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Gap(20),
              Center(
                  child: Text(
                'NO, THANKS',
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    decoration: TextDecoration.underline),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

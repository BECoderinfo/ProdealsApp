import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class popup_50off extends StatefulWidget {
  const popup_50off({super.key});

  @override
  State<popup_50off> createState() => _popup_50offState();
}

class _popup_50offState extends State<popup_50off> {
  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;

    Color black = Color(0xFF2A2A2A);
    Color green = Color(0xFF28B453);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: wid * 0.8,
          width: wid * 0.9,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 270),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                ),
              ),
              Text(
                ' WAIT WAIT WAIT...',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '50%',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                      fontSize: 45,
                    ),
                  ),
                  Text(
                    'OFF!',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 45,
                        color: green),
                  ),
                ],
              ),
              Gap(20),
              Text(
                'Use the discount code below and save 50% off',
                style: GoogleFonts.poppins(fontSize: 10, color: black),
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            color: Colors.grey,
                            offset: Offset(0, 0))
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'BECODER770T',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800, color: green),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
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
                              'Copy',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
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

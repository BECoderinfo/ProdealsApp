import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/colors.dart';

class ios_verify extends StatefulWidget {
  const ios_verify({Key? key}) : super(key: key);

  @override
  State<ios_verify> createState() => _ios_verifyState();
}

class _ios_verifyState extends State<ios_verify> {
  File? _waterIdCard;
  File? _governmentIdCard;

  Future<void> _pickImage(ImageSource source, String type) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        if (type == 'waterIdCard') {
          _waterIdCard = File(pickedImage.path);
        } else if (type == 'governmentIdCard') {
          _governmentIdCard = File(pickedImage.path);
        }
      });
    }
  }

  Widget _buildImageWidget(File? image) {
    return image != null
        ? Image.file(
            image,
            height: 200,
            width: 350,
            fit: BoxFit.cover,
          )
        : Icon(
            CupertinoIcons.photo_on_rectangle,
            size: 60,
            color: CupertinoColors.systemGrey3,
          );
  }

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      child: Container(
        height: hit,
        width: wid,
        color: AppColor.primary,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                      const Gap(60),
                      Text(
                        'Create Account',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                height: hit / 1.25,
                width: wid,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(120),
                  ),
                ),
                child: Form(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(hit / 15),
                        Text(
                          "Verify Identify",
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        const Gap(30),
                        Text(
                          "Upload Water ID Card",
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const Gap(30),
                        GestureDetector(
                          onTap: () {
                            _pickImage(ImageSource.gallery, 'waterIdCard');
                          },
                          child: Container(
                            height: 200,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: _buildImageWidget(_waterIdCard),
                            ),
                          ),
                        ),
                        const Gap(30),
                        Text(
                          "Upload Government ID Card",
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const Gap(30),
                        GestureDetector(
                          onTap: () {
                            _pickImage(ImageSource.gallery, 'governmentIdCard');
                          },
                          child: Container(
                            height: 200,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: _buildImageWidget(_governmentIdCard),
                            ),
                          ),
                        ),
                        const Gap(30),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/ios_successfully');
                          },
                          child: Container(
                            height: 50,
                            width: 230,
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Verify Identify",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/Featuer/Home/home_screen.dart';
import 'package:taskati/core/constants/assets.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/helpers/navigation.dart';
import 'package:taskati/core/styles/text_style.dart';
import 'package:taskati/core/widgets/input_box.dart';
import 'package:taskati/core/widgets/mainbottun.dart';
import 'package:taskati/core/widgets/tapbottun.dart';

class CompleteScreen extends StatefulWidget {
  const CompleteScreen({super.key});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  String? path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(child: Text('Complete Your Profile', style: AppText.titel)),
              Gap(85),
              Row(
                children: [
                  Text(
                    'Profile Image',
                    style: AppText.discrebtion.copyWith(
                      color: AppColors.seconderycolor,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 83,
                    backgroundImage: path != null
                        ? FileImage(File(path!))
                        : AssetImage(AppAssets.userImg),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: AppColors.whitecolor,
                      child: SvgPicture.asset(AppAssets.deletSvg),
                    ),
                  ),
                ],
              ),
              Gap(34),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TapBottun(
                    titel: 'From Camera',
                    ontap: () async {
                      var image = await ImagePicker().pickImage(
                        source: ImageSource.camera,
                      );
                      setState(() {
                        if (image != null) {
                          path = image.path;
                        }
                      });
                    },
                  ),
                  Gap(12),
                  TapBottun(
                    titel: 'From Gallery',
                    ontap: () async {
                      var image = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      setState(() {
                        if (image != null) {
                          path = image.path;
                        }
                      });
                    },
                  ),
                ],
              ),
              Gap(45),
              Row(
                children: [
                  Text(
                    'Your Name',
                    style: AppText.discrebtion.copyWith(
                      color: AppColors.seconderycolor,
                    ),
                  ),
                ],
              ),
              Gap(8),
              InputBox(hint: 'Enter your name'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 22),
        child: MainBottun(
          titel: 'Let\'s Start !',
          ontap: () {
              pushReplacementPage(context: context, newScreen: HomeScreen());
          },
        ),
      ),
    );
  }
}

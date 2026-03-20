import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/assets.dart';
import 'package:taskati/core/helpers/hive_helper.dart';
import 'package:taskati/core/styles/text_style.dart';

class heder_home_screen extends StatefulWidget {
  const heder_home_screen({super.key});

  @override
  State<heder_home_screen> createState() => _heder_home_screenState();
}

class _heder_home_screenState extends State<heder_home_screen> {
  String name = '';
  String path = '';
  @override
  void initState() {
    super.initState();
    getCachedData();
  }

  Future<void> getCachedData() async {
    name = HiveHelper.getCachedData(HiveHelper.nameKey);
    path = HiveHelper.getCachedData(HiveHelper.imageKay);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipOval(
        child: path.isEmpty? 
        SvgPicture.asset(AppAssets.userImg,width: 50,height: 50,)
        :Image.file(File(path),width: 50,height: 50,
        fit:BoxFit.cover),
        ),
        Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello!', style: AppText.subtitel),
            Gap(4),
            Text(name, style: AppText.titel),
          ],
        ),
      ],
    );
  }
}

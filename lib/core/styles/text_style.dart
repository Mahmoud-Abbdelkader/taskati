import 'package:flutter/material.dart';
import 'package:taskati/core/constants/colors.dart';

class AppText {
  // appText({required this.style}),
  static final TextStyle titel = TextStyle(
    color: AppColors.blackcolor,
    fontSize: 19,
    fontWeight: FontWeight.w600,
  );
  //  static final TextStyle titel=TextStyle(color: appcolors.darkcolor,fontSize: 22,fontWeight: FontWeight.w700);
  static final TextStyle subtitel = TextStyle(
    color: AppColors.blackcolor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle discrebtion = TextStyle(
    color: AppColors.seconderycolor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle tapbottun = TextStyle(
    color: AppColors.seconderycolor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle done = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w400,
  );
}

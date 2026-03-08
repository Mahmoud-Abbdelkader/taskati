import 'package:flutter/material.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/styles/text_style.dart';

class MainBottun extends StatelessWidget {
  const MainBottun({super.key, 
  required this.titel, 
  required this.ontap});
  
  final String titel;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 20),
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.primarycolor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(titel, style: AppText.titel.copyWith(color: AppColors.whitecolor))],
        ),
      ),
    );
  }
}

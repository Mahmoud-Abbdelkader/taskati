import 'package:flutter/material.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/styles/text_style.dart';

class TapBottun extends StatelessWidget {
  const TapBottun({
    this.width = 50,
    this.height = 35,
    this.radius = 9,
    super.key,
    required this.titel,
    required this.ontap,
  });

  final String titel;
  final Function() ontap;
  final double width;
  final double height;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      hoverColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 35,

        decoration: BoxDecoration(
          color: AppColors.fillecolor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(mainAxisSize: MainAxisSize.min,
          children: [
            Text(titel, style: AppText.tapbottun),
          ],
        ),
      ),
    );
  }
}

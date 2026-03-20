import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskati/core/constants/assets.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/styles/text_style.dart';

class DateTimecard extends StatelessWidget {
  const DateTimecard({
    super.key,
    required this.titel,
    required this.subtitel,
    required this.leading,
    required this.ontap,
  });
  final String titel;
  final String subtitel;
  final Widget leading;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.whitecolor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.darck,
              blurRadius: 32,
              spreadRadius: 0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          minVerticalPadding: 0,
          contentPadding: EdgeInsets.zero,
          minTileHeight: 0,
          leading: leading,
          title: Text(
            titel,
            style: AppText.done.copyWith(color: AppColors.seconderycolor),
          ),
          subtitle: Text(subtitel, style: AppText.subtitel),
          trailing: SvgPicture.asset(AppAssets.arrrowDSvg),
          // style:  ,
        ),
      ),
    );
  }
}

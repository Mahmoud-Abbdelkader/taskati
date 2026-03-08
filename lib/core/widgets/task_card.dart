import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/assets.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/styles/text_style.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.titel,
    required this.description,
    required this.startTime,
    required this.endTime,
  });
  final String titel;
  final String description;
  final String startTime;
  final String endTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.whitecolor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titel, style: AppText.subtitel),
          Gap(3),
          Text(
            description,
            style: AppText.discrebtion,
          ),
          Gap(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(AppAssets.timeSvg),
              Gap(6),
              Text(
                '$startTime - $endTime',
                style: AppText.discrebtion.copyWith(
                  color: AppColors.lightprimarycolor,
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsetsDirectional.symmetric(
                  vertical: 1,
                  horizontal: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.fillecolor,
                ),
                child: Center(
                  child: Text(
                    'Done',
                    style: AppText.done.copyWith(color: AppColors.primarycolor),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

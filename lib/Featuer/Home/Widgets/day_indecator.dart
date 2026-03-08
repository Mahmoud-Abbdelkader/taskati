import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/styles/text_style.dart';

class day_indecator extends StatelessWidget {
  const day_indecator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.primarycolor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('E, d MM').format(DateTime.now()),
                    style: AppText.tapbottun.copyWith(
                      color: AppColors.whitecolor,
                    ),
                  ),
                  Gap(13),
                  Text(
                    'Your today’s task almost almost',
                    style: AppText.subtitel.copyWith(
                      color: AppColors.whitecolor,
                    ),
                  ),
                ],
              ),
            ),
            Gap(25),
            CircularPercentIndicator(
              radius: 38,
              lineWidth: 10,
              percent: 0.5,
              center: Text(
                "50%",
                style: AppText.subtitel.copyWith(color: AppColors.whitecolor),
              ),
              progressColor: AppColors.whitecolor,
              backgroundColor: Color(0xff8764FF),
            ),
          ],
        ),
      ),
    );
  }
}

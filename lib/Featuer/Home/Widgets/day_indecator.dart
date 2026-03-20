import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskati/Models/all_tasks_model.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/helpers/hive_helper.dart';
import 'package:taskati/core/styles/text_style.dart';

class dayIndecator extends StatelessWidget {
  const dayIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveHelper.taskaBox.listenable(),
      builder: (context, box, _) {
        List<AllTasksModel> toDayTasks = [];
        List<AllTasksModel> toDayCompletedTasks = [];
        for (var task in box.values) {
          if (task.date == DateFormat('dd MMM, yyyy').format(DateTime.now())) {
            toDayTasks.add(task);
            if (task.isCompleted == true) {
              toDayCompletedTasks.add(task);
            }
          }
        }
        var indecator = toDayTasks.isEmpty
            ? 0
            : (toDayCompletedTasks.length / toDayTasks.length) * 100;
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
                        DateFormat('E, d MMM').format(DateTime.now()),
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
                  animation: true,
                  radius: 38,
                  lineWidth: 10,
                  percent: indecator.toInt() / 100,
                  center: Text(
                    '${indecator.toInt()}%',
                    style: AppText.subtitel.copyWith(
                      color: AppColors.whitecolor,
                    ),
                  ),
                  progressColor: AppColors.whitecolor,
                  backgroundColor: Color(0xff8764FF),
                  circularStrokeCap: CircularStrokeCap.round,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

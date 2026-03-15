import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:taskati/Featuer/AddTasks/Screens/add_task_screen.dart';
import 'package:taskati/Models/all_tasks_model.dart';
import 'package:taskati/core/constants/assets.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/helpers/hive_helper.dart';
import 'package:taskati/core/helpers/navigation.dart';
import 'package:taskati/core/styles/text_style.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.titel,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.isCompleted,
    required this.task,
  });
  final String titel;
  final String description;
  final String startTime;
  final String endTime;
  final bool isCompleted;
  final AllTasksModel task;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(
          onDismissed: () {
            HiveHelper.taskaBox.delete(task.id);
          },
        ),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            // flex: 2,
            onPressed: (context) {
              HiveHelper.cacheTask(
                task.id ?? '',
                task.copyWith(isCompleted: true),
              );
            },
            backgroundColor: AppColors.lightprimarycolor,
            foregroundColor: Colors.white,
            icon: Icons.check,
            label: 'Done',
          ),
          SlidableAction(
            onPressed: (context) {
              pushPage(
                context: context,
                newScreen: AddEditTaskScreen(task: task),
              );
            },
            backgroundColor: Colors.amber,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Container(
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
            Text(description, style: AppText.discrebtion),
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
                    color: isCompleted
                        ? AppColors.fillecolor
                        : AppColors.lightorange,
                  ),
                  child: Center(
                    child: Text(
                      isCompleted ? 'Done' : 'In Progress',
                      style: AppText.done.copyWith(
                        color: isCompleted
                            ? AppColors.primarycolor
                            : AppColors.orange,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

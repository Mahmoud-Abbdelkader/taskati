import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/Models/all_tasks_model.dart';
import 'package:taskati/core/widgets/task_card.dart';

class ViewTasks extends StatelessWidget {
  const ViewTasks({super.key, required this.tasks});
  final List<AllTasksModel> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        AllTasksModel task = tasks[index];
        return TaskCard(
          titel: task.title ?? '',
          description: task.description ?? '',
          startTime: task.startTime ?? '',
          endTime: task.endTime ?? '',
          isCompleted: task.isCompleted?? false, 
          task: task,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Gap(15);
      },
      itemCount: tasks.length,
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:taskati/Featuer/Home/Widgets/tabs.dart';
import 'package:taskati/Featuer/Home/Widgets/view_tasks.dart';
import 'package:taskati/Models/all_tasks_model.dart';
import 'package:taskati/core/helpers/hive_helper.dart';
import 'package:taskati/core/widgets/task_card.dart';

class TabTasks extends StatefulWidget {
  const TabTasks({super.key, required this.isSelect});
  final String isSelect;

  @override
  State<TabTasks> createState() => _TabTasksState();
}

class _TabTasksState extends State<TabTasks> {
  List<AllTasksModel> tasks = [];

  @override
  void initState() {
    super.initState();
    tasks = HiveHelper.taskaBox.values.toList();
  }

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            dividerColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(),
            labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            tabs: [
              Tabs(index: _index, titel: 'All', select: 0),
              Tabs(index: _index, titel: 'In Progress', select: 1),
              Tabs(index: _index, titel: 'Completed', select: 2),
            ],
          ),
          Gap(30),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: HiveHelper.taskaBox.listenable(),
              builder: (context, box, _) {
                List<AllTasksModel> dailyTasks = [];
                List<AllTasksModel> inProgressTasks = [];
                List<AllTasksModel> completedyTasks = [];
                for (var task in box.values) {
                  if (task.date == widget.isSelect) {
                    dailyTasks.add(task);
                    if (task.isCompleted == true) {
                      completedyTasks.add(task);
                    } else {
                      inProgressTasks.add(task);
                    }
                  }
                }

                return TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ViewTasks(tasks: dailyTasks),
                    ViewTasks(tasks: inProgressTasks),
                    ViewTasks(tasks: completedyTasks),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

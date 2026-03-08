import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/Featuer/AddTasks/Screens/add_task_screen.dart';
import 'package:taskati/Featuer/Home/Widgets/day_indecator.dart';
import 'package:taskati/Featuer/Home/Widgets/heder_home_screen.dart';
import 'package:taskati/Featuer/Home/Widgets/homeDatePicker.dart';
import 'package:taskati/Featuer/Home/Widgets/tab_tasks.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/helpers/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              heder_home_screen(),
              Gap(24),
              day_indecator(),
              Gap(29),
              Homedatepicker(),
              Gap(24),
              TabTasks(),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          pushPage(context: context, newScreen: AddTaskScreen());
        },
        child: Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: AppColors.primarycolor,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: AppColors.primarycolor.withOpacity(0.5),
                blurRadius: 18,
                offset: Offset(2, 10),
              ),
            ],
          ),
          child: Icon(Icons.add, color: AppColors.whitecolor),
        ),
      ),
    );
  }
}

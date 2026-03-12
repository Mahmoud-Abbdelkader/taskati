import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/Featuer/AddTasks/Screens/add_task_screen.dart';
import 'package:taskati/Featuer/Home/Widgets/day_indecator.dart';
import 'package:taskati/Featuer/Home/Widgets/heder_home_screen.dart';
import 'package:taskati/Featuer/Home/Widgets/homeDatePicker.dart';
import 'package:taskati/Featuer/Home/Widgets/tab_tasks.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/helpers/navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedValue = DateFormat('dd MMM, yyyy').format(DateTime.now());

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
              Homedatepicker(
                onDateChange: (date) {
                  setState(() {
                    _selectedValue = DateFormat('dd MMM, yyyy').format(date);
                  });
                },
              ),
              Gap(24),
              TabTasks(isSelect: _selectedValue),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          pushPage(context: context, newScreen: AddEditTaskScreen());
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

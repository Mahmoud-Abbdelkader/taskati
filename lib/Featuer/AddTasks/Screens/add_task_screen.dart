import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/Featuer/Home/home_screen.dart';
import 'package:taskati/Models/all_tasks_model.dart';
import 'package:taskati/core/constants/assets.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/helpers/hive_helper.dart';
import 'package:taskati/core/helpers/navigation.dart';
import 'package:taskati/core/styles/text_style.dart';
import 'package:taskati/core/widgets/date__time_card.dart';
import 'package:taskati/core/widgets/mainbottun.dart';

class AddEditTaskScreen extends StatefulWidget {
  const AddEditTaskScreen({super.key, this.task});
  final AllTasksModel? task;
  @override
  State<AddEditTaskScreen> createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String date = DateFormat('dd MMM, yyyy').format(DateTime.now());
  String firstTime = DateFormat('hh:mm a').format(DateTime.now());
  String endtTime = DateFormat(
    'hh:mm a',
  ).format(DateTime.now().add(Duration(hours: 1)));
  String titlecontrol = '';
  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      titleController.text = widget.task?.title ?? '';
      descriptionController.text = widget.task?.description ?? '';
      date = widget.task?.date ?? '';
      firstTime = widget.task?.startTime ?? '';
      endtTime = widget.task?.endTime ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            pop(context: context);
          },
          icon: SvgPicture.asset(AppAssets.arrrowLSvg, height: 24, width: 24),
        ),
        title: Text(
          widget.task != null ? 'Edit Task' : 'Add Task',
          style: AppText.titel,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              Text('Title', style: AppText.discrebtion),
              Gap(8),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  fillColor: AppColors.whitecolor,
                  hoverColor: Colors.transparent,
                ),
              ),
              Gap(18),
              Text('Description', style: AppText.discrebtion),
              Gap(14),
              TextFormField(
                controller: descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  fillColor: AppColors.whitecolor,
                  hoverColor: Colors.transparent,
                ),
              ),
              Gap(41),
              Date_Time_card(
                titel: 'Date',
                subtitel: date,
                leading: SvgPicture.asset(AppAssets.calendarSvg),
                ontap: () => _selectedDate(context),
              ),
              Gap(24),
              Date_Time_card(
                titel: 'Start Time',
                subtitel: firstTime,
                leading: SvgPicture.asset(
                  AppAssets.timeSvg,
                  height: 26,
                  width: 26,
                ),
                ontap: () => _selectedTime(context),
              ),
              Gap(24),
              Date_Time_card(
                titel: 'End Time',
                subtitel: endtTime,
                leading: SvgPicture.asset(
                  AppAssets.timeSvg,
                  height: 26,
                  width: 26,
                ),
                ontap: () async {
                  var selecteTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selecteTime != null) {
                    setState(() {
                      endtTime = selecteTime.format(context);
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 22),
        child: MainBottun(
          titel: widget.task != null ? 'Save' : 'Add Task',
          ontap: () {
            if (widget.task != null) {
              HiveHelper.cacheTask(
                widget.task!.id ?? '',
                widget.task!.copyWith(
                title: titleController.text,
                description: descriptionController.text,
                date: date,
                startTime: firstTime,
                endTime: endtTime,
                isCompleted: false
                ),
              );
            }
            else{String key = DateTime.now().microsecondsSinceEpoch.toString();
            HiveHelper.cacheTask(
              key,
              AllTasksModel(
                id: key,
                title: titleController.text,
                description: descriptionController.text,
                date: date,
                startTime: firstTime,
                endTime: endtTime,
              ),
            );}
            pop(context: context);
          },
        ),
      ),
    );
  }

  Future<void> _selectedDate(BuildContext context) async {
    {
      var selecteDate = await showDatePicker(
        context: context,

        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
      );
      if (selecteDate != null) {
        setState(() {
          date = DateFormat('dd MMM, yyyy').format(selecteDate);
        });
      }
    }
  }

  Future<void> _selectedTime(BuildContext context) async {
    {
      var selecteTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (selecteTime != null) {
        setState(() {
          firstTime = selecteTime.format(context);
        });
      }
    }
  }
}

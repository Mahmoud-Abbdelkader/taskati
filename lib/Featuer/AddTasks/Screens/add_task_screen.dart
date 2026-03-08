import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskati/core/constants/assets.dart';
import 'package:taskati/core/styles/text_style.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset(AppAssets.arrrowLSvg),
        title: Text('Add Task',style: AppText.titel,),
      ),
    );
  }
}
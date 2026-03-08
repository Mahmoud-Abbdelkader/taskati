import 'package:flutter/material.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/styles/text_style.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key, required int index, required this.titel, required this.select})
    : _index = index;

  final int _index;
  final int select;
  final String titel;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 30,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: _index == select ? AppColors.primarycolor : AppColors.fillecolor,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Center(
          child: Text(
            titel,
            style: AppText.subtitel.copyWith(
              color: _index == select
                  ? AppColors.whitecolor
                  : AppColors.primarycolor,
            ),
          ),
        ),
      ),
    );
  }
}

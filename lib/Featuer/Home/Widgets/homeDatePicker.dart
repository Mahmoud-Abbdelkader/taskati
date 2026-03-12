import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/constants/colors.dart';

class Homedatepicker extends StatefulWidget {
  const Homedatepicker({super.key, this.onDateChange});
  final Function(DateTime)? onDateChange;
  @override
  State<Homedatepicker> createState() => _HomedatepickerState();
}

class _HomedatepickerState extends State<Homedatepicker> {
  final DatePickerController _controller = DatePickerController();
  
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      _controller.animateToSelection();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DatePicker(
          DateTime.now().subtract(const Duration(days: 30)),
          controller: _controller,
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColors.primarycolor,
          selectedTextColor: Colors.white,
          height: 90,
          width: 64,
          onDateChange: widget.onDateChange,
        ),
      ],
    );
  }
}

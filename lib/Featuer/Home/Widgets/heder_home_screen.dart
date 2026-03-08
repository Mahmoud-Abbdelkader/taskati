import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/styles/text_style.dart';

class heder_home_screen extends StatelessWidget {
  const heder_home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(radius: 25),
        Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello!', style: AppText.subtitel),
            Gap(4),
            Text('', style: AppText.titel),
          ],
        ),
      ],
    );
  }
}

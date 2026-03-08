import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/Featuer/Start/Screens/complete_screen.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/helpers/navigation.dart';
import 'package:taskati/core/styles/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      pushReplacementPage(context: context, newScreen: CompleteScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/image/Task Done.json'),
            Gap(12),
            Text(
              'Taskati',
              style: TextStyle(
                color: AppColors.blackcolor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(18),
            Text(
              'It’s time to get organized',
              style: AppText.subtitel.copyWith(color: AppColors.seconderycolor),
            ),
          ],
        ),
      ),
    );
  }
}

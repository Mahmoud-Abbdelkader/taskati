import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/Featuer/Start/Screens/splash_screen.dart';
import 'package:taskati/core/styles/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return SafeArea(top: false, bottom: Platform.isAndroid, child: child!);
      },
      theme: AppThemes.lightTheme,
      home: SplashScreen(),
    );
  }
}

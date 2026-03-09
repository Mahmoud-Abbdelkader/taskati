import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:taskati/Featuer/Start/Screens/splash_screen.dart';
import 'package:taskati/core/helpers/hive_helper.dart';
import 'package:taskati/core/styles/themes.dart';
import 'package:taskati/hive/hive_registrar.g.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapters();
  await HiveHelper.init();
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

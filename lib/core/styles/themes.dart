import 'package:flutter/material.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/styles/text_style.dart';

abstract class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'Lexend',
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      titleTextStyle: AppText.titel.copyWith(fontFamily:'Lexend' ),
    ),
    
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.whitecolor,
      filled: true,
      hintStyle: AppText.subtitel,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none
      ),
    )
  );
}

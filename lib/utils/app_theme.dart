import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightMode =ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor

  );
  static ThemeData darkMode =ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,
    primaryColor: AppColors.primarydarkColor
  );

}
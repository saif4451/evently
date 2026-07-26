import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.secTextColor,
      selectedLabelStyle: AppTextStyles.gray12w400.copyWith(
        color: AppColors.primaryColor,
      ),
      unselectedLabelStyle: AppTextStyles.gray12w400.copyWith(
        color: AppColors.secTextColor,
      ),
    ),
  );
  static ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,
    primaryColor: AppColors.primarydarkColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundDarkColor,
      selectedItemColor: AppColors.primarydarkColor,
      unselectedItemColor: AppColors.secTextColor,
      selectedLabelStyle: AppTextStyles.gray12w400.copyWith(
        color: AppColors.primarydarkColor,
      ),
      unselectedLabelStyle: AppTextStyles.gray12w400.copyWith(
        color: AppColors.secTextColor,
      ),
    ),
  );
}

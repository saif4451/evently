import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BottomLarge extends StatelessWidget {
 final String text;
 final VoidCallback onTap;
  const BottomLarge({super.key, required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 340.w,
        height: 48.h,
        padding: EdgeInsets.symmetric( vertical: 9.h),
        decoration: BoxDecoration(
          color: isDark ? AppColors.primarydarkColor : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text,style: AppTextStyles.white20w500,textAlign: TextAlign.center,),
      ),
    );
  }
}

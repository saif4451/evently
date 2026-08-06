import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';

class OnboardingOtherPageItem {
  static Widget build({
    required BuildContext context,
    required bool isDark,
    required String topImagePath,
    required String centerImagePath,
    required String title,
    required String description,
  }) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(topImagePath)),
            SizedBox(height: 30.h),

            Center(child: Image.asset(centerImagePath)),
            SizedBox(height: 16.h),

            Text(
              title,
              style: AppTextStyles.black20w600.copyWith(
                color: isDark ? AppColors.whiteColor : AppColors.blackColor,
              ),
            ),
            SizedBox(height: 6.h),

            Text(
              description,
              textAlign: TextAlign.start,
              style: AppTextStyles.gray16w400.copyWith(
                color: isDark
                    ? AppColors.darkThemesecText
                    : AppColors.secTextColor,
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String loadingText,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            spacing: 18.w,
            children: [
              CircularProgressIndicator(color: AppColors.navyblueColor),
              Text(
                loadingText,
                style: AppTextStyles.black16w500.copyWith(
                  color: AppColors.navyblueColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

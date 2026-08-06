import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: languageProvider.appLanguage == 'ar'
                ? getSelectedLanguageItem('العربية', context)
                : getUnSelectedLanguageItem('العربية', context),
          ),
          SizedBox(height: 16.h),

          InkWell(
            onTap: () {
              languageProvider.changeLanguage('en');
              Navigator.pop(context);
            },
            child: languageProvider.appLanguage == 'en'
                ? getSelectedLanguageItem('English', context)
                : getUnSelectedLanguageItem('English', context),
          ),
        ],
      ),
    );
  }

  Widget getSelectedLanguageItem(String text, BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    var isDark = themeProvider.appTheme == ThemeMode.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyles.black16w500.copyWith(
            color: isDark ? AppColors.primarydarkColor : AppColors.primaryColor,
          ),
        ),
        Icon(
          Icons.check,
          color: isDark ? AppColors.primarydarkColor : AppColors.primaryColor,
        ),
      ],
    );
  }

  Widget getUnSelectedLanguageItem(String text, BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    var isDark = themeProvider.appTheme == ThemeMode.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyles.black16w500.copyWith(
            color: isDark ? AppColors.whiteColor : AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}

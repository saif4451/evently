import 'package:evently/introductuion_screen/language_selection_row.dart';
import 'package:evently/introductuion_screen/theme_selection_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';

class OnboardingPageItem {
  static Widget build({
    required BuildContext context,
    required LanguageProvider languageProvider,
    required ThemeProvider themeProvider,
  }) {
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                isDark
                    ? AppAssets.eventlyOnBordDark
                    : AppAssets.eventlyOnBordLight,
              ),
            ),
            SizedBox(height: 30.h),
            Center(
              child: Image.asset(
                isDark ? AppAssets.onboardingdark1 : AppAssets.onboarding1,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              AppLocalizations.of(context)!.titel1,
              style: AppTextStyles.black20w600.copyWith(
                color: isDark ? AppColors.whiteColor : AppColors.blackColor,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              AppLocalizations.of(context)!.description1,
              textAlign: TextAlign.start,
              style: AppTextStyles.gray16w400.copyWith(
                color: isDark
                    ? AppColors.darkThemesecText
                    : AppColors.secTextColor,
              ),
            ),
            SizedBox(height: 16.h),
            LanguageSelectionRow(
              languageProvider: languageProvider,
              themeProvider: themeProvider,
            ),
            SizedBox(height: 20.h),
            ThemeSelectionRow(themeProvider: themeProvider),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';

class LanguageSelectionRow extends StatelessWidget {
  final LanguageProvider languageProvider;
  final ThemeProvider themeProvider;

  const LanguageSelectionRow({
    super.key,
    required this.languageProvider,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;
    final Color currentPrimary = isDark
        ? AppColors.primarydarkColor
        : AppColors.primaryColor;

    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.language,
          style: AppTextStyles.primary18w500.copyWith(
            color: isDark ? AppColors.whiteColor : AppColors.primaryColor,
          ),
        ),
        const Spacer(),
        _buildLangButton(
          context,
          'en',
          AppLocalizations.of(context)!.english,
          isDark,
          currentPrimary,
        ),
        SizedBox(width: 8.w),
        _buildLangButton(
          context,
          'ar',
          AppLocalizations.of(context)!.arabic,
          isDark,
          currentPrimary,
        ),
      ],
    );
  }

  Widget _buildLangButton(
    BuildContext context,
    String langCode,
    String label,
    bool isDark,
    Color currentPrimary,
  ) {
    final bool isSelected = languageProvider.appLanguage == langCode;
    return InkWell(
      onTap: () => languageProvider.changeLanguage(langCode),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected
              ? currentPrimary
              : (isDark ? Colors.transparent : AppColors.whiteColor),
          borderRadius: BorderRadius.circular(8.r),
          border: (!isSelected && isDark)
              ? Border.all(color: currentPrimary)
              : null,
        ),
        child: Text(
          label,
          style: isSelected
              ? AppTextStyles.white14w600
              : AppTextStyles.primary14w600.copyWith(
                  color: isDark ? AppColors.whiteColor : AppColors.primaryColor,
                ),
        ),
      ),
    );
  }
}

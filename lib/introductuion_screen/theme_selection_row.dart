import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:evently/providers/theme_provider.dart';

class ThemeSelectionRow extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ThemeSelectionRow({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;
    final Color currentPrimary = isDark
        ? AppColors.primarydarkColor
        : AppColors.primaryColor;

    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.theme,
          style: AppTextStyles.primary18w500.copyWith(
            color: isDark ? AppColors.whiteColor : AppColors.primaryColor,
          ),
        ),
        const Spacer(),
        _buildThemeButton(
          context,
          ThemeMode.light,
          'assets/sun.svg',
          isDark,
          currentPrimary,
        ),
        SizedBox(width: 8.w),
        _buildThemeButton(
          context,
          ThemeMode.dark,
          'assets/moon.svg',
          isDark,
          currentPrimary,
        ),
      ],
    );
  }

  Widget _buildThemeButton(
    BuildContext context,
    ThemeMode mode,
    String assetPath,
    bool isDark,
    Color currentPrimary,
  ) {
    final bool isSelected = themeProvider.appTheme == mode;
    return InkWell(
      onTap: () => themeProvider.changeTheme(mode),
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
        child: SvgPicture.asset(
          assetPath,
          colorFilter: ColorFilter.mode(
            isSelected
                ? Colors.white
                : (isDark ? AppColors.whiteColor : AppColors.primaryColor),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

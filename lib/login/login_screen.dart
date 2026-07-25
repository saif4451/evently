import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //  Image Eventely
              Image.asset(
                isDark
                    ? AppAssets.eventlyOnBordDark
                    : AppAssets.eventlyOnBordLight,
              ),
              SizedBox(height: 35.h),
              //login Text
              Text(
                AppLocalizations.of(context)!.loginTo,
                style: AppTextStyles.primary24w600.copyWith(
                  color: themeProvider.appTheme == ThemeMode.dark
                      ? AppColors.whiteColor
                      : AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 24.h),
              buildEmailTextField(isDark: isDark, context: context),
              SizedBox(height: 16.h),
              buildPasswordTextField(isDark: isDark, context: context),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.resetPasswordRouteName,
                  );
                },
                child: Text(
                  textAlign: TextAlign.end,
                  AppLocalizations.of(context)!.forgetPass,
                  style: AppTextStyles.primary14w600.copyWith(
                    color: isDark
                        ? AppColors.primarydarkColor
                        : AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: isDark
                        ? AppColors.primarydarkColor
                        : AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField buildEmailTextField({
    required bool isDark,
    required BuildContext context,
  }) {
    return TextField(
      style: AppTextStyles.primary14w600.copyWith(
        color: isDark ? AppColors.whiteColor : AppColors.secTextColor,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1,
            color: isDark ? AppColors.primarydarkColor : AppColors.secTextColor,
          ),
        ),
        hintText: AppLocalizations.of(context)!.hintEmail,
        hintStyle: AppTextStyles.gray14w400.copyWith(
          color: isDark ? AppColors.whiteColor : AppColors.secTextColor,
        ),
        filled: true,
        fillColor: isDark
            ? AppColors.navyblueColor
            : Color.fromARGB(97, 190, 179, 179),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          child: SvgPicture.asset(
            AppAssets.iconEmail,
            colorFilter: ColorFilter.mode(
              isDark ? AppColors.whiteColor : AppColors.secTextColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1,
            color: isDark ? AppColors.primarydarkColor : AppColors.secTextColor,
          ),
        ),
      ),
    );
  }

  TextField buildPasswordTextField({
    required bool isDark,
    required BuildContext context,
  }) {
    return TextField(
      style: AppTextStyles.primary14w600.copyWith(
        color: isDark ? AppColors.whiteColor : AppColors.secTextColor,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1,
            color: isDark ? AppColors.primarydarkColor : AppColors.secTextColor,
          ),
        ),
        hintText: AppLocalizations.of(context)!.hintPassword,
        hintStyle: AppTextStyles.gray14w400.copyWith(
          color: isDark ? AppColors.whiteColor : AppColors.secTextColor,
        ),
        filled: true,
        fillColor: isDark
            ? AppColors.navyblueColor
            : Color.fromARGB(97, 190, 179, 179),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          child: SvgPicture.asset(
            AppAssets.iconPassword,
            colorFilter: ColorFilter.mode(
              isDark ? AppColors.whiteColor : AppColors.secTextColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1,
            color: isDark ? AppColors.primarydarkColor : AppColors.secTextColor,
          ),
        ),
      ),
    );
  }
}

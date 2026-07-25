import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:evently/widgets/bottom_large.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
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
                SizedBox(height: 45.h),
                BottomLarge(
                  text: AppLocalizations.of(context)!.login,
                  onTap: () {},
                ),
                SizedBox(height: 45.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.donthaveaccount,
                      style: AppTextStyles.black14w400.copyWith(
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.secTextColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signUpRouteName);
                      },
                      child: Text(
                        ' ${AppLocalizations.of(context)!.signup} ',
                        style: AppTextStyles.black14w400.copyWith(
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
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Container(
                      width: 150.w,
                      height: 1,
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.primarydarkColor
                            : AppColors.secTextColor,
                      ),
                    ),
                    SizedBox(width: 7.h),

                    Text(
                      AppLocalizations.of(context)!.or,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.gray16w400.copyWith(
                        color: isDark
                            ? AppColors.primarydarkColor
                            : AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(width: 7.w),
                    Container(
                      width: 150.w,
                      height: 1,
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.primarydarkColor
                            : AppColors.secTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),

                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 340.w,
                    height: 48.h,
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.navyblueColor
                          : AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(16),
                      border: BoxBorder.all(
                        color: isDark
                            ? AppColors.primarydarkColor
                            : AppColors.secTextColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.googleLogo),
                        SizedBox(width: 10.w),
                        Text(
                          AppLocalizations.of(context)!.loginwithGoogle,
                          style: AppTextStyles.white20w500.copyWith(
                            color: isDark
                                ? AppColors.primarydarkColor
                                : AppColors.primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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

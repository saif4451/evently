import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:evently/ui/widgets/bottom_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            spacing: 34.h,
            children: [
              Row(
                // spacing: 60.w,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    height: 32.h,
                    width: 32.w,
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.navyblueColor
                          : AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.primaryColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.forgetPasss,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.primary18w500.copyWith(
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 32.w),
                ],
              ),
              Image.asset(
                isDark
                    ? AppAssets.forgetPasswordDark
                    : AppAssets.forgetPassword,
              ),
              BottomLarge(
                text: AppLocalizations.of(context)!.resetPassword,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

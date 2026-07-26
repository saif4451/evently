import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:evently/widgets/catogry_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;
    List<String> iconList = [
      AppAssets.iconAll,
      AppAssets.iconSport,
      AppAssets.iconBirthday,
    ];
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10.h,
                  children: [
                    Row(
                      children: [
                        //welcome back text
                        Text(
                          AppLocalizations.of(context)!.welcomeBack,
                          style: AppTextStyles.black18w500.copyWith(
                            color: isDark
                                ? AppColors.whiteColor
                                : AppColors.secTextColor,
                          ),
                        ),

                        Text(
                          ' ✨ ',
                          style: AppTextStyles.black18w500.copyWith(
                            color: isDark
                                ? AppColors.whiteColor
                                : AppColors.secTextColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Saif Moamer',
                      style: AppTextStyles.black20w500.copyWith(
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SvgPicture.asset(
                  isDark ? AppAssets.moon : AppAssets.sun,
                  colorFilter: ColorFilter.mode(
                    isDark
                        ? AppColors.primarydarkColor
                        : AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 4.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: isDark
                        ? AppColors.primarydarkColor
                        : AppColors.primaryColor,
                  ),
                  child: Text(
                    languageProvider.appLanguage == 'en' ? "En" : 'Ar',
                    style: AppTextStyles.white14w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 30.h,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CatogryListViewItem(
                    label: AppLocalizations.of(context)!.all,
                    iconPath: iconList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 7.w);
                },
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

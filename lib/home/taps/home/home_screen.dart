import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:evently/widgets/catogry_list_view_item.dart';
import 'package:evently/widgets/event_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;

    List<String> iconList = [
      AppAssets.iconAll,
      AppAssets.iconSport,
      AppAssets.iconBirthday,
      AppAssets.iconHeart,
      AppAssets.book,
      AppAssets.book,
    ];

    List<String> eventName = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.bookclub,
      AppLocalizations.of(context)!.exhibition,
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
                  children: [
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.welcomeBack,
                          style: AppTextStyles.black14w400.copyWith(
                            color: isDark
                                ? AppColors.whiteColor
                                : AppColors.secTextColor,
                          ),
                        ),
                        Text(
                          '✨',
                          style: AppTextStyles.black14w400.copyWith(
                            color: isDark
                                ? AppColors.whiteColor
                                : AppColors.secTextColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
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
                SizedBox(width: 8.w),
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
            SizedBox(height: 24.h),
            // list view catogery iteeeeeems
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: CatogryListViewItem(
                      isSelected: selectedIndex == index,
                      label: eventName[index],
                      iconPath: iconList[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 7.w);
                },
                itemCount: eventName.length,
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return EventItemWidget(
                    imageDark: AppAssets.birthdayDark,
                    imageLight: AppAssets.birthdayLight,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16.h);
                },
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

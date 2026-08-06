import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:evently/ui/widgets/language_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 80.h),
          Center(
            child: Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.asset('assets/image 11.png', fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Saif Moamer',
            textAlign: TextAlign.center,
            style: AppTextStyles.black20w600.copyWith(
              color: isDark ? AppColors.whiteColor : AppColors.blackColor,
            ),
          ),
          Text(
            'saifm.route@gmail.com',
            textAlign: TextAlign.center,
            style: AppTextStyles.black14w400.copyWith(
              color: isDark ? AppColors.whiteColor : AppColors.secTextColor,
            ),
          ),
          SizedBox(height: 30.h),
          buildItemWidget(
            isDark: isDark,
            text: AppLocalizations.of(context)!.darkmode,
            item: Switch(
              activeThumbColor: AppColors.whiteColor,
              inactiveThumbColor: AppColors.whiteColor,
              value: isDark,
              trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return AppColors.whitGrayColor;
                }
                return Colors.transparent;
              }),
              onChanged: (value) {
                themeProvider.changeTheme(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
              },
              activeTrackColor: AppColors.primarydarkColor,
              inactiveTrackColor: const Color.fromARGB(255, 223, 215, 215),
            ),
          ),
          SizedBox(height: 16.h),
          buildItemWidget(
            isDark: isDark,
            text: AppLocalizations.of(context)!.language,
            item: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: isDark
                      ? AppColors.navyblueColor
                      : AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.r),
                    ),
                  ),
                  builder: (context) => const LanguageBottomSheet(),
                );
              },
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: isDark
                    ? AppColors.primarydarkColor
                    : AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          buildItemWidget(
            isDark: isDark,
            text: AppLocalizations.of(context)!.logout,
            item: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.loginRouteName);
              },
              child: SvgPicture.asset(AppAssets.iconLogout),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemWidget({
    required bool isDark,
    required String text,
    required Widget item,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.navyblueColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.primarydarkColor : AppColors.border,
          width: 2.w,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
        title: Text(
          text,
          style: AppTextStyles.black16w500.copyWith(
            color: isDark ? AppColors.whiteColor : AppColors.blackColor,
          ),
        ),
        trailing: item,
      ),
    );
  }
}

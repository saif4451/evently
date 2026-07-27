import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EventItemWidget extends StatefulWidget {
  final String imageDark;
  final String imageLight;
  const EventItemWidget({
    super.key,
    required this.imageDark,
    required this.imageLight,
  });

  @override
  State<EventItemWidget> createState() => _EventItemWidgetState();
}

class _EventItemWidgetState extends State<EventItemWidget> {
  @override
  Widget build(BuildContext context) {
    bool isSelectedHeart = false;
    var themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;
    return Container(
      height: 193.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.sp),
        border: Border.all(
          color: isDark ? AppColors.primarydarkColor : AppColors.border,
          width: 2,
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(isDark ? widget.imageDark : widget.imageLight),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isDark
                          ? AppColors.primarydarkColor
                          : AppColors.border,
                      width: 2,
                    ),
                  ),

                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5.h),
                    child: Text(
                      '21 ${AppLocalizations.of(context)!.jan}',
                      style: AppTextStyles.white16w500.copyWith(
                        color: isDark
                            ? AppColors.primarydarkColor
                            : AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isDark
                    ? AppColors.navyblueColor
                    : AppColors.backgroundColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(
                        context,
                      )!.meetingforUpdatingTheDevelopmentMethod,
                      style: AppTextStyles.primary14w600.copyWith(
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      isSelectedHeart == true;
                      setState(() {});
                    },
                    child: SvgPicture.asset(AppAssets.iconHeart),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

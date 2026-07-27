import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CatogryListViewItem extends StatefulWidget {
  final String label;
  final String iconPath;
  final bool isSelected;

  const CatogryListViewItem({
    super.key,
    required this.label,
    required this.iconPath,
    required this.isSelected,
  });

  @override
  State<CatogryListViewItem> createState() => _CatogryListViewItemState();
}

class _CatogryListViewItemState extends State<CatogryListViewItem> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: isDark
                ? (widget.isSelected
                      ? Colors.transparent
                      : AppColors.primarydarkColor)
                : AppColors.backgroundColor,
          ),
          color: isDark
              ? (widget.isSelected
                    ? AppColors.primarydarkColor
                    : AppColors.navyblueColor)
              : (widget.isSelected
                    ? AppColors.primaryColor
                    : AppColors.whiteColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              widget.iconPath,
              colorFilter: ColorFilter.mode(
                widget.isSelected
                    ? AppColors.whiteColor
                    : (isDark
                          ? AppColors.primarydarkColor
                          : AppColors.primaryColor),
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 15.w),
            Text(
              widget.label,
              style: AppTextStyles.white16w500.copyWith(
                color: widget.isSelected
                    ? AppColors.whiteColor
                    : (isDark ? AppColors.whiteColor : AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

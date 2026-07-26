import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CatogryListViewItem extends StatelessWidget {
  final String label;
  final String iconPath;
  const CatogryListViewItem({
    super.key,
    required this.label,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: isDark ? AppColors.primarydarkColor : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            SizedBox(width: 15.w),
            Text(label, style: AppTextStyles.white16w500),
          ],
        ),
      ),
    );
  }
}

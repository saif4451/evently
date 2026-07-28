import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:evently/utils/app_validators.dart';
import 'package:evently/widgets/bottom_large.dart';
import 'package:evently/widgets/catogry_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  int selectedIndex = 0;
  List<String> eventPicturelight = [
    AppAssets.sportLight,
    AppAssets.birthdayLight,
    AppAssets.meetingLight,
    AppAssets.bookclubLight,
    AppAssets.exhibitionLight,
  ];
  List<String> eventPictureDark = [
    AppAssets.sportDark,
    AppAssets.birthdayDark,
    AppAssets.meetingDark,
    AppAssets.bookclubDark,
    AppAssets.exhibitionDark,
  ];
  List<String> iconList = [
    AppAssets.iconSport,
    AppAssets.iconBirthday,
    AppAssets.iconHeart,
    AppAssets.book,
    AppAssets.book,
  ];

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;
    List<String> eventName = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.bookclub,
      AppLocalizations.of(context)!.exhibition,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context)!.addevent,
          style: AppTextStyles.black18w500.copyWith(
            color: isDark ? AppColors.whiteColor : AppColors.blackColor,
          ),
        ),
        centerTitle: true,
        leading: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(
              color: isDark ? Colors.transparent : AppColors.whiteColor,
              border: Border.all(
                color: isDark ? AppColors.primarydarkColor : AppColors.border,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: isDark ? AppColors.whiteColor : AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 12.h),
              Container(
                height: 193.h,
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.navyblueColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark
                        ? AppColors.primarydarkColor
                        : AppColors.border,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Image.asset(
                      isDark
                          ? eventPictureDark[selectedIndex]
                          : eventPicturelight[selectedIndex],
                      key: ValueKey<int>(selectedIndex),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
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
              SizedBox(height: 16.h),
              Text(
                AppLocalizations.of(context)!.title,
                style: AppTextStyles.black16w500.copyWith(
                  color: isDark ? AppColors.whiteColor : AppColors.blackColor,
                ),
              ),
              SizedBox(height: 8.h),
              buildAppTextFormField(
                controller: titleController,
                isDark: isDark,
                context: context,
                maxLines: 1,
                hintText: AppLocalizations.of(context)!.eventTitle,
                validatorText: 'Title',
              ),
              SizedBox(height: 16.h),
              Text(
                AppLocalizations.of(context)!.description,
                style: AppTextStyles.black16w500.copyWith(
                  color: isDark ? AppColors.whiteColor : AppColors.blackColor,
                ),
              ),
              SizedBox(height: 8.h),
              buildAppTextFormField(
                controller: descriptionController,
                isDark: isDark,
                context: context,
                maxLines: 5,
                minLines: 5,
                hintText: AppLocalizations.of(context)!.eventDescription,
                validatorText: 'Description',
              ),
              SizedBox(height: 16.h),
              Row(
                spacing: 8.w,
                children: [
                  SvgPicture.asset(AppAssets.iconDate),
                  Text(
                    AppLocalizations.of(context)!.eventDate,
                    style: AppTextStyles.black16w500.copyWith(
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => selectDate(context, isDark),
                    child: Text(
                      selectedDate == null
                          ? AppLocalizations.of(context)!.choosedate
                          : "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}",
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
              SizedBox(height: 16.h),
              Row(
                spacing: 8.w,
                children: [
                  SvgPicture.asset(AppAssets.iconTime),
                  Text(
                    AppLocalizations.of(context)!.eventTime,
                    style: AppTextStyles.black16w500.copyWith(
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => selectTime(context, isDark),
                    child: Text(
                      selectedTime == null
                          ? AppLocalizations.of(context)!.choosetime
                          : selectedTime!.format(context),
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
              SizedBox(height: 35.h),
              BottomLarge(
                text: AppLocalizations.of(context)!.addevent,
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildAppTextFormField({
    required TextEditingController controller,
    required bool isDark,
    required BuildContext context,
    required int maxLines,
    int? minLines,
    required String hintText,
    required String validatorText,
  }) {
    return TextFormField(
      controller: controller,
      validator: (value) =>
          AppValidators.validateRequired(value, validatorText, context),
      maxLines: maxLines,
      minLines: minLines,
      style: AppTextStyles.primary14w600.copyWith(
        color: isDark ? AppColors.whiteColor : AppColors.blackColor,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1,
            color: isDark ? AppColors.primarydarkColor : AppColors.border,
          ),
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.gray14w400.copyWith(
          color: isDark ? AppColors.secTextColorDark : AppColors.secTextColor,
        ),
        filled: true,
        fillColor: isDark ? AppColors.navyblueColor : AppColors.whiteColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1,
            color: isDark ? AppColors.primarydarkColor : AppColors.border,
          ),
        ),
      ),
    );
  }

  Future<void> selectTime(BuildContext context, bool isDark) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: isDark
                ? ColorScheme.dark(
                    primary: AppColors.primarydarkColor,
                    onPrimary: Colors.white,
                    surface: AppColors.navyblueColor,
                    onSurface: Colors.white,
                  )
                : ColorScheme.light(
                    primary: AppColors.primaryColor,
                    onPrimary: Colors.white,
                    surface: Colors.white,
                    onSurface: Colors.black,
                  ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Future<void> selectDate(BuildContext context, bool isDark) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: isDark
                ? ColorScheme.dark(
                    primary: AppColors.primarydarkColor,
                    onPrimary: Colors.white,
                    surface: AppColors.navyblueColor,
                    onSurface: Colors.white,
                  )
                : ColorScheme.light(
                    primary: AppColors.primaryColor,
                    onPrimary: Colors.white,
                    surface: Colors.white,
                    onSurface: Colors.black,
                  ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

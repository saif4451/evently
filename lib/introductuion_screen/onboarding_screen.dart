import 'package:evently/home/home_screen.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String mode = 'dark';

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return IntroductionScreen(
      bodyPadding: EdgeInsets.zero,
      controlsPadding: EdgeInsets.zero,
      globalBackgroundColor: AppColors.backgroundColor,

      pages: [
        _buildPage(
          context: context,
          languageProvider: languageProvider,
          topImagePath: AppAssets.eventlyOnBordLight,
          centerImagePath: AppAssets.onboarding1,
          title: AppLocalizations.of(context)!.titel1,
          description: AppLocalizations.of(context)!.description1,
        ),
      ],

      showNextButton: false,
      showBackButton: false,
      showSkipButton: false,
      showDoneButton: false,
      isProgress: false,

      globalFooter: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
        child: SizedBox(
          width: double.infinity,
          height: 50.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onPressed: () => _goToHome(context),
            child: Text(
              AppLocalizations.of(context)!.bottomOnBoard1,
              style: AppTextStyles.white20w500,
            ),
          ),
        ),
      ),
    );
  }

  PageViewModel _buildPage({
    required BuildContext context,
    required LanguageProvider languageProvider,
    required String topImagePath,
    required centerImagePath,
    required String title,
    required String description,
  }) {
    return PageViewModel(
      title: '',
      bodyWidget: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(topImagePath)),

              SizedBox(height: 30.h),

              Center(child: Image.asset(centerImagePath)),

              SizedBox(height: 16.h),

              Text(title, style: AppTextStyles.black20w600),

              SizedBox(height: 6.h),

              Text(
                description,
                textAlign: TextAlign.start,
                style: AppTextStyles.gray16w400,
              ),

              SizedBox(height: 16.h),

              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: AppTextStyles.primary18w500,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      languageProvider.changeLanguage('en');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: languageProvider.appLanguage == 'en'
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.english,
                        style: languageProvider.appLanguage == 'en'
                            ? AppTextStyles.white14w600
                            : AppTextStyles.primary14w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  InkWell(
                    onTap: () {
                      languageProvider.changeLanguage('ar');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: languageProvider.appLanguage == 'ar'
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.arabic,
                        style: languageProvider.appLanguage == 'ar'
                            ? AppTextStyles.white14w600
                            : AppTextStyles.primary14w600,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: AppTextStyles.primary18w500,
                  ),
                  const Spacer(),

                  InkWell(
                    onTap: () {
                      setState(() {
                        mode = 'light';
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: mode == 'light'
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: SvgPicture.asset(
                        'assets/sun.svg',
                        colorFilter: ColorFilter.mode(
                          mode == 'light'
                              ? Colors.white
                              : AppColors.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 8.w),

                  InkWell(
                    onTap: () {
                      setState(() {
                        mode = 'dark';
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: mode == 'dark'
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: SvgPicture.asset(
                        'assets/moon.svg',
                        colorFilter: ColorFilter.mode(
                          mode == 'dark'
                              ? Colors.white
                              : AppColors.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),

      decoration: const PageDecoration(
        fullScreen: false,
        pageColor: AppColors.backgroundColor,
      ),
    );
  }

  void _goToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}

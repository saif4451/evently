import 'package:evently/home/home_screen.dart';
import 'package:evently/introductuion_screen/onboarding_other_page_item.dart.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final GlobalKey<IntroductionScreenState> introKey =
      GlobalKey<IntroductionScreenState>();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;

    return IntroductionScreen(
      key: introKey,
      bodyPadding: EdgeInsets.zero,
      controlsPadding: EdgeInsets.zero,
      globalBackgroundColor: isDark
          ? AppColors.backgroundDarkColor
          : AppColors.backgroundColor,
      onChange: (index) {
        setState(() {
          currentIndex = index;
        });
      },

      pages: [
        PageViewModel(
          title: '',
          bodyWidget: OnboardingPageItem.build(
            context: context,
            languageProvider: languageProvider,
            themeProvider: themeProvider,
          ),
          decoration: PageDecoration(
            fullScreen: false,
            pageColor: isDark
                ? AppColors.backgroundDarkColor
                : AppColors.backgroundColor,
          ),
        ),
        PageViewModel(
          title: '',
          bodyWidget: OnboardingOtherPageItem.build(
            context: context,
            isDark: isDark,
            topImagePath: isDark
                ? AppAssets.eventlyOnBordDark
                : AppAssets.eventlyOnBordLight,
            centerImagePath: isDark
                ? AppAssets.onboardingdark2
                : AppAssets.onboarding2,
            title: AppLocalizations.of(context)!.titel2,
            description: AppLocalizations.of(context)!.description2,
          ),
          decoration: PageDecoration(
            fullScreen: false,
            pageColor: isDark
                ? AppColors.backgroundDarkColor
                : AppColors.backgroundColor,
          ),
        ),
        PageViewModel(
          title: '',
          bodyWidget: OnboardingOtherPageItem.build(
            context: context,
            isDark: isDark,
            topImagePath: isDark
                ? AppAssets.eventlyOnBordDark
                : AppAssets.eventlyOnBordLight,
            centerImagePath: isDark
                ? AppAssets.onboardingdark3
                : AppAssets.onboarding3,
            title: AppLocalizations.of(context)!.titel3,
            description: AppLocalizations.of(context)!.description3,
          ),
          decoration: PageDecoration(
            fullScreen: false,
            pageColor: isDark
                ? AppColors.backgroundDarkColor
                : AppColors.backgroundColor,
          ),
        ),
        PageViewModel(
          title: '',
          bodyWidget: OnboardingOtherPageItem.build(
            context: context,
            isDark: isDark,
            topImagePath: isDark
                ? AppAssets.eventlyOnBordDark
                : AppAssets.eventlyOnBordLight,
            centerImagePath: isDark
                ? AppAssets.onboardingdark4
                : AppAssets.onboarding4,
            title: AppLocalizations.of(context)!.titel4,
            description: AppLocalizations.of(context)!.description4,
          ),
          decoration: PageDecoration(
            fullScreen: false,
            pageColor: isDark
                ? AppColors.backgroundDarkColor
                : AppColors.backgroundColor,
          ),
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
              backgroundColor: isDark
                  ? AppColors.primarydarkColor
                  : AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onPressed: () {
              int totalPages = 4;
              if (currentIndex < totalPages - 1) {
                introKey.currentState?.animateScroll(currentIndex + 1);
              } else {
                _goToHome(context);
              }
            },
            child: Text(
              currentIndex == 0
                  ? AppLocalizations.of(context)!.bottomOnBoard1
                  : (currentIndex == 3
                        ? "Get Started"
                        : AppLocalizations.of(context)!.bottomOnBoard),
              style: AppTextStyles.white20w500,
            ),
          ),
        ),
      ),
    );
  }

  void _goToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}

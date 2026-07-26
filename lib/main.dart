import 'package:evently/home/main_screen.dart';
import 'package:evently/home/taps/profile/profile_tab.dart';
import 'package:evently/introductuion_screen/onboarding_screen.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/login/login_screen.dart';
import 'package:evently/login/reset_password.dart';
import 'package:evently/login/sign_up_screen.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          initialRoute: AppRoutes.onboardingRouteName,
          routes: {
            AppRoutes.onboardingRouteName: (context) => OnboardingScreen(),
            AppRoutes.loginRouteName: (context) => LoginScreen(),
            AppRoutes.signUpRouteName: (context) => SignUpScreen(),
            AppRoutes.resetPasswordRouteName: (context) => ResetPassword(),
            AppRoutes.homeRouteName: (context) => MainScreen(),
            AppRoutes.profileTabRouteName: (context) => ProfileTab(),
          },
          theme: AppTheme.lightMode,
          darkTheme: AppTheme.darkMode,
          themeMode: themeProvider.appTheme,
          locale: Locale(languageProvider.appLanguage),
        );
      },
    );
  }
}

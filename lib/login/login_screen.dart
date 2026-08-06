import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/my_user.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:evently/utils/app_validators.dart';
import 'package:evently/ui/widgets/bottom_large.dart';
import 'package:evently/utils/dialog_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.appTheme == ThemeMode.dark;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image Eventely
                  Image.asset(
                    isDark
                        ? AppAssets.eventlyOnBordDark
                        : AppAssets.eventlyOnBordLight,
                  ),
                  SizedBox(height: 35.h),
                  // login Text
                  Text(
                    AppLocalizations.of(context)!.loginTo,
                    style: AppTextStyles.primary24w600.copyWith(
                      color: themeProvider.appTheme == ThemeMode.dark
                          ? AppColors.whiteColor
                          : AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  buildEmailTextFormField(isDark: isDark, context: context),
                  SizedBox(height: 16.h),
                  buildPasswordTextFormField(isDark: isDark, context: context),
                  SizedBox(height: 16.h),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.resetPasswordRouteName,
                      );
                    },
                    child: Text(
                      textAlign: TextAlign.end,
                      AppLocalizations.of(context)!.forgetPass,
                      style: AppTextStyles.primary14w600.copyWith(
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
                  SizedBox(height: 45.h),
                  BottomLarge(
                    text: AppLocalizations.of(context)!.login,
                    onTap: () {
                      login();
                    },
                  ),
                  SizedBox(height: 45.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.donthaveaccount,
                        style: AppTextStyles.black14w400.copyWith(
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.secTextColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.signUpRouteName,
                          );
                        },
                        child: Text(
                          ' ${AppLocalizations.of(context)!.signup} ',
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
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Container(
                        width: 150.w,
                        height: 1,
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.primarydarkColor
                              : AppColors.border,
                        ),
                      ),
                      SizedBox(width: 7.h),
                      Text(
                        AppLocalizations.of(context)!.or,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.gray16w400.copyWith(
                          color: isDark
                              ? AppColors.primarydarkColor
                              : AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(width: 7.w),
                      Container(
                        width: 150.w,
                        height: 1,
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.primarydarkColor
                              : AppColors.border,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 340.w,
                      height: 48.h,
                      padding: EdgeInsets.symmetric(vertical: 9.h),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.googleLogo),
                          SizedBox(width: 10.w),
                          Text(
                            AppLocalizations.of(context)!.loginwithGoogle,
                            style: AppTextStyles.white20w500.copyWith(
                              color: isDark
                                  ? AppColors.primarydarkColor
                                  : AppColors.primaryColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      DialogUtils.showLoading(context: context, loadingText: 'loading...');

      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text,
            );

        print('User UID: ${credential.user?.uid}');

        MyUser myUser = MyUser(
          userId: credential.user?.uid ?? '',
          mail: credential.user?.email ?? emailController.text.trim(),
          name:
              credential.user?.displayName ??
              '', 
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUser(myUser);

        if (!mounted) return;

        Navigator.pop(context); 

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Successfully! 🎉'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
      } on FirebaseAuthException catch (e) {
        if (!mounted) return;
        Navigator.pop(context);

        String errorMessage = 'Authentication failed';
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided.';
        } else if (e.code == 'invalid-credential') {
          errorMessage = 'Invalid email or password.';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
        );
      } catch (e) {
        if (!mounted) return;
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
        );
      }
    }
  }

  TextFormField buildEmailTextFormField({
    required bool isDark,
    required BuildContext context,
  }) {
    return TextFormField(
      controller: emailController,
      validator: (value) => AppValidators.validateEmail(value, context),
      style: AppTextStyles.primary14w600.copyWith(
        color: isDark ? AppColors.whiteColor : AppColors.secTextColor,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1,
            color: isDark ? AppColors.primarydarkColor : AppColors.border,
          ),
        ),
        hintText: AppLocalizations.of(context)!.hintEmail,
        hintStyle: AppTextStyles.gray14w400.copyWith(
          color: isDark ? AppColors.whiteColor : AppColors.secTextColor,
        ),
        filled: true,
        fillColor: isDark ? AppColors.navyblueColor : AppColors.whiteColor,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          child: SvgPicture.asset(
            AppAssets.iconEmail,
            colorFilter: ColorFilter.mode(
              isDark ? AppColors.whiteColor : AppColors.secTextColor,
              BlendMode.srcIn,
            ),
          ),
        ),
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

  TextFormField buildPasswordTextFormField({
    required bool isDark,
    required BuildContext context,
  }) {
    return TextFormField(
      controller: passwordController,
      validator: (value) => AppValidators.validatePassword(value, context),
      obscureText: obscurePassword,
      style: AppTextStyles.primary14w600.copyWith(
        color: isDark ? AppColors.whiteColor : AppColors.secTextColor,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1,
            color: isDark ? AppColors.primarydarkColor : AppColors.border,
          ),
        ),
        hintText: AppLocalizations.of(context)!.hintPassword,
        hintStyle: AppTextStyles.gray14w400.copyWith(
          color: isDark ? AppColors.whiteColor : AppColors.secTextColor,
        ),
        filled: true,
        fillColor: isDark ? AppColors.navyblueColor : AppColors.whiteColor,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          child: SvgPicture.asset(
            AppAssets.iconPassword,
            colorFilter: ColorFilter.mode(
              isDark ? AppColors.whiteColor : AppColors.secTextColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: isDark ? AppColors.whiteColor : AppColors.secTextColor,
          ),
          onPressed: () {
            setState(() {
              obscurePassword = !obscurePassword;
            });
          },
        ),
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
}

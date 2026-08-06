import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_text_styles.dart';
import 'package:evently/utils/app_validators.dart';
import 'package:evently/ui/widgets/bottom_large.dart';
import 'package:evently/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
            padding: EdgeInsets.symmetric(horizontal: 17.w),
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
                  // signup Text
                  Text(
                    AppLocalizations.of(context)!.createyouraccount,
                    style: AppTextStyles.primary24w600.copyWith(
                      color: themeProvider.appTheme == ThemeMode.dark
                          ? AppColors.whiteColor
                          : AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Name Field
                  buildEmailTextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppLocalizations.of(context)!.cannotbeempty;
                      }
                      return null;
                    },
                    isDark: isDark,
                    context: context,
                    text: AppLocalizations.of(context)!.enteryourname,
                    iconPath: AppAssets.iconProfile,
                  ),
                  SizedBox(height: 16.h),

                  // Email Field
                  buildEmailTextFormField(
                    controller: emailController,
                    validator: (value) =>
                        AppValidators.validateEmail(value, context),
                    isDark: isDark,
                    context: context,
                    text: AppLocalizations.of(context)!.hintEmail,
                    iconPath: AppAssets.iconEmail,
                  ),
                  SizedBox(height: 16.h),

                  // Password Field
                  buildPasswordTextFormField(
                    controller: passwordController,
                    validator: (value) =>
                        AppValidators.validatePassword(value, context),
                    isDark: isDark,
                    context: context,
                    texthint: AppLocalizations.of(context)!.hintPassword,
                    obscureText: obscurePassword,
                    onVisibilityPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                  SizedBox(height: 16.h),

                  // Confirm Password Field
                  buildPasswordTextFormField(
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppLocalizations.of(context)!.cannotbeempty;
                      }
                      if (value != passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    isDark: isDark,
                    context: context,
                    texthint: AppLocalizations.of(context)!.confirmyourpassword,
                    obscureText: obscureConfirmPassword,
                    onVisibilityPressed: () {
                      setState(() {
                        obscureConfirmPassword = !obscureConfirmPassword;
                      });
                    },
                  ),
                  SizedBox(height: 40.h),

                  // SignUp Button
                  BottomLarge(
                    text: AppLocalizations.of(context)!.signup,
                    onTap: () {
                      register();
                    },
                  ),
                  SizedBox(height: 30.h),

                  // Already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.alreadyhaveanaccount,
                        style: AppTextStyles.black14w400.copyWith(
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.secTextColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.popAndPushNamed(
                            context,
                            AppRoutes.loginRouteName,
                          );
                        },
                        child: Text(
                          ' ${AppLocalizations.of(context)!.login} ',
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

                  // or divider
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

                  // Google Sign-In Button
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      DialogUtils.showLoading(context: context, loadingText: 'loading...');

      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text,
            );

        await credential.user?.updateDisplayName(nameController.text.trim());

        if (!mounted) return;

        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account Created Successfully! 🎉'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
      } on FirebaseAuthException catch (e) {
        if (!mounted) return;
        Navigator.pop(context);
        String errorMessage = 'Registration failed';
        if (e.code == 'weak-password') {
          errorMessage = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'The account already exists for that email.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'The email address is invalid.';
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
    required TextEditingController controller,
    required String? Function(String?)? validator,
    required String text,
    required bool isDark,
    required BuildContext context,
    required String iconPath,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
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
        hintText: text,
        hintStyle: AppTextStyles.gray14w400.copyWith(
          color: isDark ? AppColors.whiteColor : AppColors.secTextColor,
        ),
        filled: true,
        fillColor: isDark ? AppColors.navyblueColor : AppColors.whiteColor,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          child: SvgPicture.asset(
            iconPath,
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
    required TextEditingController controller,
    required String? Function(String?)? validator,
    required bool isDark,
    required BuildContext context,
    required String texthint,
    required bool obscureText,
    required VoidCallback onVisibilityPressed,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
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
        hintText: texthint,
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
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: isDark ? AppColors.whiteColor : AppColors.secTextColor,
          ),
          onPressed: onVisibilityPressed,
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

import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AppValidators {
  static String? validateRequired(
    String? value,
    String fieldName,
    BuildContext context,
  ) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName ${AppLocalizations.of(context)!.cannotbeempty}';
    }
    return null;
  }

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.emailcannotbeempty;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return AppLocalizations.of(context)!.pleaseenteravalidemailaddress;
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.passwordcannotbeempty;
    }
    if (value.length < 6) {
      return AppLocalizations.of(context)!.passwordmustbeatleast6characterslong;
    }
    return null;
  }
}

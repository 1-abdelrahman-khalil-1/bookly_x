import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../data/lang_pref.dart';
import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: AppColors.black),
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 18,
        fontFamily: isArabic ? Constants.arFont : Constants.enFont,
      ),
      centerTitle: false,
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary2;
        }
        return AppColors.primaryLightHover;
      }),
    ),
    canvasColor: AppColors.white,
    primaryColor: AppColors.primary,
    fontFamily: isArabic ? Constants.arFont : Constants.enFont,
    scaffoldBackgroundColor: AppColors.white,
    platform: Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondary,
      primary: AppColors.primary,
    ),
  );
}

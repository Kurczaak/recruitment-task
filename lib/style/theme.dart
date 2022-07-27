import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/style/app_text_style.dart';
import 'package:flutter_recruitment_task/style/colors.dart';

class AppTheme {
  final theme = ThemeData(
    primaryColor: AppColors.primaryColor,
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: AppColors.primaryColor,
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: AppColors.primaryColor,
      cursorColor: AppColors.primaryColor,
      selectionColor: AppColors.primaryColor,
    ),
    colorScheme: ColorScheme.light(
      secondary: AppColors.white,
      primary: AppColors.primaryColor,
      surface: AppColors.primaryColor,
    ),
    fontFamily: Platform.isAndroid ? AppTextStyle.fontFamilyAndroid : AppTextStyle.fontFamilyIos,
    scaffoldBackgroundColor: AppColors.white,
  );
}

import 'package:contact_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManager {
  static ThemeData getThemeData() => ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backGroundColor
  );
}